import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'dial_visible_state.dart';

class DialVisibleCubit extends Cubit<DialVisibleState> {
  DialVisibleCubit() : super(DialVisibleState(true, ScrollController())) {
    _initialize();
  }

  Future<void> _initialize() async {
    final scrollController = state.scrollController;
    // Perform any initial setup for the scroll controller
    emit(state.copyWith(scrollController: scrollController));
  }

  void setScrollController(ScrollController scrollController) {
    // Dispose the old scroll controller
    state.scrollController.dispose();

    emit(state.copyWith(scrollController: scrollController));
  }

  void setDialVisible({bool isVisible = false}) {
    emit(state.copyWith(dialVisible: isVisible));
  }

  @override
  Future<void> close() {
    state.scrollController.dispose();
    return super.close();
  }
}
