import 'package:flutter/material.dart';

import 'base_scroll_controller.dart';

class AppSingleChildScrollViewWithScrollController<T>
    extends BaseScrollControllerWidget<T> {
  AppSingleChildScrollViewWithScrollController({
    super.key,
    Widget? child,
    super.scrollController,
    super.isControlDefaultDialVisibility,
    super.scrollControllerInit,
    super.onScroll,
    super.shouldDispose,
    bool reverse = false,
    Axis scrollDirection = Axis.vertical,
  }) : super(
         listBuilder: () => SingleChildScrollView(
           controller: scrollController,
           scrollDirection: scrollDirection,
           reverse: reverse,
           child: child,
         ),
       );
}
