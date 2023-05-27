import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import '../counter_app_with_cubit/app.dart';

import 'counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}
