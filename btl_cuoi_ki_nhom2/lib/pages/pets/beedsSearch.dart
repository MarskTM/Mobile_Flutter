import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btl_cuoi_ki_nhom2/pages/mainPage.dart';
import 'package:btl_cuoi_ki_nhom2/components/infoRespone.dart';

class beedsSearch extends StatefulWidget {
  String searchDefault;
  beedsSearch({Key? key, required this.searchDefault}) : super(key: key);

  @override
  State<beedsSearch> createState() => _beedsSearchState();
}

class _beedsSearchState extends State<beedsSearch> {
  @override
  String search = '';

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
        child: Column(children: [
          // Thanh tìm kiếm theo giống chó
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What breed you looking for ?',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        search = value;
                      })
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 105, 92, 250),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Danh sách tìm kiếm giống chó phù hợp
          Result(search: search, searchDefault: widget.searchDefault),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
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
