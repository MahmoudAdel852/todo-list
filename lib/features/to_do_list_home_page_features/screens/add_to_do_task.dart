import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';
import 'package:to_do_list_task/core/providers/to_do_model.dart';

import '../../../core/helper_widget/edit_text_controller.dart';
import '../../../core/strings/page_name.dart';

class AddToDoTask extends StatelessWidget {
  AddToDoTask({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController()..text;
  final TextEditingController bodyController = TextEditingController()..text;

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("add task "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              child: buildTextFieldContainer(
                textEditingController: titleController,
                labelText: " Title",
                hintText: "Enter your task title",
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.all(7),
              child: buildTextFieldContainer(
                textEditingController: bodyController,
                labelText: " Body",
                hintText: "Enter your task body",
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.category == "" ? "Categories" : item.category,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    item.updateCategory(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Personal ',
                        child: Text('Personal'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Work',
                        child: Text('Work'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Other',
                        child: Text('Other'),
                      ),
                    ];
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (titleController.text == "" || titleController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("title is required "),
            ));
          } else {
            try {
              item.addToDoTask(
                toDoModel: ToDoModel(
                  title: titleController.text,
                  body: bodyController.text,
                  completed: false,
                  taskCategory: item.category,
                ),
              );
            } catch (e) {
              print("e=====${item.toDoList}");}
            Navigator.pushNamedAndRemoveUntil(
              context,
              toDoScreen,
              (_) => false,
            );
          }
        },
      ),
    );
  }
}
