import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/auth/custom_button.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:e_commerce_app/view/widgets/common/details_action_button.dart';
import 'package:e_commerce_app/view/widgets/detalis/custom_rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              productModel.image.toString(),
              fit: BoxFit.fill,
              height: 200,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomText(
                        text: productModel.name.toString(),
                        alignment: Alignment.topLeft,
                        textStyle: GoogleFonts.sourceSansPro(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomRoundedContainer(
                              leftText: 'Size',
                              rightText: productModel.size.toString(),
                            ),
                            CustomRoundedContainer(
                              leftText: 'Color',
                              color: productModel.color,
                            ),
                          ],
                        ),
                      ),
                      const CustomText(text: 'Details'),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: productModel.description.toString(),
                        fontHeight: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => DetailsActionButton(
              upperText: 'PRICE',
              lowerText: productModel.price.toString(),
              buttonText: 'ADD',
              function: () => controller.addProduct(CartProductModel(
                name: productModel.name,
                image: productModel.image,
                price: productModel.price,
                productId: productModel.productId,
                quantity: 1,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
