import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todolist_firebase/controller/bloc/cubit.dart';
import 'package:todolist_firebase/controller/bloc/state.dart';

import '../../constants.dart';

var key = GlobalKey<FormState>();

class MyDialog extends StatefulWidget {
  final BuildContext context2;
  final String id;
  const MyDialog({required this.context2, required this.id, super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var controller = BlocProvider.of<HomeCubit>(context);

        return Dialog(
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'To DO',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.controller,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Invalid Task..!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('taskName'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller.taskTime,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Invalid Time..!';
                            }
                            return null;
                          },
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: controller.timeOfDay)
                                .then((value) => controller.taskTime.text =
                                    value!.format(context).toString())
                                .catchError((e) {
                              debugPrint(e);
                            });
                          },
                          decoration: const InputDecoration(
                            label: Text('time'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller.taskDate,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Invalid Date..!';
                            }
                            return null;
                          },
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.utc(2010),
                              lastDate: DateTime.parse('2050-10-03'),
                            )
                                .then((value) => controller.taskDate.text =
                                    DateFormat.yMMMd().format(
                                        DateTime.parse(value.toString())))
                                .catchError((e) {
                              debugPrint(e);
                            });
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            label: Text('date'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            controller.addNewNote(context, widget.id);
                          }
                        },
                        child: const Text(
                          'add',
                          style: TextStyle(color: buColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.of(widget.context2).pop();
                          controller.controller.clear();
                          controller.taskDate.clear();
                          controller.taskTime.clear();
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(color: buColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
