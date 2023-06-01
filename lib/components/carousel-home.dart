import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouseHome extends StatelessWidget {
  const CarouseHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> slide = [
      'assets/images/slides/slide-1.jpg',
      'assets/images/slides/slide-2.jpg',
      'assets/images/slides/slide-3.jpg',
      'assets/images/slides/slide-4.jpg',
      'assets/images/slides/slide-5.jpg',
      'assets/images/slides/slide-6.jpg',
    ];
    return CarouselSlider.builder(
      itemCount: slide.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset(
            slide[index],
            fit: BoxFit.contain,
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 5,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn, // tốc độ chạy
        pauseAutoPlayOnTouch: true, // khi chạm vào thì dừng
        aspectRatio: 1.0,
        enlargeCenterPage: true, // phóng to ảnh giữa
        viewportFraction: 1.0, // chiều rộng của ảnh trong slide (1 là full)
      ),
    );
  }
}
