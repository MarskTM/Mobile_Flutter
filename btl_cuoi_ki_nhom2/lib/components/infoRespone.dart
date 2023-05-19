import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  String search;
  Result({Key? key, required this.search}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  dynamic data;// Dữ liệu phản hồi từ API
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
      print(data['message']);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(widget.search),
        ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Fetch data')),
        // Column(
        //   children: data.map((e) => Text(e.toString())).toList(),
        // )
      ],
    ));
  }
}
