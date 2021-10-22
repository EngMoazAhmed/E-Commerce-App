import 'package:e_commerce_app/constants/checkout.dart';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/auth/custom_text_form_field.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBody extends GetWidget<CheckoutViewModel> {
  const AddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.1,
        left: Get.width * 0.01,
        right: Get.width * 0.01,
      ),
      child: GetBuilder<CheckoutViewModel>(builder: (_) {
        return Column(
          children: [
            RadioListTile(
              value: AddressType.sameAddress,
              groupValue: controller.addressType,
              contentPadding: const EdgeInsets.all(0),
              onChanged: (newType) {
                controller.updateAddressType(newType as AddressType);
              },
              title: const CustomText(
                text: 'Billing address is the same as '
                    'delivery address.',
              ),
              selected: true,
              activeColor: kPrimaryColor,
            ),
            SizedBox(height: Get.height * 0.025),
            CustomTextFormField(
              text: 'Street 1',
              hint: '21, Alex Davidson Avenue',
              onSave: (newValue) {
                controller.street1 = newValue;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Street can\'t be empty.';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: Get.height * 0.025),
            CustomTextFormField(
              text: 'Street 2',
              hint: 'Opposite Omegatron, Vicent Quarters',
              onSave: (newValue) {
                controller.street2 = newValue;
              },
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: Get.height * 0.025),
            CustomTextFormField(
              text: 'City',
              hint: 'Victoria Island',
              onSave: (newValue) {
                controller.city = newValue;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'City can\'t be empty.';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: Get.height * 0.025),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    text: 'State',
                    hint: 'Lagos State',
                    onSave: (newValue) {
                      controller.city = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'State can\'t be empty.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                Expanded(
                  child: CustomTextFormField(
                    text: 'Country',
                    hint: 'Nigeria',
                    onSave: (newValue) {
                      controller.city = newValue;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Country can\'t be empty.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
