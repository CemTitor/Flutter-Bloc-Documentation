///Cubit vs Bloc
///
/// For summary, start with CUBIT, as your app DEMANDS more, then change your code to BLOC.
///
/// Blocs are more POWERFUL than Cubits because they have access to the entire state of the application.
/// Cubits are more LIGHTWEIGHT and easier to test because they only have access to the current state.
///
/// Cubit Example: Netflix has search bar, when you type one letter,it gives you recommended things everytime you write ONE MORE LETTER, it gives another result. This feature named as ON-CHANGED. Which can be seen more of a cubit. Because there is only a small change.
///
/// Bloc Example: Hepsiburada on the other hand, does not have ON-CHANGED but rather a single event to search when the user CLICKS the search button. Which can be seen more of a bloc. Because there is a big change. So Cubit has ON-CHANGE, Bloc hasn't
///
/// CUBIT ADVANTAGES
///
///1) Simplicity
///
///When creating a Cubit, we only have to define the STATE as well as the FUNCTIONS which we want to expose to change the state. In comparison, when creating a Bloc, we have to define the STATES, EVENTS, and the EVENTHANDLER implementation. This makes Cubit easier to understand and there is LESS CODE involved.
///
///CounterCubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
// }
///CounterBloc
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0) {
//
//     on<CounterIncrementPressed>((event, emit) => emit(state + 1));
//   }
// abstract class CounterEvent {}
//
// class CounterIncrementPressed extends CounterEvent {}
//

///The Cubit implementation is more concise and instead of defining events separately, the functions act like events. In addition, when using a Cubit, we can simply call emit from anywhere in order to trigger a state change
///
///
/// BLOC ADVANTAGES
///
///
///1)Traceability
///
///One of the biggest advantages of using Bloc is knowing the SEQUENCE OF STATE CHANGES as well as exactly WHAT TRIGGERED those changes. For state that is critical to the functionality of an application, it might be very beneficial to use a more event-driven approach in order to CAPTURE ALL EVENTS in addition to state changes.
///
///
//enum AuthenticationState { unknown, authenticated, unauthenticated }
/// Using Bloc
// Transition {
//    currentState: AuthenticationState.authenticated,
//    event: LogoutRequested,
//    nextState: AuthenticationState.unauthenticated
// }

///Using Cubit
// Change {
//    currentState: AuthenticationState.authenticated,
//    nextState: AuthenticationState.unauthenticated
// }
///This tells us that the user was logged out but it DOESN'T EXPLAIN WHY which might be critical to debugging and understanding how the state of the application is changing over time.
///
///
/// 2)Advanced Event Transformations
///
///Another area in which Bloc excels over(üstün olduğu) Cubit is when we need to take advantage of reactive operators such as buffer, debounceTime, throttle(kısıtlamak), etc.
///
/// For example, if we were building a real-time search, we would probably want to debounce the requests to the backend in order to avoid getting rate-limited as well as to cut down on cost/load on the backend.
/// With Bloc we can provide a custom EventTransformer to change the way incoming events are processed by the Bloc.
///
// EventTransformer<T> debounce<T>(Duration duration) {
//   return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
// }
//
// CounterBloc() : super(0) {
//   on<Increment>(
//     (event, emit) => emit(state + 1),
//     /// Apply the custom `EventTransformer` to the `EventHandler`.
//     transformer: debounce(const Duration(milliseconds: 300)),
//   );
// }
///With the above code, we can easily debounce the incoming events with very little additional code
///
///
///Throttle:Programlama dünyasında ise Throttling'e en uygun örneklerden birisi, bir oyun geliştirdiğimizi düşünürsek; oyuncunun ateş etmesini zaman bazında sınırlandırma olacaktır.Örneğin her saniyede bir kez ateş etmesini istiyorsak. Throttling sayesinde oyuncu, tuşa saniye'de birden fazla bassa bile sadece bir kez ateş etme fonksiyonu çalışacaktır
///
///Debouncing: En basit haliyle bir tuş olduğunu düşünelim, bastığımızda alarm çalıştırsın, tekrar bastığımızda durdursun, bu basma işleminde bir Debouncing süresi belirlemezsek sistem sapıtarak bir basışta hem alarm'ı aç hem de kapa komutunu aynı anda göndermemize sebep olabilir.
///Basit bir arama çubuğumuz olduğunu düşünelim ve buna bir şey yazdığımızda direk olarak bize sonuçları versin. Bu noktada her harf için sunucuya istek göndermek oldukça maliyetli olacaktır. Debouncing tekniği sayesinde bunu her 1 saniye bir yaptırarak maliyeti oldukça aza düşürebiliriz.Debouncing olmadan sunucuya 5 istek gönderiyorsa debouncing ile 1 istek gönderir.
