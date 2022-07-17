import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveScreen(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return webScreenLayout;
      }
      return mobileScreenLayout;
    });
  }
}
