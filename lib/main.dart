
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_task/core/providers/to_do_list_provider.dart';

import 'core/cache/shared_preferences_data.dart';
import 'features/to_do_list_home_page_features/screens/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await CacheData.cacheInit();
  runApp(ChangeNotifierProvider(
    create: (context) => ToDoProvider(),
    child: const MyApp(),
  ));
}
