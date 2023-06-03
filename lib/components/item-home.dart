import 'package:bill_app/pages/bill-screen.dart';
import 'package:bill_app/pages/resources/coming-soon.dart';
import 'package:bill_app/pages/statistics-screen.dart';
import 'package:flutter/material.dart';

import '../models/function-home.dart';

// ignore: camel_case_types
class itemHome extends StatelessWidget {
  const itemHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<FunctionHome> listFunc = [
      FunctionHome(
          id: 1,
          name: 'Mã QR',
          image: 'assets/images/function-home-images/qr-code.png'),
      FunctionHome(
          id: 2,
          name: 'Mã giảm giá',
          image: 'assets/images/function-home-images/discounts.png'),
      FunctionHome(
          id: 3,
          name: 'Dịch vụ',
          image: 'assets/images/function-home-images/service.png'),
      FunctionHome(
          id: 4,
          name: 'Xu hướng',
          image: 'assets/images/function-home-images/trend.png'),
      FunctionHome(
          id: 5,
          name: 'Đồng giá',
          image: 'assets/images/function-home-images/69k.png'),
      FunctionHome(
          id: 6,
          name: 'Chi nhánh',
          image: 'assets/images/function-home-images/service.png'),
      FunctionHome(
          id: 7,
          name: 'Hóa đơn',
          image: 'assets/images/function-home-images/feedback.png'),
      FunctionHome(
          id: 8,
          name: 'Thông tin Bill',
          image: 'assets/images/function-home-images/thong-tin-bill.png'),
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 253, 223, 233),
      ),
      //
      height: MediaQuery.of(context).size.height / 4,

      child: Align(
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.9),
              // crossAxisSpacing: 20,
              // mainAxisSpacing: 20, // khoảng cách giữa các item
              crossAxisCount: 4,
            ),
            itemCount: listFunc.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  switch (listFunc[index].id) {
                    case 7:
                      {
                        Navigator.pushNamed(context, BillPage.routerName);
                        break;
                      }
                    case 8:
                      {
                        Navigator.pushNamed(context, StatisticsPage.routerName);
                        break;
                      }

                    default:
                      {
                        Navigator.pushNamed(context, ComingSoonPage.routerName);
                      }
                  }
                },
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
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        listFunc[index].name ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
