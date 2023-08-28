import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/home.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class UpdateViewModel extends ChangeNotifier {
  var isLoading = false;

  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  String id = 'Id';
  String title = 'Title';
  String body = 'Body';
  String userId = 'UserId';
  Post? post = Post();

  Future apiPostUpdate(Post post) async {
    isLoading = true;
    notifyListeners();

    int id = int.parse(idController.text.toString());
    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (idController.text.isEmpty ||
        title.isEmpty ||
        body.isEmpty ||
        userIdController.text.isEmpty) return;

    //create
    post = Post(id: id, title: title, body: body, userId: userId);

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));

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
