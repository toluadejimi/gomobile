import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> body;
  final Widget? decoratedText;
  final Color backgroundColor;
  final bool canPop;
  final String? title, subTitle;
  final VoidCallback? onBackPress;
  const CustomScaffold({
    super.key,
    required this.body,
    this.backgroundColor = primaryColor,
    this.title,
    this.subTitle,
    this.canPop = false,
    this.onBackPress,
    this.decoratedText,
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
              height: 50,
            ),
            canPop || title != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        canPop
                            ? GestureDetector(
                                onTap: onBackPress,
                                child: const Icon(Icons.arrow_back))
                            : const SizedBox(),
                        const SizedBox(width: 20),
                        title != null
                            ? Text(
                                title!,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitle != null
                      ? Text(
                          subTitle!,
                          style: const TextStyle(fontSize: 16, color: grey),
                        )
                      : const SizedBox(),
                      decoratedText != null ? decoratedText!: const SizedBox(),
                  const SizedBox(
                    height: 70,
                  ),
                  ...body
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
