import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/home_view_model.dart';
import 'package:e_commerce_app/view/details/details_view.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({Key? key}) : super(key: key);

  // static const Map<String, Map<String, String>> _items = {
  //   'BeoPlay Speaker': {
  //     'prodPic': 'assets/images/speaker.png',
  //     'brandName': 'Bang and Olufsen',
  //     'price': '\$755',
  //   },
  //   'Leather Wristwatch': {
  //     'prodPic': 'assets/images/watch.png',
  //     'brandName': 'Tag Heuer',
  //     'price': '\$450',
  //   },
  // };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 400,
      child: GetBuilder<HomeViewModel>(
        builder: (controller) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailsView(
                        productModel: controller.productModel[index],
                      ),
                    );
                  },
                  child: Container(
                    // height: 150,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      controller.productModel[index].image.toString(),
                      fit: BoxFit.fill,
                      // height: 10,
                      // width: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.productModel[index].name.toString(),
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: width * 0.45,
                  child: CustomText(
                    text: controller.productModel[index].description.toString(),
                    fontSize: 14,
                    fontColor: Colors.grey,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.productModel[index].price.toString(),
                  fontSize: 16,
                  fontColor: kPrimaryColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
