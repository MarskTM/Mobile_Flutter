import 'package:flutter/material.dart';
import './list_todo.dart';
import '../models/todo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String findTask = '';
  String? priority = 'medium';
  List<String> priorityOptions = ['low', 'medium', 'high'];
  List<Todo> todoList = [];
  void addTodo(
      int id, String title, String priority, DateTime date, bool isDone) {
    var todo = Todo(
      id,
      title,
      priority,
      date,
      isDone,
    );
    setState(() {
      todoList.add(todo);
    });
  }

  void addTodoItemDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTask = '';
          DateTime dateLine = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          );

          return AlertDialog(
            title: Text('Thêm việc cần làm'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Công việc',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      newTask = value;
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButton<String>(
                    value: priority,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        priority = newValue;
                      });
                    },
                    items: priorityOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text('Ngày hết hạn'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: dateLine,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          dateLine = picked;
                        });
                      }
                    },
                    child: Text(
                      '${dateLine.day}/${dateLine.month}/${dateLine.year}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Thêm'),
                onPressed: () {
                  setState(() {
                    addTodo(
                      todoList.length,
                      newTask,
                      priority.toString(),
                      dateLine,
                      false,
                    );
                    print(todoList.length);
                  });
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý CV'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                border: OutlineInputBorder(),
                icon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  // print(value);
                  findTask = value;
                });
              },
            ),
          ),
          Text(
            'Danh sách việc Cần làm',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: TodoList(todoList: todoList, findTask: findTask),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodoItemDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
