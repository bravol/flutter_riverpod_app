import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/home_screen.dart';

//PROVIDERS
//1.Provider it provides data and it is read only
//2.StateProvider for simple values
//3. StateNotifier and StateNotifier Provider for complex values

// ref allows us to talk with other providers
// final nameProvider = Provider<String>((ref) => 'Brian Bravol');

//2.state provider is used to update the value from outside
final nameProvider = StateProvider<String?>((ref) => 'Brian Lumala');

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
