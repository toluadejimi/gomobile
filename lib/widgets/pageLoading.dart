import 'package:flutter/material.dart';

class PageLoadingScreen extends StatefulWidget {
  final int item;
  final Widget widget;

  const PageLoadingScreen({Key? key, required this.item, required this.widget})
      : super(key: key);

  @override
  _PageLoadingScreenState createState() => _PageLoadingScreenState();
}

class _PageLoadingScreenState extends State<PageLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 50),
        itemBuilder: (context, index) =>
            FadeTransition(opacity: _animationController, child: widget.widget),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: widget.item);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
