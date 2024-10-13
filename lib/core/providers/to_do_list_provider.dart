import 'package:flutter/material.dart';
import 'package:to_do_list_task/core/providers/to_do_model.dart';
import '../cache/shared_preferences_data.dart';

class ToDoProvider with ChangeNotifier {
  List<ToDoModel> toDoList = [];

  addToDoTask({required toDoModel}) {
    toDoList.add(toDoModel);
    saveData();
    notifyListeners();
  }

  saveData() {
    CacheData.setData(
      key: 'title',
      value: toDoList.map((e) => e.title).toList(),
    );
    CacheData.setData(
      key: 'body',
      value: toDoList.map((e) => e.body).toList(),
    );
    CacheData.setData(
      key: 'completed',
      value: toDoList.map((e) => e.completed.toString()).toList(),
    );
    notifyListeners();
  }

  getCacheData() {
    try {
      var titleList = CacheData.getData(key: 'title') as List;
      var bodyList = CacheData.getData(key: 'body') as List;
      var completedAsStrings = CacheData.getData(key: 'completed') as List;
      for (int index = 0; index < titleList.length; index++) {
        bool completed = completedAsStrings[index] == "true" ? true : false;
        toDoList.add(
          ToDoModel(
            title: titleList[index],
            completed: completed,
            body: bodyList[index],

          ),
        );
      }

      notifyListeners();
    } catch (e) {
      return [];
    }
  }

  completedTask({required int index}) {
    toDoList[index].completed = !toDoList[index].completed;
    saveData();
    notifyListeners();
  }

  deleteTask({required int index}) async {
    CacheData.deleteItem(index: index);
    toDoList.removeAt(index);
    saveData();
    notifyListeners();
  }
}
