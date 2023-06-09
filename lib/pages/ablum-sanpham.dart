import 'dart:convert';

import 'package:bill_app/provider/Products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/master-page.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class AblumSanPhamPage extends StatelessWidget {
  static const String routerName = '/album-page';
  // ignore: prefer_const_constructors_in_immutables
  AblumSanPhamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return MasterPage(
      title: 'Ablum sản phẩm',
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) => SanPham(
          products[index].id,
          products[index].image,
          products[index].name,
          products[index].price,
          products[index].description,
          products[index].quantity,
        ),
      ),
    );
  }
}

class SanPham extends StatelessWidget {
  String? id;
  String? image;
  String? name;
  double? price;
  String? description;
  int? quantity;
  SanPham(String? id, String? image, String? name, double? price,
      String? description, int? quantity,
      {super.key}) {
    this.id = id;
    this.image = image;
    this.name = name;
    this.price = price;
    this.description = description;
    this.quantity = quantity;
  }
  void addCart(String name, String image, double price, String description,
      int quantity) async {
    final url = Uri.https(
        'salabeauty-42a26-default-rtdb.asia-southeast1.firebasedatabase.app',
        'tb_Cart.json');
    final respone = await http.post(url,
        body: json.encode({
          'image': image,
          'name': name,
          'price': price,
          'description': description,
          'quantity': quantity,
        }));
    print(respone.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context)
            //     .pushNamed(DetailProductPage.routerName, arguments: id);
            // print(id);
          },
          child: Image.network(
            image ?? '',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(255, 251, 210, 230),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          title: Text(
            name ?? '',
          ),
          trailing: IconButton(
            onPressed: () {
              addCart(name ?? '', image ?? '', price!, description!, quantity!);
              SnackBar snackBar = const SnackBar(
                content: Text('Thêm vào giỏ hàng thành công'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ));
  }
}
