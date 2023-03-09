import 'package:flutter/material.dart';

import '../../constants.dart';

class MyButton extends StatelessWidget {
  String label;
  void Function() onTap;
  MyButton({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.width / 12
              : MediaQuery.of(context).size.width / 8,
          width: MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: buColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: const TextStyle(color: bacColor),
          ),
        ));
  }
}
