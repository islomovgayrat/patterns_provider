import 'package:flutter/material.dart';
import 'package:patterns_provider/view_model/create_view_model.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';
import 'home.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  static const String id = 'create_id';

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel createViewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => createViewModel,
        child: Consumer<CreateViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: createViewModel.titleController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: createViewModel.bodyController,
                        decoration: const InputDecoration(
                          hintText: 'Body',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: createViewModel.userIdController,
                        decoration: const InputDecoration(
                          hintText: 'UserId',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          var post = createViewModel.post;
                          createViewModel.apiPostCreate(post!);
                        },
                        child: const Text('Create'),
                      ),
                    ),
                  ],
                ),
              ),
              createViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
