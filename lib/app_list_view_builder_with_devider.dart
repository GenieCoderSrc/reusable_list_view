import 'package:flutter/material.dart';

class AppListViewBuilderWithDivider<T> extends StatelessWidget {
  const AppListViewBuilderWithDivider({
    super.key,
    this.listData,
    required this.child,
    this.scrollController,
    this.dividerThickness,
    this.dividerColor,
    this.separatorWidget,
  });

  final List<T>? listData;
  final Function child;
  final ScrollController? scrollController;
  final double? dividerThickness;
  final Color? dividerColor;
  final Widget? separatorWidget;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: listData?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final T itemData = listData![index];
        return child(itemData) as Widget;
      },
      separatorBuilder: (BuildContext context, int index) {
        return separatorWidget ??
            Divider(
              thickness: dividerThickness ?? 1,
              color: dividerColor ?? Colors.grey[300],
            );
      },
    );
  }
}
