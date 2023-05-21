import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:btl_cuoi_ki_nhom2/models/dog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:btl_cuoi_ki_nhom2/pages/pets/breedInfor.dart';

class Result extends StatefulWidget {
  String search;
  Result({Key? key, required this.search}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  dynamic data; // Dữ liệu lấy được từ API
  List<Dog> listPetInfo = []; // Danh sách thông tin chó

  Future<String> getBreedImage(String breed) async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breed/${breed}/images/random'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
    return data['message'].toString();
  }

  Future<void> getListPetInfo() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('pets').get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (var document in documents) {
        dynamic temp = document.data();
        listPetInfo.add(Dog(
            int.parse(document.id),
            temp['breed'],
            temp['imageUrl'],
            temp['favoriteFood'],
            temp['favoriteToy'],
            temp['price'],
            temp['description']));
      }
      print(listPetInfo[2].breed);
    } catch (e) {
      print('Lỗi khi lấy dữ liệu từ Firestore: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getListPetInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: listPetInfo.map((dog) {
              if (dog.breed.contains(widget.search)) {
                return Container(
                  margin:
                      EdgeInsets.only(top: 40, left: 2, right: 2, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 242, 242),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 220, 223, 223)
                            .withOpacity(0.3), // Màu bóng
                        spreadRadius: 2, // Bán kính phân tán
                        blurRadius: 5, // Độ mờ
                        offset: Offset(3, -3), // Vị trí bóng
                      ),
                    ],
                  ),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 173, 173, 173)
                                .withOpacity(0.3), // Màu bóng
                            spreadRadius: 2, // Bán kính phân tán
                            blurRadius: 5, // Độ mờ
                            offset: Offset(3, -3), // Vị trí bóng
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: 2 / 5 * MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: Image.network(dog.imageUrl).image,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 2 / 5 * MediaQuery.of(context).size.width + 20,
                      child: Column(
                        children: [
                          Text(
                            dog.breed,
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.ibmPlexMono(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            dog.description,
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => breedInfor(
                                                  dog: dog,
                                                )));
                                  },
                                  child: Text('Xem thêm'))
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                );
              } else {
                return Container();
              }
            }).toList(),
          ),
        ),
      ],
    ));
  }
}
