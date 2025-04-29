import 'package:builder_state/no_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:reusable_list_view/type_dev/list_type_dev.dart';
import 'package:text_field_builder/text_field_builder.dart';
import 'package:builder_state/builder_state.dart';
import 'app_list_view_builder_with_scroll_controller.dart';

class AppListViewBuilderWithSearch<T> extends StatelessWidget {
  const AppListViewBuilderWithSearch({
    super.key,
    this.listData,
    this.searchController,
    this.onChanged,
    this.onSubmitted,
    this.onTapIcon,
    required this.child,
    this.onScrollList,
    this.scrollController,
    this.listWidget,
    this.textFieldWidget,
    this.bgColor,
  });

  final List<T>? listData;
  final VoidCallback? onTapIcon;
  final ChildBuilder<T> child;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<bool>? onScrollList;
  final ScrollController? scrollController;
  final TextEditingController? searchController;
  final Widget? textFieldWidget;
  final Widget? listWidget;
  final Color? bgColor;

  // final FieldModel? fieldModel;

  @override
  Widget build(BuildContext context) {
    final bool hasListItem = listData != null && listData!.isNotEmpty;
    return Column(
      children: <Widget>[
        textFieldWidget ??
            AppSearchField(
              fieldModel: FieldModel(
                controller: searchController,
                onChanged: onChanged,
                onTapSuffixIcon: onTapIcon,
                bgColor: bgColor,
              ),
            ),
        Expanded(
          child: hasListItem
              ? listWidget ??
                  AppListViewBuilderWithScrollController<T>(
                    listData: listData,
                    controller: scrollController,
                    isControlDefaultDialVisibility: true,
                    onScroll: onScrollList,
                    child: child,
                  )
              : const NoItemBuilder(),
        ),
      ],
    );
  }
}
