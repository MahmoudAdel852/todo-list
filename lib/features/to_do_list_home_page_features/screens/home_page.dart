import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/to_do_list_provider.dart';
import '../../../core/strings/page_name.dart';
import '../widgets/tasks.dart';

class ToDoHomePage extends StatelessWidget {
  const ToDoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);

    Widget? getDataSaved() {
      if (item.toDoList.isEmpty ) {
        item.getCacheData;
        if (item.toDoList.isEmpty ) {
          return const Center(
            child: Text("add some tasks"),
          );
        } else {
           return const Tasks();
        }
      } else {
        return const Center(
          child: Text("add some tasks today"),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'your tasks',
        ),
        centerTitle: true,
      ),
      body:item.toDoList.isEmpty?const Center(
        child: Text("add some tasks today"),
      ):const Tasks(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(
              context,
              addToDoTask,
            );
          }),
    );
  }
}
