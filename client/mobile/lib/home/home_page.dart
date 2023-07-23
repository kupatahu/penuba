import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penuba/di/di.dart';
import 'package:penuba/home/counter.dart';
import 'package:penuba/home/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit = get<CounterCubit>();

  @override
  void initState() {
    counterCubit.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: HomeBody(
        onTapCounter: counterCubit.reset,
      ),
      floatingActionButton: HomeFab(
        onPressed: counterCubit.increment,
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  final VoidCallback onTapCounter;

  const HomeBody({super.key, required this.onTapCounter});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final counterCubit = get<CounterCubit>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          GestureDetector(
            onTap: widget.onTapCounter,
            child: BlocBuilder<CounterCubit, Counter>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeFab extends StatelessWidget {
  const HomeFab({super.key, required this.onPressed});

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
