
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => WalletViewModel(),
      builder: (context, model, child) => const Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Center(child: Text('WALLET'),)
        ),
      ),
    );
  }
}
