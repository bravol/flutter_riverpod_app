import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/home_screen.dart';
import 'package:flutter_riverpod_app/user.dart';

//PROVIDERS
//1.Provider it provides data and it is read only
//2.StateProvider for simple values
//3. StateNotifier and StateNotifier Provider for complex values
//4.change notifier provider
//5.future provider based on http calls, even firebase calls
//6. stream provider

//widgetRef from widget to provider
//providerRef talk from provider to another provider
//Ref talk with other providers

// ref allows us to talk with other providers
// final nameProvider = Provider<String>((ref) => 'Brian Bravol');

//2.state provider is used to update the value from outside
// final nameProvider = StateProvider<String?>((ref) => 'Brian Lumala');

final userProvider = StateNotifierProvider<UserNofifier, User>(
  (ref) => UserNofifier(
    User(name: '', email: ''),
  ),
);

// final userChangeNotifierProvider =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  // return UserRepository().fetchUserData();
//u can access every provider
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(
    //provider scope keeps the track of all providers. and ensures no leakage
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
