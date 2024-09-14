import 'package:flutter/material.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/screens/add_to_do_task.dart';
import 'package:to_do_list_task/features/to_do_list_home_page_features/screens/my_app.dart';

import 'core/strings/page_name.dart';
import 'features/to_do_list_home_page_features/screens/home_page.dart';
import 'features/to_do_list_home_page_features/screens/task_details.dart';

class MyRoute {
  Route? getRoute(RouteSettings route) {
    switch (route.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const MyApp(),
        );
      case toDoScreen:
        return MaterialPageRoute(
          builder: (context) => const ToDoHomePage(),
        );

      case addToDoTask:
        return MaterialPageRoute(
          builder: (context) => AddToDoTask(),
        );

    }
  }
}
