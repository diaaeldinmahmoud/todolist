import 'package:flutter/material.dart';
import 'package:todolist/models/taskmodel.dart';

class todotile extends StatefulWidget {
  const todotile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  });
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  final Task task;

  @override
  State<todotile> createState() => _todotileState();
}

class _todotileState extends State<todotile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: widget.task.completed,
                activeColor: Colors.white,
                checkColor: Colors.deepPurpleAccent,
                onChanged: widget.task.completed
                    ? null
                    : (_) {
                        widget.onToggle();
                      },
              ),

              Expanded(
                child: Text(
                  widget.task.title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    decoration: widget.task.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),

              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: widget.onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
