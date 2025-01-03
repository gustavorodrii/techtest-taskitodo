class TodoModel {
  String title;
  String? description;
  int id;
  bool isDone;

  TodoModel(
      {required this.title,
      required this.id,
      this.isDone = false,
      this.description});

  void toggleDone() {
    isDone = !isDone;
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
    };
  }
}
