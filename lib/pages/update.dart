import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/home.dart';

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
        title: const Text('Update Page'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: updateViewModel.idController,
                    decoration: const InputDecoration(
                      hintText: 'Id',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: updateViewModel.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: updateViewModel.bodyController,
                    decoration: const InputDecoration(
                      hintText: 'Body',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: updateViewModel.userIdController,
                    decoration: const InputDecoration(
                      hintText: 'UserId',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var post = updateViewModel.post;
                      updateViewModel.apiPostUpdate(post!);
                    },
                    child: const Text('Update'),
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
