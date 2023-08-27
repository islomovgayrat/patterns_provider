import 'package:flutter/material.dart';
import 'package:patterns_provider/views/item_of_update_page.dart';

import '../view_model/update_view_model.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static const String id = 'update_id';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel updateViewModel = UpdateViewModel();

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
                itemOfUpdatePage(updateViewModel,
                    textEditingController: updateViewModel.idController,
                    hintText: updateViewModel.id),
                itemOfUpdatePage(updateViewModel,
                    textEditingController: updateViewModel.titleController,
                    hintText: updateViewModel.title),
                itemOfUpdatePage(updateViewModel,
                    textEditingController: updateViewModel.bodyController,
                    hintText: updateViewModel.body),
                itemOfUpdatePage(updateViewModel,
                    textEditingController: updateViewModel.userIdController,
                    hintText: updateViewModel.userId),
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
          updateViewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
