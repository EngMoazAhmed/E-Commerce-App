import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({Key? key}) : super(key: key);

  static const Map<String, Map<String, String>> _items = {
    'BeoPlay Speaker': {
      'prodPic': 'assets/images/speaker.png',
      'brandName': 'Bang and Olufsen',
      'price': '\$755',
    },
    'Leather Wristwatch': {
      'prodPic': 'assets/images/watch.png',
      'brandName': 'Tag Heuer',
      'price': '\$450',
    },
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 400,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 150,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  _items.values.elementAt(index)['prodPic'].toString(),
                  fit: BoxFit.fill,
                  // height: 10,
                  // width: 10,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: _items.keys.elementAt(index),
                fontSize: 16,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                text: _items.values.elementAt(index)['brandName'].toString(),
                fontSize: 14,
                fontColor: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: _items.values.elementAt(index)['price'].toString(),
                fontSize: 16,
                fontColor: kPrimaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
