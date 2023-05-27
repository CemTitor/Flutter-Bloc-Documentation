import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(state + 1),
    );
    on<CounterDecrementPressed>(
      (event, emit) => emit(state - 1),
    );
  }
}

class BlocB extends Bloc<BlocB, int> {
  BlocB(super.initialState);
}

class BlocC extends Bloc<BlocC, int> {
  BlocC(super.initialState);
}

class ProfileBloc extends Bloc<ProfileBloc, int> {
  ProfileBloc(super.initialState);
}
