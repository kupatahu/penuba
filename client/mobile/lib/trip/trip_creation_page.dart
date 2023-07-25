import 'package:flutter/material.dart';

class TripCreationPage extends StatelessWidget {
  final ScrollController scrollController;

  const TripCreationPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create New Trip'),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 100,
          controller: scrollController,
          itemBuilder: (context, index) => ListTile(
            title: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
