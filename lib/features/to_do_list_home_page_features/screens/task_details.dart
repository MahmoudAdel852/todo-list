import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';

import '../../../core/helper_widget/edit_text_controller.dart';
import '../../../core/strings/page_name.dart';

class TaskDetails extends StatelessWidget {
   int? index;

   TaskDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    TextEditingController titleController = TextEditingController()..text;
    TextEditingController descriptionController = TextEditingController()..text;
    delete()async{
      await item.deleteTask(index: index!);
    }
    goBack() {
      Navigator.pushNamedAndRemoveUntil(context, toDoScreen, (route) => false);
    }

    Widget editTask() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              var alertDialog = AlertDialog(
                title: const Text("edit title"),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Text(item.toDoList[index!].title),
                      buildTextFieldContainer(
                        textEditingController: titleController,
                        labelText: "newTitle",
                        hintText: "enter your title",
                      )
                    ],
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        child: MaterialButton(
                          onPressed: () {
                            item.toDoList[index!].title =titleController.text ;
                            Navigator.pushNamedAndRemoveUntil(context, toDoScreen, (route) => false);
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.all(12),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancelled",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) => alertDialog);
            },
            child: Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: const Text(
                  " Edit title !! ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),  InkWell(
            onTap: () {
              var alertDialog = AlertDialog(
                title: const Text("edit description"),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      buildTextFieldContainer(
                        textEditingController: descriptionController,
                        labelText: "newDescription",
                        hintText: "enter your description",
                      )
                    ],
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        child: MaterialButton(
                          onPressed: () {
                            item.toDoList[index!].body =descriptionController.text;

                            Navigator.pushNamedAndRemoveUntil(context, toDoScreen, (route) => false);
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.all(12),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancelled",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) => alertDialog);
            },
            child: Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: const Text(
                  " Edit description !! ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    testBody() {
      if (item.toDoList[index!].body == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "you don't have any Description",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyan,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              editTask(),
            ],
          ),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.toDoList[index!].body!,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 17,
            ),
            editTask(),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.toDoList[index!].title),
        centerTitle: true,
      ),
      body: testBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          goBack();
          delete();

        },
        child: const Icon(Icons.delete),
      ),
    );
  }

}
