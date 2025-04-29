part of 'dial_visible_cubit.dart';

class DialVisibleState {
  final bool dialVisible;
  final ScrollController scrollController;

  DialVisibleState(this.dialVisible, this.scrollController);

  DialVisibleState copyWith({
    bool? dialVisible,
    ScrollController? scrollController,
  }) {
    return DialVisibleState(
      dialVisible ?? this.dialVisible,
      scrollController ?? this.scrollController,
    );
  }
}
