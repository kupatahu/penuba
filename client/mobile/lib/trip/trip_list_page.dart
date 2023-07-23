import 'package:flutter/material.dart';
import 'package:penuba/trip/trip.dart';

class TripListPage extends StatelessWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
      ),
      body: const TripListBody(),
      floatingActionButton: TripListFab(
        onPressed: () {},
      ),
    );
  }
}

class TripListBody extends StatelessWidget {
  const TripListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TripList();
  }
}

class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    final trips = [
      Trip(
        destination: 'Machu Picchu',
        start: DateTime.parse('2023-10-10T14:00:00+0700'),
        end: DateTime.parse('2023-10-20T14:00:00+0700'),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        itemCount: trips.length,
        prototypeItem: TripCard(trip: trips.first),
        itemBuilder: (context, index) => TripCard(
          trip: trips[index],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trip.destination,
            ),
            Text(trip.formattedDuration),
            Row(
              children: [
                const Icon(Icons.access_time_filled, size: 13),
                const SizedBox(width: 5),
                Text(trip.startsIn),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TripListFab extends StatelessWidget {
  const TripListFab({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
