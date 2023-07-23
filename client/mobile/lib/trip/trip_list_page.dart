import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penuba/di/di.dart';
import 'package:penuba/trip/trip.dart';
import 'package:penuba/trip/trip_cubit.dart';

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

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final tripCubit = get<TripCubit>();

  @override
  void initState() {
    tripCubit.fetchAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: BlocBuilder<TripCubit, List<Trip>>(
        bloc: tripCubit,
        builder: (context, trips) {
          return ListView.builder(
            itemCount: trips.length,
            prototypeItem:
                trips.isNotEmpty ? TripCard(trip: trips.first) : null,
            itemBuilder: (context, index) => TripCard(
              trip: trips[index],
            ),
          );
        },
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
