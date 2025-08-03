import 'package:flutter/material.dart';
import 'package:reusable_list_view/type_dev/list_type_dev.dart';

import 'app_list_view_builder.dart';
import 'base_scroll_controller.dart';

class AppListViewBuilderWithScrollController<T>
    extends BaseScrollControllerWidget<T> {
  AppListViewBuilderWithScrollController({
    super.key,
    required ChildBuilder<T> child,
    final List<T>? listData,
    final ScrollController? controller,
    super.isControlDefaultDialVisibility,
    super.scrollControllerInit,
    super.onScroll,
    super.shouldDispose,
    final bool reverse = false,
    final Axis scrollDirection = Axis.vertical,
  }) : super(
         scrollController: controller,
         listBuilder:
             () => AppListViewBuilder<T>(
               scrollController: controller,
               child: (T item) => child(item),
               listData: listData,
               reverse: reverse,
             ),
       );
}
