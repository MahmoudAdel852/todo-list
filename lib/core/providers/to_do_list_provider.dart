import 'package:flutter/material.dart';
import 'package:to_do_list_task/core/providers/to_do_model.dart';

import '../cache/shared_preferences_data.dart';


class ToDoProvider with ChangeNotifier {
  List<ToDoModel> toDoList = [];

  addToDoTask({required toDoModel}) {
    toDoList.add(toDoModel);
    notifyListeners();
  }

  saveData() {
    if (toDoList != []) {
      try {
        CacheData.setData(
            key: 'title', value: toDoList.map((e) => e.title).toList());
        CacheData.setData(
            key: 'body', value: toDoList.map((e) => e.body).toList());
        CacheData.setData(
            key: 'completed', value: toDoList.map((e) => e.completed).toList());
        notifyListeners();
      } catch (e) {
        print("error");
      }
    }
  }

  getCacheData() {
    if (toDoList == []) {
     try{
       var titleList = CacheData.getData(key: 'title') as List;
      print(titleList.length);
      print("now we toke");

         notifyListeners();

     }
     catch(e){
       print("empty");
     }

    }
  }

  completedTask({required int index}) {
    toDoList[index].completed = !toDoList[index].completed!;
    notifyListeners();
  }

  deleteTask({required int index}) async{

    toDoList!.removeAt(index);
    notifyListeners();
  }
}
