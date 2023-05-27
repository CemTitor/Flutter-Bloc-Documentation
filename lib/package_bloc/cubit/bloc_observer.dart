import 'package:bloc/bloc.dart';

///BlocObserver is a class that allows you to observe ALL blocs and cubits in your application. It is useful for logging, analytics, and debugging.

///All global override methods(onChange,onError) in here, invoked after the internal(counter_cubit'in icindeki) override methods.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  ///onError can also be overridden in BlocObserver to handle ALL reported errors globally
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
