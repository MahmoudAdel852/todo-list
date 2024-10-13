import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/cache/shared_preferences_data.dart';
import '../../../core/providers/to_do_list_provider.dart';
import '../../../core/strings/page_name.dart';
import '../widgets/tasks.dart';

class ToDoHomePage extends StatelessWidget {
  const ToDoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);

     setBody()  {
      if (item.toDoList.isEmpty) {
        List test = CacheData.getData(key: "title");
        if (test.isEmpty) {
          return const Center(
            child: Text("add some tasks today"),
          );
        } else {
          item.getCacheData();
          return const Tasks();
        }
      } else {
        return const Tasks();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'your tasks',
        ),
        centerTitle: true,
      ),
      body:setBody(),
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
