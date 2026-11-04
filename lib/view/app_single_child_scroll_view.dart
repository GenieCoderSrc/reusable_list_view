import 'package:flutter/material.dart';

class AppSingleChildScrollView extends StatelessWidget {
  const AppSingleChildScrollView({
    super.key,
    this.child,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  });

  final Widget? child;
  final ScrollController? controller;
  final Axis scrollDirection;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: scrollDirection,
      reverse: reverse,
      child: child,
    );
  }
}
