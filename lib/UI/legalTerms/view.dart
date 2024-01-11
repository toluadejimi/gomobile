import 'package:flutter/material.dart';
import 'package:gomobilez/UI/legalTerms/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:stacked/stacked.dart';

class LegalTermsView extends StatelessWidget {
  const LegalTermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LegalTermsViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
          title: 'Legal Terms',
          canPop: true,
          onBackPress: () {
            model.navigationService.back();
          },
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  'GDPR Compliance Policy',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: () {
                    model.navigationService.navigateToWebPageView(url: 'https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&country=NG&language=en&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df');
                }, icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: dividerGrey,
              height: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  'Copyright Policy',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: () {
                    model.navigationService.navigateToWebPageView(url: 'https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&country=NG&language=en&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df');
                }, icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: dividerGrey,
              height: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  'Privacy Policy',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: () {
                  model.navigationService.navigateToWebPageView(url: 'https://agreementservice.svs.nike.com/rest/agreement?agreementType=termsOfUse&country=NG&language=en&requestType=redirect&uxId=4fd2d5e7db76e0f85a6bb56721bd51df');
                }, icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: dividerGrey,
              height: 3,
            ),
            SizedBox(
              height: 30,
            ),
          ])),
      viewModelBuilder: () => LegalTermsViewModel(),
    );
  }
}
