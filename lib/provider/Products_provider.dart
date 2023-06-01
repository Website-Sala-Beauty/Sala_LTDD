// ignore: file_names
import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> listProduct = [
    Product(
      id: "1",
      name: 'Nails Blue',
      image: 'https://seun.vn/media/news/2106_nail6.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://youngyogabeauty.com/wp-content/uploads/2021/06/nail-dinh-da-sang-trong-12.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Black',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Ma Thuật',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Agautr',
      image: 'https://toplist.vn/images/800px/trang-nails-1018114.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Red Print',
      image:
          'https://cdn.toponseek.com/sites/5/2022/09/mau-nail-tay-sang-chanh-13.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Carasfde',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Blue',
      image: 'https://toplist.vn/images/800px/trang-nails-1018114.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Huyền bí',
      image:
          'https://cdn.toponseek.com/sites/5/2022/09/mau-nail-tay-sang-chanh-13.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Mangter',
      image: 'https://seun.vn/media/news/2106_nail6.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://youngyogabeauty.com/wp-content/uploads/2021/06/nail-dinh-da-sang-trong-12.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Blue',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Hàng mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Hàng mới về',
      price: 120.000,
    ),
  ];
  List<Product> get items => [...listProduct];
}
