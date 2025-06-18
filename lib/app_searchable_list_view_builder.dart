import 'package:flutter/material.dart';
import 'package:reusable_list_view/type_dev/list_type_dev.dart';
import 'package:state_msg_builder/state_msg_builder.dart';
import 'package:text_field_builder/text_field_builder.dart';

import 'app_list_view_builder_with_scroll_controller.dart';

class AppSearchableListViewBuilder<T> extends StatelessWidget {
  const AppSearchableListViewBuilder({
    super.key,
    required this.childBuilder,
    this.listData,
    this.searchController,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.onTapSearchIcon,
    this.scrollController,
    this.onScrollList,
    this.customTextField,
    this.customListView,
    this.backgroundColor,
    this.emptyBuilder,
    this.showSearchOnlyIfDataExists = true,
    this.emptyMessage,
    this.emptyTextColor,
  });

  // Data
  final List<T>? listData;

  // Search
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final VoidCallback? onTapSearchIcon;

  // Scroll and List
  final ScrollController? scrollController;
  final ValueChanged<bool>? onScrollList;
  final ChildBuilder<T> childBuilder;

  // Custom Widgets
  final Widget? customTextField;
  final Widget? customListView;
  final Widget? emptyBuilder;

  // UI
  final Color? backgroundColor;
  final bool showSearchOnlyIfDataExists;
  final String? emptyMessage;
  final Color? emptyTextColor;

  bool get _hasItems => listData != null && listData!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!showSearchOnlyIfDataExists || _hasItems)
          customTextField ?? _buildDefaultSearchField(),
        const SizedBox(height: 8),
        Expanded(child: _hasItems ? _buildListView() : _buildEmptyView()),
      ],
    );
  }

  Widget _buildDefaultSearchField() {
    return AppSearchField(
      fieldModel: FieldModel(
        controller: searchController,
        onChanged: onSearchChanged,
        onSubmitted: onSearchSubmitted,
        onTapSuffixIcon: onTapSearchIcon,
        bgColor: backgroundColor,
      ),
    );
  }

  Widget _buildListView() {
    return customListView ??
        AppListViewBuilderWithScrollController<T>(
          listData: listData,
          controller: scrollController,
          isControlDefaultDialVisibility: true,
          onScroll: onScrollList,
          child: childBuilder,
        );
  }

  Widget _buildEmptyView() {
    return emptyBuilder ??
        StateMessageBuilder(
          title: emptyMessage ?? 'No items available',
          txtColor: emptyTextColor,
        );
  }
}
