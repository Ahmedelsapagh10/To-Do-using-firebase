import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_firebase/controller/bloc/state.dart';

import '../../constants.dart';
import '../../model/taskModel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitState());

  CollectionReference docReference =
      FirebaseFirestore.instance.collection('tasks');

  ///add new task
  Future<void> addTask(String id) {
    return docReference.add({
      'task': controller.text,
      'time': taskTime.text,
      'date': taskDate.text,
      'email': id,
      kCreatedAt: DateTime.now()
    });
  }

  TextEditingController controller = TextEditingController();
  TextEditingController taskTime = TextEditingController();
  TimeOfDay timeOfDay = TimeOfDay.now();
  TextEditingController taskDate = TextEditingController();

  void addNewNote(BuildContext context, String id) {
    addTask(id);
    emit(LoadingState());
    Navigator.of(context).pop();
    controller.clear();
    taskDate.clear();
    taskTime.clear();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('task is added'),
      backgroundColor: tx2Color,
      duration: Duration(
        milliseconds: 500,
      ),
    ));
    emit(AddState());
  }

  // List<Task> data = [];

  deleteNote(String id) {
    docReference.doc(id).delete();
    emit(DeleteState());
  }
}
