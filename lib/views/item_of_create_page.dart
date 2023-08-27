import 'package:flutter/material.dart';
import 'package:patterns_provider/view_model/create_view_model.dart';

Widget itemOfCreatePage(
  CreateViewModel createViewModel, {
  required TextEditingController textEditingController,
  required String hintText,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    ),
  );
}
