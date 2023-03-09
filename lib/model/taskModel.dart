class Task {
  String taskName;
  String taskTime;
  String taskDate;
  String id;
  Task(
      {required this.taskName,
      required this.taskTime,
      required this.taskDate,
      required this.id});

  factory Task.fromJson(json) {
    return Task(
      taskName: json['taskName'],
      id: json['id'],
      taskTime: json['taskTime'],
      taskDate: json['taskDate'],
    );
  }
}
