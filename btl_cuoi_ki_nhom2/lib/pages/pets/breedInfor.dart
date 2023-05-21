import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btl_cuoi_ki_nhom2/models/dog.dart';
import 'package:btl_cuoi_ki_nhom2/pages/mainPage.dart';
import 'package:btl_cuoi_ki_nhom2/pages/pets/beedsSearch.dart';

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, left: 2, right: 2, bottom: 10),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 10),
                  width: 2 / 5 * MediaQuery.of(context).size.width + 40,
                  child: Column(
                    children: [
                      Text(
                        widget.dog.breed,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 205, 155, 255),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.dog.description,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 3, 120, 147)
                            .withOpacity(0.3), // Màu bóng
                        spreadRadius: 2, // Bán kính phân tán
                        blurRadius: 5, // Độ mờ
                        offset: Offset(3, -3), // Vị trí bóng
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10, right: 5),
                  width: 2 / 5 * MediaQuery.of(context).size.width + 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: Image.network(widget.dog.imageUrl).image,
                      fit: BoxFit.cover,
                      // width: 1 / 2 * MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Thức ăn yêu thích:',
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 14, 134, 124),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.dog.favoriteFood,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
                style: GoogleFonts.ibmPlexMono(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dồ chơi ưa thích:',
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 14, 134, 124),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.dog.favoriteToy,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
                style: GoogleFonts.ibmPlexMono(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, top: 20),
                  child: Text(
                    'Giá trên thị trường: ' + widget.dog.price,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 50, 10, 130),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color.fromARGB(255, 59, 58, 58),
          backgroundColor: Color.fromARGB(255, 228, 190, 255),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_rounded,
                color: Color.fromARGB(255, 159, 143, 183),
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Breeds',
              icon: Icon(
                Icons.pets,
                size: 25,
                color: Color.fromARGB(255, 159, 143, 183),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(
                Icons.chat,
                color: Color.fromARGB(255, 159, 143, 183),
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.supervised_user_circle_sharp,
                color: Color.fromARGB(255, 159, 143, 183),
                size: 20,
              ),
            ),
          ],
          onTap: (value) => {
                if (value == 0)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mainPage(),
                      ),
                    )
                  }
                else if (value == 1)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => beedsSearch(),
                      ),
                    )
                  }
                else if (value == 2)
                  {
                    print('Chat'),
                  }
                else if (value == 3)
                  {
                    print('Profile'),
                  }
              }),
    );
  }
}
