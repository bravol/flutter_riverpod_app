import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  User({required this.name, required this.age});
}

//contains all the methods we want
class UserNofifier extends StateNotifier<User> {
  // UserNofifier(User user) : super(user);
  UserNofifier(super.state);

  // void updateUser(User user){
  //   state = user;
  // }
}
