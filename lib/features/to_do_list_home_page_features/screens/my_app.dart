import 'package:flutter/material.dart';
import '../../../routes.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var route = MyRoute();
    return  MaterialApp(
      onGenerateRoute: route.getRoute,
      debugShowCheckedModeBanner: false,
       home: const ToDoHomePage(),
    );
  }
}
