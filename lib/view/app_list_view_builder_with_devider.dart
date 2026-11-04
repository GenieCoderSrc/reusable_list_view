import 'package:flutter/material.dart';
import 'package:reusable_list_view/type_dev/list_type_dev.dart';

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
  final ChildBuilder<T>
      child; // 🎯 Upgraded from dynamic Function to ChildBuilder<T> for strict typing (item, index)
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
        return child(itemData, index); // 🎯 Pass both itemData and index
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
