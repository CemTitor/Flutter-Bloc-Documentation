import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    ///Bloc requires us to register event handlers via the on<Event> API, as opposed to functions in Cubit. An event handler is responsible for converting any incoming events into zero or more outgoing states.
    on<CounterIncrementPressed>((event, emit) {
      ///In below we registered an EventHandler to manage all CounterIncrementPressed events
      ///For each incoming CounterIncrementPressed event we can access the current state of the bloc via the state getter and emit(state + 1).
      addError(Exception('increment error!'), StackTrace.current);
      emit(state + 1);
    });
  }

  ///Called whenever a new event is added to the Bloc
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }

  ///When a Bloc emits a new state, a Change occurs.Change occurs just before the state of the Bloc is updated. A Change consists of the currentState and the nextState.
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  ///One key differentiating factor between Bloc and Cubit is that because Bloc is event-driven, we are also able to capture information about what triggered the state change.
  /// We can do this by overriding onTransition.
  /// The change from one state to another is called a Transition. A Transition consists of the current state, the event, and the next state. onTransition is invoked before onChange and contains the event which triggered the change from currentState to nextState
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
