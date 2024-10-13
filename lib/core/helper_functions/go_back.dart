import 'package:flutter/material.dart';

import '../strings/page_name.dart';
goBack({required BuildContext context}) {
  Navigator.pushNamedAndRemoveUntil(context, toDoScreen, (route) => false);
}
