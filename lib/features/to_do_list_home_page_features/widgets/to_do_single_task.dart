import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/screens/task_details.dart';

import '../../../core/strings/page_name.dart';

class ToDoTaskWidget extends StatelessWidget {
  final int index;

  const ToDoTaskWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    return Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)
            =>
             TaskDetails(index: index)
            ));
          },
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    item.toDoList[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.cyan,
                    ),
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
