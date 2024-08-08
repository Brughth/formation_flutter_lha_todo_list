import 'package:flutter/material.dart';
import 'package:todo_app/todo/data/models/todo_model.dart';

import '../../../app_colors.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;
  final VoidCallback? onEditTap;
  const TodoWidget({
    super.key,
    required this.todo,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.isCompleted ? TextDecoration.lineThrough : null,
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    todo.description,
                    style: TextStyle(
                      decoration:
                          todo.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onEditTap,
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: todo.isCompleted
                      ? Icon(
                          Icons.check_box_rounded,
                          color: AppColors.primary,
                        )
                      : Icon(
                          Icons.check_box_outline_blank_rounded,
                          color: AppColors.primary,
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
