// ignore: file_names
import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> listProduct = [
    Product(
      id: "1",
      name: 'Sơn gel thạch',
      image: 'https://seun.vn/media/news/2106_nail6.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Vẽ marble',
      image:
          'https://youngyogabeauty.com/wp-content/uploads/2021/06/nail-dinh-da-sang-trong-12.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Ombre',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Đắp hoa bột',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Tráng gương',
      image: 'https://toplist.vn/images/800px/trang-nails-1018114.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Hoa fantasy',
      image:
          'https://cdn.toponseek.com/sites/5/2022/09/mau-nail-tay-sang-chanh-13.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Hoa dán 3D',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Sơn del mắt mèo 9D',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Sơn gel lo',
      image: 'https://toplist.vn/images/800px/trang-nails-1018114.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Huyền bí',
      image:
          'https://cdn.toponseek.com/sites/5/2022/09/mau-nail-tay-sang-chanh-13.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Mangter',
      image: 'https://seun.vn/media/news/2106_nail6.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://youngyogabeauty.com/wp-content/uploads/2021/06/nail-dinh-da-sang-trong-12.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
    Product(
      id: "1",
      name: 'Nails Blue',
      image:
          'https://antimatter.vn/wp-content/uploads/2022/05/mau-nail-mau-den.jpg',
      description: 'Dịch vụ mới về',
      price: 100.000,
    ),
    Product(
      id: "1",
      name: 'Nails Nữ Hoàng',
      image:
          'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
      description: 'Dịch vụ mới về',
      price: 120.000,
    ),
  ];
  List<Product> get items => [...listProduct];
}
