import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List allTask = ["Take a bath"];
  var newTask;
  void addTask(){



     setState(() {
       newTask = _task.text;
       if(newTask.isNotEmpty){
         allTask.add(newTask);
       }
     });

  }

  void deleteTask(index){
    setState(() {
      allTask.removeAt(index);
    });

  }
  final TextEditingController _task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("To Do App",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.black54,
            actions: [
              Padding(
                padding: EdgeInsets.only(right:20),
                child: Icon(Icons.task_alt_rounded,
                  size: 30,
                  color: Colors.white,

                ),
              )
            ]
        ),

      body: Column(
        children:[
          Stack(
            children:[Container(
              child: Padding(
                padding:EdgeInsets.all(20),
                child: TextField(
                  controller: _task,
                  decoration: InputDecoration(
                    labelText: "Enter a task",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),

            Positioned(
              right:-10,
              top:20,
              child: Padding(

                padding: EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: Colors.deepPurple,

                  child: IconButton(

                      icon: Icon(Icons.add,
                        color: Colors.white,
                      ),
                      onPressed:(){
                        addTask();
                      }


                  ),
                ),
              ),
            ),

            ]),

          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: allTask.length,
                itemBuilder: (context, index){
                  return Column(

                    children: [

                      ListTile(
                        trailing: CircleAvatar(

                          backgroundColor: Colors.deepPurple,
                          child: IconButton(
                            icon: Icon(Icons.delete,
                            color: Colors.white, size:20),
                            onPressed: () {
                              deleteTask(index);
                            },
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(7, 2, 2,7),
                          child: Container(

                              decoration: BoxDecoration(
                               color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.deepPurple,
                                    width:2)
                              ),
                              width:700,
                              height:50,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${allTask[index]
                                }', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold)),
                              ),


                           ),
                      ),
                  )

                  ]

                  );
                }
                ),
          )
      ]



    ));
}}
