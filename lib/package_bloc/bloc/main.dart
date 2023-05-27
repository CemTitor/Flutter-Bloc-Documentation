import 'package:bloc/bloc.dart';

import 'bloc_observer.dart';
import 'counter_bloc.dart';

Future<void> main() async {
  // ///1) Basic Usage
  // final bloc = CounterBloc();
  // print(bloc.state); // 0
  // bloc.add(CounterIncrementPressed());
  //
  // ///await Future.delayed(Duration.zero) is added to ensure we wait for the next event-loop iteration (allowing the EventHandler to process the event).
  // await Future.delayed(Duration.zero);
  // print(bloc.state); // 1
  // await bloc.close();
  //
  // ///2) Stream Usage
  // ///Bloc is special type of Stream. Which means we can also subscribe to a Bloc for real-time updates to its state.
  // final bloc = CounterBloc();
  //
  // ///below code we are subscribing to the CounterBloc and calling print on each state change.
  // final subscription = bloc.stream.listen(print); // 1
  // bloc.add(CounterIncrementPressed());
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();
  // await bloc.close();
  //
  // ///3) Observing ONE Bloc, onChange method is called whenever a new state is emitted.
  // CounterBloc()
  //   ..add(CounterIncrementPressed())
  //   ..close();

  ///4) Observing ALL Blocs with BlocObserver
  Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterIncrementPressed())
    ..close();
}
