
class ToDo{
  late int id;
  late String title;
  late int index;
  late bool isDelete;

  ToDo({
    required this.id,
    required this.title,
    required this.isDelete,
    required this.index,
  });

  ToDo.fromJson(Map <String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDelete = json['isDelete'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isDelete': isDelete,
    'index': index,
  };
}