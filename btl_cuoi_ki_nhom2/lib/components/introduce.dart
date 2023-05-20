import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btl_cuoi_ki_nhom2/models/dog.dart';
import 'package:btl_cuoi_ki_nhom2/pages/pets/breedInfor.dart';

class Introduce extends StatefulWidget {
  const Introduce({Key? key}) : super(key: key);

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width, // chiều rộng của màn hình
        height: MediaQuery.of(context).size.height, // chiều cao của màn hình
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 228, 235),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 105, 92, 250),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Column(
          children: [
            // Giới thiệu về chó husky
            Container(
              margin: EdgeInsets.only(top: 40, left: 2, right: 2, bottom: 10),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 247, 255, 254)
                            .withOpacity(0.3), // Màu bóng
                        spreadRadius: 2, // Bán kính phân tán
                        blurRadius: 5, // Độ mờ
                        offset: Offset(3, -3), // Vị trí bóng
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10, left: 20, right: 30),
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: Image.network(
                              'https://images.dog.ceo/breeds/husky/n02110185_6105.jpg')
                          .image,
                      fit: BoxFit.cover,
                      // width: 1 / 2 * MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  ),
                ),
                Container(
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        'Husky',
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 206, 255, 252),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Giống chó Husky là một giống chó có nguồn gốc từ vùng Siberia ở Bắc Đông Âu. Chúng là một trong những giống chó kéo xe phổ biến nhất trên thế giới.',
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
                              onPressed: () {}, child: Text('Xem thêm'))
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),

            // Giới thiệu về chó malamute
            Container(
              margin: EdgeInsets.only(top: 40, left: 2, right: 2, bottom: 10),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 30),
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        'Malamute',
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 122, 245, 233),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Giống chó Malamute có năng lực vận động cao và thích tham gia vào các hoạt động ngoài trời. Chúng có khả năng kéo xe và thể hiện tài năng của mình trong các cuộc đua chó kéo.',
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
                              onPressed: () {}, child: Text('Xem thêm'))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 247, 255, 254)
                            .withOpacity(0.3), // Màu bóng
                        spreadRadius: 2, // Bán kính phân tán
                        blurRadius: 5, // Độ mờ
                        offset: Offset(3, -3), // Vị trí bóng
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10, right: 10),
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: Image.network(
                              'https://images.dog.ceo/breeds/malamute/n02110063_1034.jpg')
                          .image,
                      fit: BoxFit.cover,
                      // width: 1 / 2 * MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  ),
                ),
              ]),
            ),

            // Giới thiệu về chó Shetland Sheepdog
            Container(
              margin: EdgeInsets.only(top: 40, left: 2, right: 2, bottom: 10),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 110, 115, 114)
                            .withOpacity(0.3), // Màu bóng
                        spreadRadius: 2, // Bán kính phân tán
                        blurRadius: 5, // Độ mờ
                        offset: Offset(3, -3), // Vị trí bóng
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10, left: 20, right: 30),
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: Image.network(
                              'https://images.dog.ceo/breeds/sheepdog-shetland/n02105855_10095.jpg')
                          .image,
                      fit: BoxFit.cover,
                      // width: 1 / 2 * MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  ),
                ),
                Container(
                  width: 2 / 5 * MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(
                        'Shetland Sheepdog',
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 7, 84, 79),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sheltie là những chú chó rất trung thành và thân thiện với gia đình. Chúng thích được chăm sóc và yêu thương, đặc biệt là với trẻ em, có tính cách nhạy bén, nhanh nhẹn và dễ huấn luyện.',
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
                              onPressed: () {}, child: Text('Xem thêm'))
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
