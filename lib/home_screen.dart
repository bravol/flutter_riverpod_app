import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/main.dart';

//NO 1

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   void initState() {
//     //ref.read is recommended to use it in this
//     //re.watch is not recommended
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider) ??
//         ''; // if the provider is null, have an empty screen otherwise have name provider
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextField(
//             onSubmitted: (value) {
//               ref.read(provider)
//             },
//           ),
//           Center(
//             child: Text(name),
//           ),
//         ],
//       ),
//     );
//   }
//}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

//changing the state of name
  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //methods for communication btn widgets and  providers.
    //1. Consumer widget
    final name = ref.watch(nameProvider) ??
        ''; // if the provider is null, have an empty screen otherwise have name provider // continually watch when there a change in state and this is the mostly considered
    final nameRead = ref.read(nameProvider); // reading the name just once

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmit(ref, value);
            },
          ),
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}

//NO 2 NOT USED MUCH. (CONUSMER)
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //methods for communication btn widgets and  providers.
//     //2. builder widget

//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer(
//         builder: (context, ref, child) {
//           final name = ref.watch(nameProvider);
//           return Center(
//             child: Text(name),
//           );
//         },
//       ),
//     );
//   }
// }
