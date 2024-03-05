import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool canPop;
  final String? title;
  final VoidCallback? onBackPress;
  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = primaryColor,
    this.title,
    this.canPop = false,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            canPop || title != null
                ? Visibility(
                    visible: canPop || title != null,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: canPop,
                            child: GestureDetector(
                              onTap: onBackPress,
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          Visibility(
                            visible: canPop,
                            child: SizedBox(width: 20),
                          ),
                          Visibility(
                            visible: title != null,
                            child: Text(
                              title!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: body,
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      )),
    );
  }
}
