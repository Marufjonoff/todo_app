import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/to_do_controller.dart';
import 'package:todo_app/services/util_service.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ToDoController(),
      builder: (_controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellowAccent.shade700,
          title: const Text("Qaydnoma", style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 209,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: Get.find<ToDoController>().listContent.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  tileColor: Colors.grey.shade200,
                  leading: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Utils.switchColor(Get.find<ToDoController>().listContent[index].index),
                    ),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none
                  ),
                  trailing: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(12.0), bottomRight: Radius.circular(15.0)),
                    ),
                    child: IconButton(
                      splashRadius: 30,
                      iconSize: 40,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 50,
                        minHeight: 70,
                      ),
                      icon: const Icon(Icons.check_outlined, color: Colors.white,),
                      onPressed: (){},
                    ),
                  ),
                  title: Text(Get.find<ToDoController>().listContent[index].title),
                ),
              );
            },
          ),
        ),
        bottomSheet: Container(
            height: 130,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: GestureDetector(
                            onTap: (){
                              Get.find<ToDoController>().isText();
                              Get.find<ToDoController>().index = index;
                            },
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Utils.switchColor(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // text field for to do
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: Get.find<ToDoController>().contentController,
                    autofocus: Get.find<ToDoController>().isTextField,
                    readOnly: !(Get.find<ToDoController>().isTextField),
                    onTap: () {
                      Get.rawSnackbar(
                        borderRadius: 10.0,
                          message: "Rangni tanlang!",
                          titleText: null,
                          title: null,
                          userInputForm: null,
                          backgroundColor: Colors.red,
                          barBlur: 0.0,
                        maxWidth: 130,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 28),
                      );
                    },
                    onSubmitted: (string){
                      if(string.isNotEmpty) {
                        Get.find<ToDoController>().isTextField = false;
                      }
                    },
                    cursorColor: Colors.black26,
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12.0), bottomRight: Radius.circular(12.0))
                        ),
                        child: IconButton(
                          splashRadius: 30,
                          icon: const Icon(Icons.add, color: Colors.white,),
                          onPressed: (){
                            Get.find<ToDoController>().createContent(context);
                            print("create");
                          },
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Colors.blue, width: 1.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.red, width: 1.5)
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
