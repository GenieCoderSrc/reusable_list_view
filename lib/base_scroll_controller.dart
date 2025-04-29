import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_list_view/view_models/dial_visible_cubit.dart';

import 'type_dev/list_type_dev.dart';

class BaseScrollControllerWidget<T> extends StatefulWidget {
  const BaseScrollControllerWidget({
    super.key,
    required this.listBuilder,
    this.scrollController,
    this.isControlDefaultDialVisibility = false,
    this.scrollControllerInit,
    this.onScroll,
    this.shouldDispose = false,
  });

  final ListBuilder<T> listBuilder;
  final ScrollController? scrollController;
  final bool isControlDefaultDialVisibility;
  final Function? scrollControllerInit;
  final ValueChanged<bool>? onScroll;
  final bool shouldDispose;

  @override
  _BaseScrollControllerWidgetState<T> createState() =>
      _BaseScrollControllerWidgetState<T>();
}

class _BaseScrollControllerWidgetState<T>
    extends State<BaseScrollControllerWidget<T>> with TickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ??
        context.read<DialVisibleCubit>().state.scrollController;
    _initializeScrollController();
  }

  void _initializeScrollController() {
    if (widget.isControlDefaultDialVisibility) {
      _setupDefaultDialVisibility();
    } else if (widget.scrollControllerInit != null) {
      widget.scrollControllerInit!();
    }
  }

  void _setupDefaultDialVisibility() {
    if (_scrollController.hasClients) {
      _scrollController.addListener(_handleScrollDirection);
    }
  }

  void _handleScrollDirection() {
    // The onScroll execution may not required. so, remove it if not needed.
    // execute the provided onScroll method when scroll forward
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      widget.onScroll?.call(true);
    }

    // set some widget visibility e.g, floating action button on scroll
    context.read<DialVisibleCubit>().setDialVisible(
        isVisible: _scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
  }

  @override
  void dispose() {
    if (widget.shouldDispose) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.listBuilder();
  }
}
