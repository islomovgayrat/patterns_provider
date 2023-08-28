import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/home.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class CreateViewModel extends ChangeNotifier {
  var isLoading = false;

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  String title = 'Title';
  String body = 'Body';
  String userId = 'UserId';
  Post? post = Post();

  Future apiPostCreate(Post post) async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (title.isEmpty || body.isEmpty || userIdController.text.isEmpty) return;

    //create
    post = Post(title: title, body: body, userId: userId);

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      isLoading = false;
      notifyListeners();
      //onTapCreate();
      print(response);
    } else {
      //print(response);
    }
  }

  // onTapCreate(){
  //   Navigator.pushReplacementNamed(context, HomePage.id);
  // }
}
