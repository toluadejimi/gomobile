
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tab;
  final Widget desktop;
  const ResponsiveLayout({required this.desktop, required this.mobile, required this.tab, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      return constraints.maxHeight<768 ? mobile: constraints.maxHeight<1024? tab: desktop; 
    });
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class ResponsiveLayout extends StatefulWidget {
//   final Widget mobile;
//   final Widget tab;
//   final Widget desktop;
//   const ResponsiveLayout({required this.desktop, required this.mobile, required this.tab, Key? key}) : super(key: key);

//   @override
//   State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
// }

// class _ResponsiveLayoutState extends State<ResponsiveLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
//       return constraints.maxHeight<768 ? mobile:  
//     })
//   }
// }