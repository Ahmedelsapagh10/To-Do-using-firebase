import 'package:flutter/material.dart';
import 'package:todolist_firebase/style.dart';
import 'package:todolist_firebase/view/widgets/bottonsheet.dart';

import '../../constants.dart';

class MyItem extends StatelessWidget {
  String time;
  String date;
  String task;
  void Function()? onPressed;
  // void Function()? onTapView;
  // void Function()? onTapUpdate;
  // void Function()? onTapDelete;
  MyItem({
    Key? key,
    required this.time,
    required this.date,
    required this.task,
    required this.onPressed,
    // required this.onTapView,
    // required this.onTapUpdate,
    // required this.onTapDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(
          //     padding: const EdgeInsets.all(20),
          //     height: MediaQuery.of(context).size.width / 1.5,
          //     color: Colors.white,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         BottonsheetItems(onTap: onTapView, text: 'View'),
          //         BottonsheetItems(onTap: onTapUpdate, text: 'Update'),
          //         BottonsheetItems(onTap: onTapDelete, text: 'Delete'),
          //       ],
          //     ),
          //   ),
          // );
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 2),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.shade300,
              )
            ],
            borderRadius: BorderRadius.circular(12),
            color: bacColor,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 32,
                  child: Text(
                    time,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: txColor),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              task,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style:
                                  const TextStyle(fontSize: 22, color: txColor),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            date,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.delete,
                    color: tx2Color,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
