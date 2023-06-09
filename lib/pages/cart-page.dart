import 'dart:convert';

// import 'package:bill_app/components/master-page.dart';
import 'package:bill_app/models/product.dart';
import 'package:bill_app/pages/resources/app-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  static const routerName = '/cart-page';

  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> foundEvent = [];
  List<Product> listProduct = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final url = Uri.https(
        'salabeauty-42a26-default-rtdb.asia-southeast1.firebasedatabase.app',
        'tb_Cart.json');
    final respone = await http.get(url);
    print(respone.body);
    final Map<String, dynamic> listData = json.decode(respone.body);
    //  List<Product> listProduct = [];
    for (var item in listData.entries) {
      listProduct.add(Product(
          id: item.key, name: item.value['name'], image: item.value['image']));
    }

    foundEvent = listProduct;
    setState(() {});
  }

  void runFilter(String enteredKeywword) {
    print(enteredKeywword);
    List<Product> results = [];
    if (enteredKeywword.isEmpty) {
      results = listProduct;
    } else {
      results = listProduct
          .where((event) =>
              event.name!.toLowerCase().contains(enteredKeywword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundEvent = results;
    });
  }

  void removeItem(Product item) {
    final url = Uri.https(
        'salabeauty-42a26-default-rtdb.asia-southeast1.firebasedatabase.app',
        'Product/${item.id}.json');
    http.delete(url);
    setState(() {
      foundEvent.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: "Giỏ hàng",
      appBar: AppBar(
        backgroundColor: AppColor.salaColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Xử lý sự kiện khi nút quay lại được nhấn
          },
        ),
        title: Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          //   decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(10)),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0, 1),
          //           blurRadius: 1.0,
          //           spreadRadius: 1.0,
          //           blurStyle: BlurStyle.normal,
          //         )
          //       ]),
          //   // child: TextField(
          //   //   controller: searchController,
          //   //   onChanged: (value) => runFilter(value),
          //   //   decoration: InputDecoration(
          //   //     prefixIcon: Icon(Icons.search),
          //   //     hintText: "Search",
          //   //     border: OutlineInputBorder(
          //   //       borderRadius: BorderRadius.circular(10),
          //   //       borderSide: BorderSide.none,
          //   //     ),
          //   //   ),
          //   // ),
          // ),
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   height: 1,
          //   color: Colors.grey,
          // ),
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: foundEvent.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Slidable(
                    endActionPane: ActionPane(
                      // bên phải thì endActionPane

                      motion: ScrollMotion(),

                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) =>
                              removeItem(foundEvent[index]), // Do something
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 15, start: 25, end: 25),
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                    foundEvent[index].image ?? '',
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            // Image.network(
                            //   listCart[index].image ?? '',
                            // ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        foundEvent[index].name ?? 'Nails',
                                      ),
                                      Icon(Icons.close),
                                    ],
                                  ),
                                  Text('Giá sản phẩm:',
                                      style:
                                          TextStyle(fontFamily: 'MajoraBold')),
                                  Text('60\$',
                                      style:
                                          TextStyle(fontFamily: 'MajoraBold')),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('-'),
                                      ),
                                      Text('1'),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('+'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Subtotal (2 Items)',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      '\$ 600',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Tax',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 40.0),
                    Text(
                      '\$ 60',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Cart Subtotal',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      '\$ 660',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      backgroundColor: Color(0xFFE3458D),
                    ),
                    child: Text(
                      'SECURE CHECKOUT',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
