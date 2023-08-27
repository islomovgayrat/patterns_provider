import 'package:flutter/material.dart';

class CreateViewModel extends ChangeNotifier {
  var isLoading = false;

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  String title = 'Title';
  String body = 'Body';
  String userId = 'UserId';
}
