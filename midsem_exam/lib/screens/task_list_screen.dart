import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [
    Task(
      title: "Assignment 1",
      courseCode: "CS101",
      dueDate: DateTime.now(),
    ),
    Task(
      title: "Project",
      courseCode: "CS202",
      dueDate: DateTime.now(),
    ),
    Task(
      title: "Quiz",
      courseCode: "CS303",
      dueDate: DateTime.now(),
    ),
  ];

  void _addTask() {
    String title = "";
    String course = "";
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Course Code"),
                onChanged: (value) => course = value,
              ),
              ElevatedButton(
                onPressed: () async {
                  selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                },
                child: Text("Pick Date"),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && course.isNotEmpty && selectedDate != null) {
                  setState(() {
                    tasks.add(Task(
                      title: title,
                      courseCode: course,
                      dueDate: selectedDate!,
                    ));
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        );
      },
    );
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return ListTile(
            title: Text(task.title),
            subtitle: Text(
                "${task.courseCode} - Due: ${formatDate(task.dueDate)}"),
            trailing: Checkbox(
              value: task.isComplete,
              onChanged: (value) {
                setState(() {
                  task.isComplete = value!;
                });
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}