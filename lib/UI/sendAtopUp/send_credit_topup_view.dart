import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/UI/sendAtopUp/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/serviceProvider.dart';
import 'package:gomobilez/services/serviceCost.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/dropdown.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:stacked/stacked.dart';
import '../../models/countries.dart';

class SendCreditTopUp extends StatelessWidget {
  const SendCreditTopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendAtopUpViewmodel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
          canPop: true,
          title: 'Send a top up',
          onBackPress: model.navigationService.back,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  CustomIconButton(
                      widget: Column(
                        children: [Icon(Icons.air), Text('Airtime')],
                      ),
                      click: () {}),
                  SizedBox(width: 15.w),
                  CustomIconButton(
                      widget: Column(
                        children: [Icon(Icons.credit_card), Text('Data')],
                      ),
                      click: () {})
                ],
              ),
              SizedBox(height: 10.h),
              DropDown(
                hint: 'Country',
                value: model.selectedCountry,
                loading: model.countriesLoadingState,
                items: model.countryMenuItems
                    .map<DropdownMenuItem<Country>>((Country value) {
                  return DropdownMenuItem<Country>(
                    value: value,
                    child: Text(
                      "${value.name}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) async {
                  if (newValue != null) {
                    await model.setCountryController(newValue);
                  }
                },
              ),
              SizedBox(height: 8.h),
              DropDown(
                hint: 'Service Provider',
                value: model.selectedProvider,
                loading: model.serviceProviderLoadingState,
                items: model.serviceProvider
                    .map<DropdownMenuItem<ServiceProvider>>(
                        (ServiceProvider value) {
                  return DropdownMenuItem<ServiceProvider>(
                    value: value,
                    child: Text(
                      value.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    model.setServiceProviderController(newValue);
                  }
                },
              ),
              SizedBox(height: 8.h),
              DropDown(
                loading: model.serviceProductLoadingState,
                value: model.selectedProducts,
                hint: 'Service Products',
                items: model.serviceProducts
                    .map<DropdownMenuItem<ServiceProduct>>(
                        (ServiceProduct value) {
                  return DropdownMenuItem<ServiceProduct>(
                    value: value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${value.productName}",
                        ),
                        Text(
                          "${value.fixedPrice.toLowerCase() == 'no' ? "\$${(value.min * value.rate).toInt()} - \$${(value.max * value.rate).toInt()}" : "\$${(value.min * value.rate).toInt()}"}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    model.setServiceProductController(newValue);
                  }
                },
              ),
              SizedBox(height: 8.h),
              Visibility(
                visible: model.selectedProducts != null &&
                    model.selectedProducts!.fixedPrice.toLowerCase() == 'no',
                child: Column(
                  children: [
                    InputField(
                      hint: 'Amount (USD)',
                      controller: model.amountController,
                      keyboardType: TextInputType.number,
                      onChanged: (val) => {model.onChangeAmount(val)},
                      prefixIcon: Container(
                        width: 20.w,
                        alignment: Alignment.center,
                        child: BaseText(
                          '\$',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                            'Min - ${model.selectedProducts != null && model.selectedProducts!.fixedPrice.toLowerCase() == 'no' ? (model.selectedProducts!.min * model.selectedProducts!.rate).toInt() : ''}'),
                        BaseText(
                            'Max - ${model.selectedProducts != null && model.selectedProducts!.fixedPrice.toLowerCase() == 'no' ? (model.selectedProducts!.max * model.selectedProducts!.rate).toInt() : ''}')
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 260.w,
                    child: InputField(
                      hint: 'Phone Number',
                      controller: model.phoneNumberController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: CustomIconButton(
                      click: () {
                        model.navigateToContactPage();
                      },
                      radius: 200,
                      horizontalPadding: 12,
                      verticalPadding: 12,
                      color: white36,
                      widget: SvgPicture.asset(
                        'assets/images/svg/bxs_contact.svg',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 72.h),
              LongButton(
                  text: 'Continue',
                  loading: model.buttonLoadingState,
                  click: () {
                    model.buyCredit();
                  })
            ],
          )),
      viewModelBuilder: () => SendAtopUpViewmodel(),
    );
  }
}
