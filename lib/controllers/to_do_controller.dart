import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/hive_service.dart';

class ToDoController extends GetxController {
  TextEditingController contentController = TextEditingController();
  int index = 0;
  bool isLoading = false;
  bool isTextField = false;

  List<ToDo> list = [];
  List<ToDo> listContent = [];

  void createContent(BuildContext context) async {
    isLoading = true;
    String content = contentController.text.trim().toString();
    update();

    ToDo contentInfo = ToDo(id: content.hashCode, title: content, isDelete: false, index: index);
    list = HiveDB.loadContent();
    list.add(contentInfo);
    HiveDB.storeNotes(list);

    loadContent();
    isLoading = false;
    contentController.clear();
    FocusScopeNode currentFocus = FocusScope.of(context);
    update();
  }

  void loadContent() {
    listContent = HiveDB.loadContent();
    print(listContent.toString());
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadContent();
  }

  void isText() async {
    isTextField = true;
    update();
  }
}