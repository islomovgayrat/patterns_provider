import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

  //list
  Future apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_POST, Network.paramsEmpty());
    isLoading = false;
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    notifyListeners();
  }

  //delete
  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading = false;
    notifyListeners();

    return response != null;
  }
}
