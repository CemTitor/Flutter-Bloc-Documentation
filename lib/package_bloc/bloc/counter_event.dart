part of 'counter_bloc.dart';

///Difference between Bloc and Cubit is that Bloc relies on EVENTS to trigger state changes, while Cubit relies on FUNCTIONS to trigger state changes.
/// In Cubit calling a function on a Bloc and directly emitting a new state,but in Blocs, receiving events and convert the incoming events into outgoing states.
///
/// Events are the input to a Bloc. They are commonly added in response to user interactions such as button presses or lifecycle events like page loads.
@immutable
abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}
