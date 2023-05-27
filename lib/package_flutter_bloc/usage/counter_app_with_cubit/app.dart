import 'package:flutter/material.dart';

import '../counter_app_with_cubit/counter/view/counter_page.dart';

/// A [MaterialApp] which sets the `home` to [CounterPage].
/// We are extending MaterialApp because CounterApp is a MaterialApp. In most cases, we're going to be creating StatelessWidget or StatefulWidget instances and composing widgets in build but in this case there are no widgets to compose so it's simpler to just extend MaterialApp.
class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const CounterPage());
}
