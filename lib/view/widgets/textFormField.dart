import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {required this.controller,
      required this.icon,
      required this.text,
      required this.message,
      super.key});
  TextEditingController controller;
  String message;
  String text;
  IconData icon;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      //  height: MediaQuery.of(context).size.width / 4.8,
      width: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width / 1.5
          : MediaQuery.of(context).size.width / 1.1,
      child: TextFormField(
        controller: widget.controller,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Invalid ${widget.message}..!';
          }
          return null;
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold),
          fillColor: Colors.white30,
          filled: true,
          label: Text(widget.text),
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
