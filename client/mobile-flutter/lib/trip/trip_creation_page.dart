import 'package:flutter/material.dart';
import 'package:penuba/widget/modal_grabber.dart';

class TripCreationPage extends StatelessWidget {
  final ScrollController scrollController;

  const TripCreationPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                const ModalGrabber(),
                AppBar(
                  title: const Text('Create New Trip'),
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      // color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Where do you want to go next?',
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Date',
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Create'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
