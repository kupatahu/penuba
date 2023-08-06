import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:penuba/widget/slide_popup_route.dart';

class RoundedModalRoute<T> extends SlidePopupRoute<T> {
  final Widget Function(BuildContext) builder;

  RoundedModalRoute({required this.builder, super.isDismissible = true});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _RoundedModal(route: this);
  }
}

class _RoundedModal<T> extends StatefulWidget {
  final RoundedModalRoute<T> route;

  const _RoundedModal({super.key, required this.route});

  @override
  State<_RoundedModal<T>> createState() => _RoundedModalState<T>();
}

class _RoundedModalState<T> extends State<_RoundedModal<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  final _offset = ValueNotifier(const Offset(0, 0));

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationController.addListener(() {
      _offset.value = _offsetAnimation.value;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GestureDetector(
      onPanDown: (details) {
        _animationController.stop();
      },
      onPanUpdate: (details) {
        _updateVerticalOffset(details, mediaQuery);
      },
      onPanEnd: (details) {
        _snapBack(details, mediaQuery);
      },
      child: AnimatedBuilder(
        animation: _offset,
        builder: (context, child) {
          return Transform.translate(
            offset: _offset.value,
            child: child,
          );
        },
        child: SafeArea(
          bottom: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(44)),
                color: Colors.white,
              ),
              padding: mediaQuery.viewInsets,
              margin: const EdgeInsets.all(4.0),
              clipBehavior: Clip.hardEdge,
              child: widget.route.builder(context),
            ),
          ),
        ),
      ),
    );
  }

  void _updateVerticalOffset(
    DragUpdateDetails details,
    MediaQueryData mediaQuery,
  ) {
    if (details.delta.dy != 0) {
      _offset.value += Offset(
        0,
        details.delta.dy / 4,
      );
    }
  }

  void _snapBack(
    DragEndDetails details,
    MediaQueryData mediaQuery,
  ) {
    _offsetAnimation = _animationController.drive(
      Tween(
        begin: _offset.value,
        end: const Offset(0, 0),
      ),
    );

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final pixelsPerSecond = details.velocity.pixelsPerSecond;
    final size = mediaQuery.size;

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _animationController.animateWith(simulation);
  }
}
