import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btl_cuoi_ki_nhom2/models/dog.dart';
class breedInfor extends StatefulWidget {
  Dog dog; 
  breedInfor({Key? key, required this.dog}) : super(key: key);

  @override
  _breedInforState createState() => _breedInforState();
}

class _breedInforState extends State<breedInfor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 105, 92, 250),
        elevation: 0,
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: Text(
          'Petpal take care of your pet',
          style: GoogleFonts.indieFlower(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Text('Welcome'),
      ),
    );
  }
}
