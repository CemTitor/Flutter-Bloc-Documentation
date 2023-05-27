import 'package:bloc/bloc.dart';
import 'package:bloc_docs/cubit/counter_cubit.dart';
import 'bloc_observer.dart';

void main() async {
//   ///1) Basic Usage
//   final cubit = CounterCubit();
//   print(cubit.state); // 0
//   cubit.increment();
//   print(cubit.state); // 1
//   cubit.close();
//
//   ///2) Stream Usage
//   final cubit = CounterCubit();
//   final subscription = cubit.stream.listen(print);
//   cubit.increment();
//   await Future.delayed(Duration.zero);
//   await subscription.cancel();
//   await cubit.close();
//
//   ///3) Observing ONE Cubit, onChange method is called whenever a new state is emitted.
//   CounterCubit()
//     ..increment()
//     ..close();
//
  ///4) Observing ALL Cubits with BlocObserver

  Bloc.observer = SimpleBlocObserver();

  CounterCubit()
    ..increment()
    ..close();
}
