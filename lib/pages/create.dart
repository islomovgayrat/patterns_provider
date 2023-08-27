import 'package:flutter/material.dart';
import 'package:patterns_provider/view_model/create_view_model.dart';

import '../views/item_of_create_page.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                itemOfCreatePage(createViewModel,
                    textEditingController: createViewModel.titleController,
                    hintText: createViewModel.title),
                itemOfCreatePage(createViewModel,
                    textEditingController: createViewModel.bodyController,
                    hintText: createViewModel.body),
                itemOfCreatePage(createViewModel,
                    textEditingController: createViewModel.userIdController,
                    hintText: createViewModel.userId),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
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
    );
  }
}
