import 'package:flutter/material.dart';

class ModalGrabber extends StatelessWidget {
  const ModalGrabber({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 50,
        height: 5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
