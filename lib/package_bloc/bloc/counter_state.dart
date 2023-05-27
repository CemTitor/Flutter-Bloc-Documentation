part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

///OR
///
// enum CounterStatus { initial, incremented, decremented }
//
// class CounterState {
//   const CounterState({
//     this.status = CounterStatus.initial,
//   });
//
//   final CounterStatus status;
// }
