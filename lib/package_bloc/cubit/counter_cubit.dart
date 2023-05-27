import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    addError(Exception('increment error'), StackTrace.current);
    emit(state + 1);
  }

  void decrement() {
    // addError(Exception('decrement error'), StackTrace.current);
    emit(state - 1);
  }

  ///When a Cubit emits a new state, a Change occurs.Change occurs just before the state of the Cubit is updated. A Change consists of the currentState and the nextState.
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
