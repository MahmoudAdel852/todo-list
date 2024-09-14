import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';
import 'package:to_do_list_task/core/providers/to_do_model.dart';
import '../../../core/helper_widget/edit_text_controller.dart';
import '../../../core/strings/page_name.dart';

class AddToDoTask extends StatelessWidget {
  AddToDoTask({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController()..text;
  TextEditingController bodyController = TextEditingController()..text;

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
            item.addToDoTask(
              toDoModel: ToDoModel(
                title: titleController.text,
                body: bodyController.text,
                completed: false,
              ),

            );
// we can
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
