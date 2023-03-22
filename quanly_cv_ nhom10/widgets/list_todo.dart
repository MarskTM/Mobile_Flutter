import 'dart:math';

import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todoList;
  final String findTask;
  TodoList({Key? key, required this.todoList, required this.findTask})
      : super(key: key);
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void removeTodoItem(int id) {
    setState(() {
      widget.todoList.removeWhere((todo) => todo.id == id);
    });
  }

  void updateTodoItem(
      String newTask, DateTime dateline, String priority, int id) {
    setState(() {
      widget.todoList.where((todo) => todo.id == id).first.title = newTask;
      widget.todoList.where((todo) => todo.id == id).first.date = dateline;
      widget.todoList.where((todo) => todo.id == id).first.priority = priority;
    });
  }

  void checkedTodoItem(int id) {
    setState(() {
      widget.todoList.where((todo) => todo.id == id).first.isDone =
          !widget.todoList.where((todo) => todo.id == id).first.isDone;
    });
  }

  void editTodoItem(int id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {

          DateTime deadline = widget.todoList.where((todo) => todo.id == id).first.date;

          return AlertDialog(
            title: Text('Cập nhập công việc'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(height: 16),
                  Text('Deadline'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: deadline,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));
                      if (picked != null && picked != deadline)
                        setState(() {
                          widget.todoList
                              .where((todo) => todo.id == id)
                              .first
                              .date = picked;
                        });
                    },
                    child: Text(
                      '${deadline.day}/${deadline.month}/${deadline.year}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cập nhập'),
                onPressed: () {
                  updateTodoItem(
                    widget.todoList.where((todo) => todo.id == id).first.title,
                    widget.todoList.where((todo) => todo.id == id).first.date,
                    widget.todoList.where((todo) => todo.id == id).first.priority,
                    id,
                  );
                  Navigator.of(context).pop();
                },
              ),

              TextButton(
                child: Text('Hủy'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.todoList.map((todo) {
        if (todo.title.contains(widget.findTask)) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                width: 190,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: !todo.isDone
                        ? Color.fromARGB(255, 193, 45, 82)
                        : Color.fromARGB(255, 201, 149, 175),
                  ),
                ),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: !todo.isDone
                        ? Colors.purple
                        : Color.fromARGB(255, 204, 198, 204),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  todo.priority,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: !todo.isDone
                        ? Color.fromARGB(255, 37, 80, 189)
                        : Color.fromARGB(255, 136, 152, 189),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Checkbox(
                  value: todo.isDone,
                  onChanged: (value) {
                    checkedTodoItem(todo.id);
                  }),
              Container(
                // width: 30,
                margin: EdgeInsets.only(left: 16),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editTodoItem(todo.id);
                    });
                  },
                  child: Icon(Icons.edit),
                ),
              ),
              Container(
                // width: 30,
                margin: EdgeInsets.only(left: 16),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      removeTodoItem(todo.id);
                    });
                  },
                  child: Icon(Icons.delete),
                ),
              ),
            ]),
          );
        } else {
          return Container();
        }
      }).toList(),
    );
  }
}
