// ignore: camel_case_types
import 'package:bill_app/models/function-home.dart';
import 'package:bill_app/pages/ablum-sanpham.dart';
import 'package:bill_app/pages/cart-page.dart';
import 'package:bill_app/pages/resources/coming-soon.dart';
import 'package:bill_app/pages/statistics-screen.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class serviceHome extends StatelessWidget {
  const serviceHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<FunctionHome> listFunc = [
      FunctionHome(
          id: 9,
          name: 'Hóa đơn',
          image: 'assets/images/function-home-images/menudichvu.jpg'),
      FunctionHome(
          id: 10,
          name: 'Ablum sản phẩm',
          image: 'assets/images/function-home-images/ablum-sanpham.jpg'),
      FunctionHome(
          id: 11,
          name: 'Thống kê',
          image: 'assets/images/function-home-images/datlich.jpg'),
      FunctionHome(
          id: 12,
          name: 'Mã giảm giá',
          image: 'assets/images/function-home-images/ma-giam-gia.jpg'),
      FunctionHome(
          id: 13,
          name: 'Giới thiệu bạn bè',
          image: 'assets/images/function-home-images/gioi-thieu-ban-be.jpg'),
      FunctionHome(
          id: 14,
          name: 'Giỏ hàng',
          image: 'assets/images/function-home-images/nails-box.jpg'),
    ];

    return Stack(children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 20.0, right: 10, left: 10, bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/function-home-images/block-chinh.png'),
              fit: BoxFit.cover,
            ),
            color: Color.fromARGB(255, 249, 213, 225),
          ),
          //
          // Làm sao để không trượt khi scroll lên xuống
          //thu nhỏ khoảng cách giữa các hàng trong gridview

          child: Align(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.8), //
                  //crossAxisSpacing: 10,
                  // mainAxisSpacing: 10, // khoảng cách giữa các item
                  crossAxisCount: 3,
                ),
                itemCount: listFunc.length,
                itemBuilder: (BuildContext ctx, index) {
                  return
                      // Item
                      GestureDetector(
                    onTap: () {
                      switch (listFunc[index].id) {
                        // case 9:
                        //   {
                        //     Navigator.pushNamed(context,
                        //         BillPage.routerName); // BillPage.routeName
                        //     break;
                        //   }
                        case 10:
                          {
                            Navigator.pushNamed(
                                context,
                                AblumSanPhamPage
                                    .routerName); // AblumSanPhamPage.routeName
                            break;
                          }
                        case 11:
                          {
                            Navigator.pushNamed(
                                context,
                                StatisticsPage
                                    .routerName); // StatisticsPage.routeName
                            break;
                          }
                        case 14:
                          {
                            Navigator.pushNamed(
                                context,
                                CartPage
                                    .routerName); // StatisticsPage.routeName

                            break;
                          }
                        default:
                          {
                            Navigator.pushNamed(
                                context,
                                ComingSoonPage
                                    .routerName); // ComingSoonPage.routeName
                          }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(66, 126, 123, 123),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              listFunc[index].image ?? '',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 14,
                              width: MediaQuery.of(context).size.height / 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              listFunc[index].name ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.height / 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),

      //
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height / 60,
            right: MediaQuery.of(context).size.height / 60,
            top: MediaQuery.of(context).size.height / 100,
          ),
          height: MediaQuery.of(context).size.height / 20,
          //color: const Color.fromARGB(255, 253, 247, 249), //
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 252, 116, 116), // màu nền
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            "DỊCH VỤ TẠI SALA",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height / 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }
}
