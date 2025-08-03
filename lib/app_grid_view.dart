import 'package:flutter/material.dart';

class AppGridView<T> extends StatelessWidget {
  const AppGridView({
    super.key,
    this.listData,
    this.child,
    this.backgroundColor,
    this.crossAxisCount = 3,
    this.childHeight = 6,
    this.childWidth = 3.5,
    this.verticalPadding = 2.0,
    this.horizontalPadding = 4.0,
    this.shrinkWrap = false,
    this.physics,
  });

  final List<T>? listData;
  final Function? child;
  final Color? backgroundColor;
  final int crossAxisCount;
  final double childHeight;
  final double childWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    final double itemHeight = screenSize.height / childHeight;
    final double itemWidth = screenSize.width / childWidth;
    final double childAspectRatio = (itemWidth / itemHeight);

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: listData?.length ?? 0,
      itemBuilder: (_, int index) {
        final T itemData = listData![index];
        return child!(itemData) as Widget;
      },
    );
  }
}
