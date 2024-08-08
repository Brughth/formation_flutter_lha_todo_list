import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/todo/data/models/todo_model.dart';
import 'package:todo_app/todo/presentation/widgets/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  List<TodoModel> todos = [];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "TODO APP",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.calendar_month,
            color: AppColors.white,
          ),
        ],
      ),
      backgroundColor: AppColors.primary100,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child: ListView(
          children: todos.map((todo) {
            return TodoWidget(
              todo: todo,
              onEditTap: () {
                titleController.text = todo.title;
                descriptionController.text = todo.description;
                setState(() {});

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Edit ${todo.title}"),
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
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Title is required")),
                                );
                                return;
                              }

                              if (descriptionController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Description is required")),
                                );
                                return;
                              }

                              var updatedTodo = TodoModel(
                                title: titleController.text,
                                description: descriptionController.text,
                              );

                              var index = todos.indexWhere((t) => t == todo);

                              todos[index] = updatedTodo;
                              setState(() {});
                              titleController.clear();
                              descriptionController.clear();
                              Navigator.of(context).pop();
                            },
                            label: const Text("Update"),
                            icon: const Icon(Icons.edit),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
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
                      onPressed: () {
                        if (titleController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Title is required")),
                          );
                          return;
                        }

                        if (descriptionController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Description is required")),
                          );
                          return;
                        }
                        var todo = TodoModel(
                          title: titleController.text,
                          description: descriptionController.text,
                        );
                        todos.add(todo);
                        setState(() {});
                        titleController.clear();
                        descriptionController.clear();
                        Navigator.of(context).pop();
                      },
                      label: const Text("Add"),
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
              );
            },
          );
        },
        label: const Text("Add Task"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
