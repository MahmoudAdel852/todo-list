import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/screens/task_details.dart';

class ToDoTaskWidget extends StatelessWidget {
  final int index;

  const ToDoTaskWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    deleteDialog() {
      var alertDialog = AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              item.deleteTask(index: index);
              item.saveData();
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      );
      showDialog(
          context: context, builder: (BuildContext context) => alertDialog);
    }

    return Center(
        child: InkWell(
      onLongPress: () {
        var alertDialog = AlertDialog(
          title: const Text("Task options"),
          actions: [
            TextButton(
              onPressed: () {
                deleteDialog();
              },
              child: const Text("Delete"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,


                    MaterialPageRoute(
                        builder: (context) => TaskDetails(index: index)));
              },
              child: const Text("Edit"),
            ),
          ],
        );

        showDialog(
            context: context, builder: (BuildContext context) => alertDialog);
      },
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TaskDetails(index: index)));
      },
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    item.toDoList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.cyan,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.toDoList[index].taskCategory,
                  ),
                ],
              ),
            ),
            
            Expanded(
              flex: 0,
              child: Checkbox(
                value: item.toDoList[index].completed,
                onChanged: (bool? value) {
                  item.completedTask(index: index);
                },
              ),
            ),
           ],
        ),
      ),
    ));
  }
}
