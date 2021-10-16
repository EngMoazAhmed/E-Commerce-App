import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/view_model/account_view_model.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final height = constrains.maxHeight;
      final width = constrains.maxWidth;
      return GetBuilder<AccountViewModel>(
          init: AccountViewModel(),
          builder: (controller) {
            return controller.userModel == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.08,
                          left: width * 0.035,
                          right: width * 0.035,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(color: Colors.yellow),
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image:
                                          (controller.userModel!.profilePic ==
                                                  'default')
                                              ? const AssetImage(
                                                  'assets/images/meyo.jpg')
                                              : NetworkImage(controller
                                                      .userModel!.profilePic
                                                      .toString())
                                                  as ImageProvider<Object>,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.09),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:
                                          controller.userModel!.name.toString(),
                                      textStyle: GoogleFonts.sourceSansPro(
                                        fontSize: width * 0.06,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    CustomText(
                                      text: controller.userModel!.email
                                          .toString(),
                                      textStyle: GoogleFonts.sourceSansPro(
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.23,
                            ),
                            Column(
                              children: controller.listTiles,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          });
    });
  }
}
