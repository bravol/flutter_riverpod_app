import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/home_screen.dart';

//providers
//.PROVIDER. it provides data and it is read only
// ref allows us to talk with other providers
final nameProvider = Provider<String>((ref) => 'Brian Bravol');

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
    return const MaterialApp(home: HomeScreen());
  }
}
