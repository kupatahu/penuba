import 'package:flutter/material.dart';

class TripCreationPage extends StatelessWidget {
  final ScrollController scrollController;

  const TripCreationPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Trip'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        controller: scrollController,
        children: [
          const Text('data'),
          FilledButton(onPressed: () {}, child: const Text('Submit'))
        ],
      ),
    );
  }
}
