import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///1) The below usage is ERROR PRONE because the Text widget will NOT BE REBUILT if the state of the bloc changes. Its wrong usage. Use BlocBuilder or context.watch instead in order to REBUILD IN RESPONSE to state changes.
    final falseState = context.read<CounterBloc>().state;

    ///2) AVOID using context.watch or context.select when the parent widget in the build method doesn't depend on the state
    ///The below usages is ERROR PRONE because using context.watch or context.select at the root of the build method will result in the ENTIRE WIDGET BEING REBUILT when the bloc state changes
    final falseState2 = context.watch<CounterBloc>().state;
    final falseState3 = context.select((ProfileBloc bloc) => bloc.state.name);

    ///3.2) But these usage can be nice, if there is only one widget like that under the build method that depends on the state
    //Widget build(BuildContext context) {
    //   final name = context.select((ProfileBloc bloc) => bloc.state.name);
    //   return Text(name);
    // }
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text('$falseState'),
          Text('$falseState2'),
          Text('$falseState3'),
        ],
      )),

      ///1) context.read don't notify you about state changes
      ///2) context.watch notify you about state changes
      ///3) context.select notify you about small part of state changes
      ///
      ///  context.select VS context.watch
      /// for example if you are using just 1 one state in that widget, using this is make sense, but if you use all states in that widget, you should use context.watch

      ///1) Alternative 1: Use BlocBuilder instead of context.watch to explicitly scope rebuilds
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          /// Whenever the state changes, only the Center is rebuilt.
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),

      ///2) Alternative 2: Use context.watch and Builder to scope rebuilds. If the provided Object of type T changes, context.watch will trigger a rebuild.
      ///context.watch is only accessible within the build method of a StatelessWidget or State class.
      // body: Builder(
      //   builder: (context) {
      //     // Whenever the state changes, only the Text is rebuilt.
      //     final state = context.watch<CounterBloc>().state;
      //
      //     ///Below code is equivalent with above code
      //     // BlocProvider.of<CounterBloc>(context, listen: true);

      //     return Text(state.toString());
      //   },
      // ),

      ///3) Alternative 3: Use Builder and context.watch as MultiBlocProvider
      // body: Builder(
      //   builder: (context) {
      //     final stateA = context.watch<CounterBloc>().state;
      //     final stateB = context.watch<BlocB>().state;
      //     final stateC = context.watch<BlocC>().state;
      //
      //     /// return a Widget which depends on the state of BlocA, BlocB, and BlocC
      //     return Text('$stateA');
      //   },
      // ),
      ///4) Alternative 4: Use BlocSelector instead of context.select to explicitly scope rebuilds.
      // body: BlocSelector<ProfileBloc, ProfileState, String>(
      //   selector: (state) => state.name,
      //   builder: (context, name) {
      //     // Whenever the state.name changes, only the Text is rebuilt.
      //     return Text(name);
      //   },
      // ),

      ///5) Alternative 5: Use context.select and Builder to scope rebuilds. Unlike context.watch, context.select allows you listen for changes in a smaller part of a state.
      ///If the provided Object of type T changes, context.select will trigger a rebuild.
      // body: Builder(
      //   builder: (context) {
      //     // Whenever state.name changes, only the Text is rebuilt.
      //     final name = context.select((ProfileBloc bloc) => bloc.state.name);
      //     return Text(name);
      //   },
      // ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                ///context.read is most commonly used for RETRIEVING BLOC INSTANCE in order to add an event within onPressed callbacks
                context.read<CounterBloc>().add(CounterIncrementPressed());

                ///Below code is equivalent with above code
                // BlocProvider.of<CounterBloc>(context)
                //     .add(CounterIncrementPressed());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrementPressed());
              },
            ),
          ),
        ],
      ),
    );
  }
}
