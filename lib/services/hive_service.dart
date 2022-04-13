import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:todo_app/models/todo_model.dart';

class HiveDB {
  static const String dbName = "content";
  static var box = Hive.box(dbName);

  // content write
  static void storeNotes(List <ToDo> contentList) async{
    List <String> content = contentList.map((e) => jsonEncode(e.toJson())).toList();
    await box.put('content', content);
  }

  // content return
  static List<ToDo> loadContent() {
    // String -> Map -> Object
    List <String> stringList = box.get("content") ?? <String>[];
    List <ToDo> content = stringList.map((string) => ToDo.fromJson(jsonDecode(string))).toList();
    return content;
  }

  // content delete
  static Future <void> removeContent() async {
    await box.delete('content');
  }
}