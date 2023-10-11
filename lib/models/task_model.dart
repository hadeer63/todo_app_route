class TaskModel {
  String id;
  String title;
  String Description;
  int date;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.Description,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json):this(
    title: json["title"],
          Description: json["Description"],
          date: json['date'],
          isDone: json['isDone'],
          id: json['id']
  );
  // orr
  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //       title: json["title"],
  //       Description: json["Description"],
  //       date: json['date'],
  //       isDone: json['isDone'],
  //       id: json['id']);
  // }
}
