import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:btl_cuoi_ki_nhom2/components/introduce.dart';
import 'package:btl_cuoi_ki_nhom2/pages/pets/beedsSearch.dart';
import 'package:btl_cuoi_ki_nhom2/pages/auth/loginScreen.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List imageList = [
    {
      'id': 1,
      'path':
          'https://images.squarespace-cdn.com/content/v1/5cfec609958de40001253e1d/1606946863041-4TJCA5RRZ6FYB1DUFZ6B/Tails+of+Connection+Challenge+banner+with+Christie+Catan%2C+Otis%2C+and+Sully+posing+on+the+ground'
    },
    {
      'id': 2,
      'path':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs9hv3bv35WSv-DfebJYn-NstWAJOc3w-4mA&usqp=CAU'
    },
    {
      'id': 3,
      'path':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYN5I2XjH_s0AV9F5Xrbbd1J5QpXA_HZQ-xQ&usqp=CAU'
    },
    {
      'id': 4,
      'path':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcjz14WXFTkFUiAKn-adIhDRLSwIfHUQnydg&usqp=CAU'
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  void clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('refeshToken');
  }

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
            Stack(
              children: [
                CarouselSlider(
                  items: imageList
                      .map(
                        (e) => Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e['path'],
                                  fit: BoxFit.cover,
                                  width: 500,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              right: 95,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.blueAccent.withOpacity(0.3)),
                                onPressed: () {},
                                child: Text('Shop Now'),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(autoPlay: true),
                ),
                Positioned(
                  right: 150,
                  bottom: 30,
                  child: CarouselIndicator(
                    color: Colors.white.withOpacity(0.5),
                    cornerRadius: 50,
                    activeColor: Colors.red,
                    count: imageList.length,
                    index: currentIndex,
                  ),
                ),
              ],
            ),
            Introduce(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Tô Kim Mạnh"),
              accountEmail: Text("manhtokim@gmail.com"), //email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home Page"),
                onTap: () {
                  print('Home Page');
                }),
            ListTile(
                leading: Icon(Icons.pets),
                title: Text("My Pets"),
                onTap: () {
                  print('My Pets');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => beedsSearch(),
                    ),
                  );
                }),
            ListTile(
                leading: Icon(Icons.shopping_cart_sharp),
                title: Text("Store"),
                onTap: () {
                  print('Store');
                }),
            ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                onTap: () {
                  print('About us');
                }),
            SizedBox(
              height: 320,
            ),
            Center(
              child: ListTile(
                  title: Text(
                    "Log out",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  leading: Icon(Icons.logout),
                  onTap: () {
                    print('Log out');
                    clearToken();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginScreen(),
                      ),
                    );
                  }),
            ),
          ],
        ),
        // Sign out button
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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
                if (value == 1)
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
