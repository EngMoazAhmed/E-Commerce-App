import 'package:e_commerce_app/core/view_model/home_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({Key? key}) : super(key: key);

  // static const Map<String, String> _items = {
  //   'Men': 'assets/images/1.png',
  //   'Women': 'assets/images/2.png',
  //   'Devices': 'assets/images/3.png',
  //   'Gadgets': 'assets/images/4.png',
  //   'Gaming': 'assets/images/5.png',
  // };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.network(
                    controller.categoryModel[index].image.toString(),
                    // height: 10,
                    // width: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: controller.categoryModel[index].name.toString(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
