import 'package:flutter/material.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3D1DC),
        title: Text(
          "SALA NAILS & BEAUTY",
          style:
              TextStyle(color: Color(0xFF893F3F), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            // const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Positioned(
                    child: CircleAvatar(
                      radius: 45.0,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        'Quốc Toản',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'MajoraBold',
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                        ),
                        child: Text(
                          'View and edit profile',
                          style: TextStyle(color: Colors.grey, height: 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 5,
                  child: Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 33,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logoma.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kho Voucher',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 5.0,
            ),
            // const SizedBox(height: 7),
            Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo_danhgia.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đánh giá của tôi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),
            Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo_thietlap.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thiết lập tài khoản',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),

            Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/ogo_trogiup.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trợ giúp',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),
            Row(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo_dangxuat.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),

            // Row(
            //   children: [
            //     Expanded(
            //       flex: 4,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Settings',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.w500,
            //                   // fontFamily: 'MajoraW500',
            //                   fontSize: 15))
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       flex: 1,
            //       child: Column(
            //         children: [Icon(Icons.settings, color: Colors.grey)],
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 7),
            // Divider(
            //   color: Color.fromARGB(255, 218, 218, 218),
            //   thickness: 1.0,
            //   indent: 0.0,
            //   endIndent: 10.0,
            // ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) => LoginPage()));
            //   },
            //   style: TextButton.styleFrom(primary: Colors.black),
            //   child: Container(
            //     child: Row(
            //       children: [
            //         Expanded(
            //           flex: 4,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Logout',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     // fontFamily: 'MajoraBold',
            //                     fontSize: 15),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           flex: 1,
            //           child: Column(
            //             children: [Icon(Icons.logout, color: Colors.grey)],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(
            //   color: Color.fromARGB(255, 218, 218, 218),
            //   thickness: 1.0,
            //   indent: 0.0,
            //   endIndent: 10.0,
            // ),
          ],
        ),
      ),
    );
  }
}
