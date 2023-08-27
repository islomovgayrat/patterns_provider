import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_provider/pages/create.dart';
import 'package:patterns_provider/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';
import '../services/network.dart';
import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'home_id';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              ListView.builder(
                itemCount: homeViewModel.items.length,
                itemBuilder: (ctx, index) {
                  Post post = homeViewModel.items[index];
                  return itemOfPost(homeViewModel, post);
                },
              ),
              homeViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.id);
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
