import 'package:flutter/material.dart';

Widget buildTextFieldContainer({
  String? labelText,
  bool? inputHide,
  String? hintText,
  TextInputType? textInputType,
  required TextEditingController textEditingController,
  int? maxLines,
}) {
  TextEditingController text = textEditingController;
  return Container(
    color: Colors.white70,
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
    child: TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      controller: text,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.center,
      minLines: 1,
      maxLines: maxLines,
    ),
  );
}
