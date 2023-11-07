
import 'package:gomobilez/UI/contact/emptyContactList.dart';
import 'package:gomobilez/UI/contact/loading.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/pageLoading.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => CustomScaffold(
        body: FutureBuilder(
          future: model.getContactHistory(),
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data as List;
                return data.isNotEmpty
                    ? Center(
                        child: Text(
                          data.length.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    : ContactEmptyList(model: model,);
              } else {
                return const Center(
                  child: Text(
                    'SOMETHING WENT WRONG',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }
            } else {
              return const Center(
                child:
                    PageLoadingScreen(item: 5, widget: ContactLoadingScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}
