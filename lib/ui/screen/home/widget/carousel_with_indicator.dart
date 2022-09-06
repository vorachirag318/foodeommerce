import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/utils/config.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  CarouselController carouselController = CarouselController();

  List<String> imgList = [
    "assets/dummy/Group 495.png",
    "assets/dummy/Group 496 (1).png",
    "assets/dummy/Frame 475.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: imgList
              .asMap()
              .map((index, value) => MapEntry(
                  index,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(value),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )))
              .values
              .toList(),
          options: CarouselOptions(
            height: getWidth(140),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            viewportFraction: 0.8,
            initialPage: 1,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 35 : 15,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.kPrimaryBlue
                        .withOpacity(_current == entry.key ? 0.9 : 0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
