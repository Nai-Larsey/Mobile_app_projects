import 'package:flutter/material.dart';
import '../models/student.dart';
import 'task_list_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Student student = Student(
    name: "Emmanuel Nai Larsey",
    studentId: "224IT02001290",
    programme: "Information Technology",
    level: 300,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(student.name[0]),
            ),
            SizedBox(height: 10),

            Card(
              child: ListTile(
                title: Text(student.name),
                subtitle: Text(
                    "ID: ${student.studentId}\nProgramme: ${student.programme}\nLevel: ${student.level}"),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text("Edit Profile"),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TaskListScreen(),
                  ),
                );
              },
              child: Text("View Tasks"),
            ),
          ],
        ),
      ),
    );
  }
}