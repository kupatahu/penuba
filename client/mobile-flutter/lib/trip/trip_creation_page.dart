import 'package:flutter/material.dart';
import 'package:penuba/widget/secondary_app_bar.dart';

class TripCreationPage extends StatelessWidget {
  final ScrollController scrollController;

  const TripCreationPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(
        title: Text('Create New Trip'),
      ),
      body: Placeholder(),
    );
  }
}
