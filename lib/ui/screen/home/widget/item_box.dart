import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/utils/config.dart';
import 'package:gharoghari/ui/screen/home/widget/item_details_screen.dart';
import 'package:gharoghari/ui/screen/home/widget/price_text.dart';

class ItemBox extends StatelessWidget {
  final EdgeInsets? margin;
  const ItemBox({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ItemDetailScreen.routeName);
      },
      child: Container(
        width: getWidth(300),
        margin: margin ?? EdgeInsets.only(left: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              height: getWidth(150),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/dummy/image 1 (1).png"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.70)),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(8),
                        child: Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.red,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage("assets/dummy/Rectangle 9.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Facy Dhosa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Row(
                          children: [
                            Text(
                              "By heny",
                              style: TextStyle(
                                  color: AppColor.kGreyColor, fontSize: 11),
                            ),
                            Spacer(),
                            Text(
                              "4.3",
                              style: TextStyle(
                                  color: AppColor.kGreyColor, fontSize: 11),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      DollarWithPrice(price: 70),
                      PriceDiscount(mrp: 100, discountPercent: 30)
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
