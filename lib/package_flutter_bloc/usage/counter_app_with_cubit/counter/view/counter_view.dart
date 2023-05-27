///The CounterView is responsible for rendering the current count and rendering two FloatingActionButtons to increment/decrement the counter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter.dart';

/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and NOTIFIES IT in response to user input.
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        ///A BlocBuilder is used to wrap the Text widget in order to UPDATE THE TEXT any time the CounterCubit state CHANGES.
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            ///ONLY the Text widget is wrapped in a BlocBuilder because that is the only widget THAT NEEDS TO BE REBUILD in response to state changes in the CounterCubit. AVOID unnecessarily wrapping widgets that DON'T NEED TO BE rebuilt when a state changes
            return Text('$state', style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),

            ///In addition, context.read<CounterCubit>() is used to look-up the closest CounterCubit instance.
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
