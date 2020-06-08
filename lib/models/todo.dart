class ToDo {
  String completeBy;
  int taskId;
  String description;
  String title;
  int priority;

  ToDo({this.description, this.title, this.completeBy, this.priority});

  Map<String, dynamic> toMap() {
    return {'completeBy': completeBy, 'priority': priority, 'description': description, 'title': title};
  }

  static ToDo fromMap(Map<String, dynamic> map) {
    return ToDo(description: map['completeBy'], title: map['title'], completeBy: map['description'], priority: map['priority']);
  }
}
