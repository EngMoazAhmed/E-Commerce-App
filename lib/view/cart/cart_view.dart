import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:e_commerce_app/view/widgets/common/details_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartView extends GetWidget<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.cartProductModel.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/empty_cart.svg',
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: Get.width * 0.15,
                ),
                CustomText(
                  text: 'Empty Cart',
                  alignment: Alignment.center,
                  fontSize: Get.width * 0.1,
                  // fontColor: kPrimaryColor,
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 20,
                    ),
                    child: GetBuilder<CartViewModel>(builder: (_) {
                      return controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              itemCount: controller.cartProductModel.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 15),
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Image.network(
                                    controller.cartProductModel[index].image
                                        .toString(),
                                    fit: BoxFit.fill,
                                    width: 120,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartProductModel[index].name
                                            .toString(),
                                        textStyle: GoogleFonts.sourceSerifPro(
                                          fontSize: 16,
                                        ),
                                      ),
                                      CustomText(
                                        text: controller
                                            .cartProductModel[index].price!,
                                        fontColor: kPrimaryColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 35,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .increaseProductItem(index);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            ),
                                            CustomText(
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              alignment: Alignment.center,
                                              fontSize: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .decreaseProductItem(index);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                    }),
                  ),
                ),
                GetBuilder<CartViewModel>(builder: (_) {
                  return DetailsActionButton(
                    upperText: 'TOTAL',
                    lowerText: '\$${controller.totalPrice}',
                    buttonText: 'CHECKOUT',
                    function: () {},
                  );
                }),
              ],
            ),
    );
  }
}
