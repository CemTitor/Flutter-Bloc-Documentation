///Add counter.dart to export all the PUBLIC FACING parts of the counter feature.

export 'cubit/counter_cubit.dart';
export 'view/counter_view.dart';
export 'view/counter_page.dart';

///We've separated the presentation layer from the business logic layer. The CounterView HAS NO IDEA what happens when a user presses a button; it just NOTIFIES the CounterCubit.
///Furthermore, the CounterCubit HAS NO IDEA what is happening WITH THE STATE (counter value); it's SIMPLY EMITTING new states in response to the methods being called.
