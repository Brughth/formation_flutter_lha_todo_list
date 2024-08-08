import 'package:flutter/material.dart';
import 'package:todo_app/todo/data/models/todo_model.dart';

class AddOrUpdateTodoDialog extends StatefulWidget {
  final Function(TodoModel todo) onPressed;
  const AddOrUpdateTodoDialog({super.key, required this.onPressed});

  @override
  State<AddOrUpdateTodoDialog> createState() => _AddOrUpdateTodoDialogState();
}

class _AddOrUpdateTodoDialogState extends State<AddOrUpdateTodoDialog> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Title",
              hintText: "title",
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              labelText: "Description",
              hintText: "Description",
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text("Add"),
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
