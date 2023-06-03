class Product {
  String? id;
  String? name;
  double? price;
  String? description;
  int? quantity;
  String? image;
  bool? isFavorite;
  Product(
      {this.id,
      this.description,
      this.name,
      this.price,
      this.quantity,
      this.image,
      this.isFavorite = false});
}

final List<Product> listCart = [
  Product(
      id: "1",
      name: 'Cắt da tay/chân',
      image:
          'https://th.bing.com/th/id/OIP.Wam7HHJw8u5ML0uvzm4PqAHaHa?pid=ImgDet&rs=1',
      description: 'Hàng mới về',
      price: 100.000,
      quantity: 7), 
  Product(
      id: "2",
      name: 'Dưỡng móng Collagen',
      image:
          'https://th.bing.com/th/id/OIP.Wb9dT_fJcXHiAvX1twBlvAHaJ4?pid=ImgDet&rs=1',
      description: 'Hàng mới về',
      price: 120.000,
      quantity: 2),
  Product(
      id: "3",
      name: 'Dịch vụ sơn, vẽ, trang trí móng',
      image:
          'https://image-us.eva.vn/upload/1-2020/images/2020-01-10/20-mau-nail-dep-don-gian-nhe-nhang-dan-dau-xu-huong-nam-2020-nail-dep-5-1578620216-60-width938height642.jpg',
      description: 'Hàng mới về',
      price: 100.000,
      quantity: 1),
  Product(
      id: "4",
      name: 'Đắp bột, úp móng',
      image:
          'https://th.bing.com/th/id/R.66e5abdb1ad9e9ecebcad21387321d0b?rik=BjizhfVavP65bA&riu=http%3a%2f%2fnailzone.vn%2fwp-content%2fuploads%2f2014%2f12%2f7fe5523e758360a2f317d12c7e6f554e-Copy.jpg&ehk=KMhWscPYJs5D0bxVo%2f3KLwV3pkapeVC0DIpkOO3CxZ4%3d&risl=&pid=ImgRaw&r=0',
      description: 'Hàng mới về',
      price: 120.000,
      quantity: 5),
  Product(
      id: "5",
      name: 'Dịch vụ sơn, vẽ móng',
      image:
          'https://th.bing.com/th/id/OIP.Xg8nxKgxGnO9C566mK-oFgAAAA?pid=ImgDet&rs=1',
      description: 'Hàng mới về',
      price: 100.000,
      quantity: 2),
  Product(
    id: "6",
    name: 'Dịch vụ đắp móng ',
    image:
        'https://weddingguu.com/uploads/ckfinder/userfiles/images/81041001_570458880455214_8734831133411246080_o.jpg',
    description: 'Hàng mới về',
    price: 100.000,
  ),
  Product(
    id: "7",
    name: 'Nails Nữ Hoàng',
    image:
        'https://image-us.eva.vn/upload/1-2020/images/2020-01-10/20-mau-nail-dep-don-gian-nhe-nhang-dan-dau-xu-huong-nam-2020-nail-dep-12-1578620320-812-width600height600.jpg',
    description: 'Hàng mới về',
    price: 120.000,
  ),
  Product(
    id: "9",
    name: 'Nails Ma Thuật',
    image:
        'https://cdn.24h.com.vn/upload/3-2021/images/2021-08-18/20-mau-nail-mau-xanh-dep-sang-trong-va-quy-phai-duoc-yeu-thich-nhat-nail-mau-xanh-2-1629260906-735-width600height494.jpg',
    description: 'Hàng mới về',
    price: 120.000,
  ),
  Product(
    id: "14",
    name: 'Nails Blue',
    image:
        'https://weddingguu.com/uploads/ckfinder/userfiles/images/81041001_570458880455214_8734831133411246080_o.jpg',
    description: 'Hàng mới về',
    price: 100.000,
  ),
  Product(
    id: "1",
    name: 'Nails Huyền bí',
    image:
        'https://th.bing.com/th/id/R.8d84853144087ce37d091b7bb040a78e?rik=VOSNQLHptqQWug&pid=ImgRaw&r=0',
    description: 'Hàng mới về',
    price: 120.000,
  ),
];
