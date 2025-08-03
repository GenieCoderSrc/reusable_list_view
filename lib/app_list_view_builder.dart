import 'package:flutter/material.dart';
import 'package:reusable_list_view/type_dev/list_type_dev.dart';

class AppListViewBuilder<T> extends StatelessWidget {
  const AppListViewBuilder({
    super.key,
    this.listData,
    required this.child,
    this.scrollController,
    this.reverse = false,
  });

  final List<T>? listData;
  final ChildBuilder<T> child;
  final ScrollController? scrollController;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: reverse,
      controller: scrollController,
      itemCount: listData?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final T itemData = listData![index];
        return child(itemData);
      },
    );
  }
}
