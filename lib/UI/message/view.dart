import 'package:country_picker/country_picker.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => MessageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Center(
            child: Text('MESSAGE'),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,15,100),
          child: FloatingActionButton(
            backgroundColor: white,
            onPressed: () {
              _showCountryPicker(context);
            },
            child: SvgIconInCircle(svgAssetPath: 'assets/images/svg/mi_message.svg',
            circleColor: white,
            ),
          ),
        ),
      ),
    );
  }
}

void _showCountryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      // Optional. Can be used to exclude(remove) one or more countries from the countries list (optional).
      exclude: <String>['KN', 'MF'],
      favorite: <String>['SE'],
      // Optional. Shows phone code before the country name.
      showPhoneCode: true,
      onSelect: (Country country) {
        print('Selected country: ${country.displayName}');
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottom sheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }