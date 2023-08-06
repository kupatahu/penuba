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
  late Animation<Alignment> _alignmentAnimation;
  final _alignment = ValueNotifier(Alignment.bottomCenter);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationController.addListener(() {
      _alignment.value = _alignmentAnimation.value;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  GestureDetector(
      onPanDown: (details) {
        _animationController.stop();
      },
      onPanUpdate: (details) {
        final updatedAlignment = _alignment.value +
            Alignment(
              0,
              details.delta.dy / size.height,
            );
        _alignment.value = updatedAlignment;
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: AnimatedBuilder(
        animation: _alignment,
        builder: (context, child) {
          return Align(
            alignment: _alignment.value,
            child: child,
          );
        },
        child: SafeArea(
          bottom: false,
          child: Container(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 100,
              maxHeight: size.height * 0.6,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(44)),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(4.0),
            clipBehavior: Clip.hardEdge,
            child: widget.route.builder(context),
          ),
        ),
      ),
    );
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _alignmentAnimation = _animationController.drive(
      AlignmentTween(
        begin: _alignment.value,
        end: Alignment.bottomCenter,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
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
