import 'package:e_commerce_app/view/widgets/common/custom_text.dart';
import 'package:flutter/material.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({Key? key}) : super(key: key);

  static const Map<String, String> _items = {
    'Men': 'assets/images/1.png',
    'Women': 'assets/images/2.png',
    'Devices': 'assets/images/3.png',
    'Gadgets': 'assets/images/4.png',
    'Gaming': 'assets/images/5.png',
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
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
                child: Image.asset(
                  _items.values.elementAt(index),
                  // height: 10,
                  // width: 10,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: _items.keys.elementAt(index),
              ),
            ],
          );
        },
      ),
    );
  }
}
