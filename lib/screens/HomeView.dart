import 'package:flutter/material.dart';
import 'package:todolist/widgets/todotile.dart';
import 'package:todolist/models/taskmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'lib/assets/todo icon.png',
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('To', style: TextStyle(color: Colors.black)),
            Text('Do', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => todotile(
          task: tasks[index],
          onDelete: () {
            setState(() {
              tasks.removeAt(index);
            });
          },
          onToggle: () {
            setState(() {
              tasks[index].toggleCompleted();
              tasks[index].completedAt = DateTime.now();
              tasks.sort((a, b) {
                if (a.completed && b.completed) {
                  return a.completedAt!.compareTo(b.completedAt!);
                } else if (a.completed) {
                  return 1; // Completed tasks go to the end
                } else if (b.completed) {
                  return -1; // Uncompleted tasks stay at the top
                }
                return 0; // No change in order
              });
            });
          },
        ),
        itemCount: tasks.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String taskText = '';
              return AlertDialog(
                title: Text('Add Task'),
                content: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    taskText = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter task title'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (taskText.trim().isNotEmpty) {
                        setState(() {
                          tasks.add(
                            Task(
                              id: DateTime.now().toString(),
                              title: taskText.trim(),
                            ),
                          );
                        });
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
