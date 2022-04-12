import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  bool isOnchanged = false;

  final list = [
    "test",
    "today",
    "test",
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // selected: index == selected,
                // onTap: (){
                //   selected = index;
                // },
                contentPadding: EdgeInsets.zero,
                tileColor: Colors.grey.shade300,
                leading: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.blue,
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
                    onPressed: (){
                    },
                  ),
                ),
                title: Text("Hello $index"),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  onTap: (){},
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
                        icon: const Icon(Icons.add, color: Colors.white,),
                        onPressed: (){},
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
    );
  }
}
