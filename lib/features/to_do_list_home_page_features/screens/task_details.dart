import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';

import '../../../core/helper_widget/edit_text_controller.dart';
import '../../../core/strings/page_name.dart';

class TaskDetails extends StatelessWidget {
  int index;

  TaskDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    TextEditingController controller = TextEditingController()..text;

    Widget getAlertDialog({
      required bool doYouEditTitle,
    }) {

      return AlertDialog(
        title: doYouEditTitle
            ? const Text("Edit Title")
            : const Text("Edit description"),
        content: buildTextFieldContainer(
          textEditingController: controller,
          labelText: doYouEditTitle ? " Title" : " description",
          hintText: doYouEditTitle ? "Edit Title" : "Edit description",
          maxLines: doYouEditTitle ? 2 : 6,
        ),
        actions: [
          TextButton(
            onPressed: () {
              doYouEditTitle
                  ? item.toDoList[index].title = controller.text
                  : item.toDoList[index].body = controller.text;
              item.saveData();
              Navigator.pushNamedAndRemoveUntil(
                context,
                toDoScreen,
                (route) => false,
              );
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              // dismiss dialog
              Navigator.pop(context);
              Navigator.pop(context);

            },
            child: const Text('Cancel'),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.toDoList[index].title),
        centerTitle: true,
      ),
      body: Center(
        child: item.toDoList[index].body.isEmpty
            ? const Text("You Have No Description")
            : Text(item.toDoList[index].body),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var alert = AlertDialog(
            title: const Text("Edit"),
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => getAlertDialog(
                            doYouEditTitle: true,
                          ));
                },
                child: const Text(" Title "),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => getAlertDialog(
                            doYouEditTitle: false,
                          ));
                },
                child: const Text("Desc"),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => alert);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
