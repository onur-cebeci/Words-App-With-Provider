import 'package:flutter/material.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/models/idioms_model.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

class IdiomsHomePage extends StatelessWidget {
  const IdiomsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBarWidget(context, tColor, 'Deyimler'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kPrimaryColor,
                silverColor,
              ]),
        ),
        child: ListWheelScrollView(
          itemExtent: 350,
          physics: FixedExtentScrollPhysics(),
          perspective: 0.002,
          diameterRatio: 2,
          children: const [
            CustomBodyWidget(
              index: 0,
            ),
            CustomBodyWidget(
              index: 1,
            ),
            CustomBodyWidget(
              index: 2,
            ),
            CustomBodyWidget(
              index: 3,
            ),
            CustomBodyWidget(
              index: 4,
            ),
            CustomBodyWidget(
              index: 5,
            ),
            CustomBodyWidget(
              index: 6,
            ),
            CustomBodyWidget(
              index: 7,
            ),
            CustomBodyWidget(
              index: 8,
            ),
            CustomBodyWidget(
              index: 9,
            ),
            CustomBodyWidget(
              index: 10,
            ),
            CustomBodyWidget(
              index: 11,
            ),
            CustomBodyWidget(
              index: 12,
            ),
            CustomBodyWidget(
              index: 13,
            ),
            CustomBodyWidget(
              index: 14,
            ),
            CustomBodyWidget(
              index: 15,
            ),
            CustomBodyWidget(
              index: 16,
            ),
            CustomBodyWidget(
              index: 17,
            ),
            CustomBodyWidget(
              index: 18,
            ),
            CustomBodyWidget(
              index: 19,
            ),
            CustomBodyWidget(
              index: 20,
            ),
            CustomBodyWidget(
              index: 21,
            ),
            CustomBodyWidget(
              index: 22,
            ),
            CustomBodyWidget(
              index: 23,
            ),
            CustomBodyWidget(
              index: 24,
            ),
            CustomBodyWidget(
              index: 25,
            ),
            CustomBodyWidget(
              index: 26,
            ),
            CustomBodyWidget(
              index: 27,
            ),
            CustomBodyWidget(
              index: 28,
            ),
            CustomBodyWidget(
              index: 29,
            ),
            CustomBodyWidget(
              index: 30,
            ),
            CustomBodyWidget(
              index: 31,
            ),
            CustomBodyWidget(
              index: 32,
            ),
            CustomBodyWidget(
              index: 33,
            ),
            CustomBodyWidget(
              index: 34,
            ),
            CustomBodyWidget(
              index: 35,
            ),
            CustomBodyWidget(
              index: 36,
            ),
            CustomBodyWidget(
              index: 37,
            ),
            CustomBodyWidget(
              index: 38,
            ),
            CustomBodyWidget(
              index: 39,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBodyWidget extends StatelessWidget {
  final int index;
  const CustomBodyWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                tColor,
                lightBlueColor,
              ]),
        ),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Text(
              idiomsList[index].english,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: kPrimaryColor),
            ),
            const Spacer(flex: 1),
            Container(
              height: 1,
              width: size.width,
              color: Colors.black,
            ),
            const Spacer(flex: 1),
            Text(
              idiomsList[index].turkish,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: kPrimaryColor),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
