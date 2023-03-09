import 'package:todolist_firebase/model/taskModel.dart';

abstract class HomeState {}

class InitState extends HomeState {}

class LoadingState extends HomeState {}

class AddState extends HomeState {}

class DeleteState extends HomeState {}

class GetState extends HomeState {
  final List<Task> tasks;
  GetState(this.tasks);
}
