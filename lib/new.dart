import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController _controller = TextEditingController();
  List<String> todoList = [];

  void _addToDoItem() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        todoList.add(_controller.text);
        _controller.clear();
      }
    });
  }

  void _removeToDoItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo app example"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Enter task"),
                    ),
                  ),
                  TextButton(onPressed: _addToDoItem, child: Icon(Icons.add)),
                ],
              ),
              SizedBox(height: 60),
              Expanded(
                  child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          child: Row(
                            children: [
                              Text(todoList[index]),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _removeToDoItem(index);
                                },
                              )
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
