import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/widgets/to_do_single_task.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ToDoProvider>(context).toDoList;
    return SingleChildScrollView(
      child: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          // add this
          itemBuilder: (context, item) {
            return ToDoTaskWidget(
              index: item,
            );
          },
          itemCount: items.length,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      ),
    );
    ;
  }
}
