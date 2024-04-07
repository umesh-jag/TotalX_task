import 'package:flutter/material.dart';
import 'package:totalx_task/models/usermodel.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _users = [];
  final List<User> _filteredUsers = [];

  List<User> get users => _filteredUsers.isNotEmpty ? _filteredUsers : _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  // Filter users based on age criteria
  void filterUsersByAge({int? aboveAge, int? belowAge}) {
  _filteredUsers.clear();
  _filteredUsers.addAll(_users.where((user) {
    if (aboveAge != null && user.age >= aboveAge) {
      return true;
    }
    if (belowAge != null && user.age < belowAge) {
      return true;
    }
    return false;
  }));
  notifyListeners();
}

  // Clear applied filters
  void clearFilters() {
    _filteredUsers.clear();
    notifyListeners();
  }
}
