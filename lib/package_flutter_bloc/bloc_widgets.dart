import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


///BlocBuilder handles BUILDING the widget in response to NEW STATES. BlocBuilder is very similar to StreamBuilder but has a more simple API to reduce the amount of boilerplate code needed.
///Think of example with stream where there is a sender and receiver. The sender is the bloc and the receiver is the widget. BlocBuilder is the receiver and it will rebuild the widget in response to new states.
///Rebuilding UI can take a lot of computing power. Therefore, it is imporant to ONLY WRAP what you need to change in a BlocBuilder. For example, if you have a list of items and you want to change the color of one item, you should only wrap that item in a BlocBuilder and not the entire list.
class BlocBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocA, BlocAState>(
      ///buildWhen method takes the previous state AND current state as its parameters. If buildWhen returns true, builder will be called WITH STATE and the widget WILL REBUILD. If buildWhen returns false, builder will not be called with state and no rebuild will occur.
        buildWhen: (previous, current) {
          return current is BlocAStateIncremented;
        },
        ///If the bloc parameter is omitted, BlocBuilder will automatically perform a lookup using BlocProvider and the current BuildContext. Only specify the bloc if you wish to provide a bloc that will be scoped to a single widget and isn't accessible via a parent BlocProvider and the current BuildContext
        bloc: blocA,
        builder: (context, state) {
          return Container();
          // return widget here based on BlocA's state
        });
  }
}

///BlocSelector is a Flutter widget which is similiar to BlocBuilder but allows developers to filter updates by SELECTING A NEW VALUE based on the CURRENT BLOC STATE. Unnecessary builds are prevented if the selected value does not change.
class BlocSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<BlocA, BlocAState, SelectedState>(
      selector: (state) {
        // return selected state based on the provided state.
      },
      builder: (context, state) {
        // return widget here based on the selected state.
      },
    );
  }
}

///BlocProvider is a Flutter widget which provides a bloc to its children via BlocProvider.of<T>(context). It is used as a dependency injection (DI) widget so that a single instance of a bloc can be PROVIDED TO MULTIPLE WIDGETS within a subtree
///In most cases, BlocProvider should be used to CREATE NEW BLOCS which will be made available to the rest of the subtree. In this case, since BlocProvider is responsible for creating the bloc, it will automatically HANDLE CLOSING the bloc.
class BlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///By default, BlocProvider will create the bloc lazily, meaning create will get executed when the bloc is looked up via(aracılığıyla arandığında) BlocProvider.of<BlocA>(context). If you want to create the bloc eagerly(run immediately), set lazy to false.
      lazy: false,
      create: (BuildContext context) => BlocA(),
      child: ChildA(),
    );
    ///This will be most commonly used when an existing bloc needs to be made available to a new route. In this case, BlocProvider will NOT AUTOMATICALLY CLOSE the bloc since it did not create it.
    // return BlocProvider.value(
    //   value: BlocProvider.of<BlocA>(context),
    //   child: ScreenA(),
    // );
    ///then from either ChildA, or ScreenA we can retrieve BlocA with:
    /// with extensions
    //context.read<BlocA>();

    ///without extensions
    //BlocProvider.of<BlocA>(context)
  }
}

///MultiBlocProvider is a Flutter widget that merges multiple BlocProvider widgets into one. MultiBlocProvider improves the readability and eliminates the need to nest multiple BlocProviders.
class MultiBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocA>(
          create: (BuildContext context) => BlocA(),
        ),
        BlocProvider<BlocB>(
          create: (BuildContext context) => BlocB(),
        ),
        BlocProvider<BlocC>(
          create: (BuildContext context) => BlocC(),
        ),
      ],
      child: ChildA(),
    );
  }
}

///Almost identical to BlocBuilder except the listener function is only called ONCE PER STATE
///BlocListener is a Flutter widget which takes a BlocWidgetListener and an optional Bloc and invokes the listener in response to STATE CHANGES in the bloc. It should be used for functionality that needs to occur ONCE per state change such as navigation, showing a SnackBar, showing a Dialog, etc...
class BlocListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocA, BlocAState>(
      listenWhen: (previousState, state) {
        // return true/false to determine whether or not
        // to call listener with state
      },
      ///listener is ONLY CALLED ONCE for each state change (NOT including the initial state) unlike builder in BlocBuilder and is a void function.
      listener: (context, state) {
        // do stuff here based on BlocA's state
      },
      child: Container(),
    )

  }
}

class MultiBlocListener extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BlocA, BlocAState>(
          listener: (context, state) {},
        ),
        BlocListener<BlocB, BlocBState>(
          listener: (context, state) {},
        ),
        BlocListener<BlocC, BlocCState>(
          listener: (context, state) {},
        ),
      ],
      child: ChildA(),
    )

  }
}
///Like BlocBuilder + BuildListener
///BlocConsumer exposes a builder and listener in order to react to new states. BlocConsumer is analogous to a nested BlocListener and BlocBuilder but REDUCES the amount of boilerplate needed.
///BlocConsumer should ONLY BE USED when it is necessary to BOTH REBUILD UI and execute other REACTIONS TO STATE CHANGES in the bloc
///The listenWhen and buildWhen will be invoked on EACH BLOC STATE CHANGE. They each take the previous state and current state and MUST RETURN a bool which determines whether or not the builder and/or listener function will be INVOKED. The previous state will be initialized to the state of the bloc when the BlocConsumer is initialized.
class BlocConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocA, BlocAState>(
        listenWhen: (previous, current) {
          // return true/false to determine whether or not
          // to invoke listener with state
        },
        listener: (context, state) {
          // do stuff here based on BlocA's state
        },
        buildWhen: (previous, current) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
        },
        builder: (context, state) {
          // return widget here based on BlocA's state
        }
    );
  }
}


///RepositoryProvider is a Flutter widget which provides a repository to its children via RepositoryProvider.of<T>(context). It is used as a dependency injection (DI) widget so that a single instance of a REPOSITORY can be provided to multiple widgets within a subtree.
///Difference with BlocProvider, BlocProvider should be used to provide blocs whereas RepositoryProvider should only be used for repositories.
class RepositoryProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryA(),
      child: ChildA(),
    );
    ///then from ChildA we can retrieve the Repository instance with:
    /// with extensions
    // context.read<RepositoryA>();
    /// without extensions
    // RepositoryProvider.of<RepositoryA>(context)
  }
}

class MultiRepositoryProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RepositoryA>(
          create: (context) => RepositoryA(),
        ),
        RepositoryProvider<RepositoryB>(
          create: (context) => RepositoryB(),
        ),
        RepositoryProvider<RepositoryC>(
          create: (context) => RepositoryC(),
        ),
      ],
      child: ChildA(),
    )

  }
}




