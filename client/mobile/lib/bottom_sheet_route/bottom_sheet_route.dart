import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class BottomSheetRoute<T> extends PopupRoute<T> {
  final Widget Function(BuildContext, ScrollController) builder;
  final bool isDismissible;

  BottomSheetRoute({required this.builder, this.isDismissible = true});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _BottomSheet(route: this);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeInOutExpo;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

class _BottomSheet<T> extends StatelessWidget {
  final BottomSheetRoute<T> route;

  const _BottomSheet({super.key, required this.route});

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
      upperLayer: Builder(builder: (context) => route.builder(context, scrollController)),
    );
  }
}
