import 'package:flutter/material.dart';

class UpdateViewModel{
  var isLoading = false;

  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  String id = 'Id';
  String title = 'Title';
  String body = 'Body';
  String userId = 'UserId';
}