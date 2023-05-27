import 'package:bloc/bloc.dart';

///BlocObserver is a class that allows you to observe ALL blocs and cubits in your application. It is useful for logging, analytics, and debugging.
///Just as before, we can override onTransition in a custom BlocObserver to observe all transitions that occur from a single place.

///All global override methods(onChange,onError) in here, invoked after the internal(counter_bloc'un icindeki) override methods.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  ///onError and onChange work the exact same way for both Bloc and Cubit instances.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
