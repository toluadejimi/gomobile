import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class SendMoneyToGomoblieUsersView extends StatelessWidget {
 const SendMoneyToGomoblieUsersView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SendMoneyToGomoblieUsersViewmodel>.reactive(
     builder: (context, model, child) => CustomScaffold(
      title: 'Send Money to Gomobilez Users ',
      canPop: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7.h,),
            InputField(
                          hint: 'Email',
                          controller: model.emailTextController,
                        ),
                        SizedBox(height: 20.h,),
            InputField(
                          hint: 'Amount',
                          controller: model.amountController,
                        ),
                        SizedBox(height: 37.h,),
                  LongButton(text: 'Continue', click: () {}), 
                  SizedBox(height: 30.h,),
                BaseText('Recent Transaction',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 16.h,),
                 ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical:8.h ),
                    child: Container(
                       height: 79,
                      decoration: ShapeDecoration(
                        color: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(children: [
                        Padding(
                          padding:  EdgeInsets.fromLTRB(19.w,17.h,8.w,14.h),
                          child: RoundedIconButton(
                            click: () {},
                            icon: Icon(Icons.arrow_upward_outlined,color: white,),
                            color: red,
                            padding: 8,
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(0,22.h,19.h,20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseText(
                                      'David Kings',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    BaseText(
                                      '\$20',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                
                            SizedBox(height: 7.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BaseText(
                                  'wallet-Out',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: textGrey,
                                ),
                                BaseText(
                                  '3mins ago',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: textGrey,
                                ),
                              ],
                            ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),      
          ],
        ),
      ),
     viewModelBuilder: () => SendMoneyToGomoblieUsersViewmodel(),
   );
 }
}