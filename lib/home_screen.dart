import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/main.dart';

//NO 1

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //methods for communication btn widgets and  providers.
//     //1. Consumer widget
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }

//NO 2
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //methods for communication btn widgets and  providers.
    //2. builder widget

    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Center(
            child: Text(name),
          );
        },
      ),
    );
  }
}
