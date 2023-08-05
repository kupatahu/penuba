import 'package:flutter/material.dart';

abstract class SlidePopupRoute<T> extends PopupRoute<T> {
  final bool isDismissible;

  SlidePopupRoute({this.isDismissible = true});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  String? get barrierLabel => null;

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
