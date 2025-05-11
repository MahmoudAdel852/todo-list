import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/widgets/tasks.dart';
import '../../../core/providers/to_do_list_provider.dart';
import '../../../core/strings/page_name.dart';

 
class ToDoHomePage extends StatelessWidget {
  const ToDoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ToDoProvider>(context);
    setBody() {
      var toDoList = item.toDoList;
      if ( toDoList.isEmpty || toDoList == []) {
        return const Center(
          child: Text(
            "you don't have any data yet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),

          ),
        );
      }else{
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
      body: setBody(),
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
