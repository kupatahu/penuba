import 'package:flutter/material.dart';
import 'package:penuba/widget/slide_popup_route.dart';
import 'package:rubber/rubber.dart';

class RubberBottomSheetRoute<T> extends SlidePopupRoute<T> {
  final Widget Function(BuildContext, ScrollController) builder;

  RubberBottomSheetRoute({required this.builder, super.isDismissible = true});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _RubberBottomSheet(route: this);
  }
}

class _RubberBottomSheet<T> extends StatelessWidget {
  final RubberBottomSheetRoute<T> route;

  const _RubberBottomSheet({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final animationController = RubberAnimationController(
      vsync: route.navigator!,
      lowerBoundValue: AnimationControllerValue(percentage: 0.0),
      halfBoundValue: AnimationControllerValue(percentage: 0.5),
      upperBoundValue: AnimationControllerValue(percentage: 0.95),
      initialValue: 0.5,
      springDescription: SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: Stiffness.LOW,
        ratio: DampingRatio.LOW_BOUNCY,
      ),
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    animationController.animationState.addListener(() {
      if (animationController.animationState.value ==
          AnimationState.collapsed) {
        Navigator.of(context).pop();
      }
    });

    final scrollController = ScrollController();

    return RubberBottomSheet(
      animationController: animationController,
      scrollController: scrollController,
      lowerLayer: const SizedBox(),
      upperLayer: Builder(
        builder: (context) => route.builder(context, scrollController),
      ),
    );
  }
}
