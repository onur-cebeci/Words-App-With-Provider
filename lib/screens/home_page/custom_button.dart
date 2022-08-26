import 'package:flutter/material.dart';
import 'package:words_app_githup/constant.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.text,
    this.color = kPrimaryColor,
    this.textColor = kSecondColor,
    this.tap,
  }) : super(key: key);

  final String text;
  final Color? color;
  final Color? textColor;
  final GestureTapCallback? tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: kSecondColor.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 5,
                //gölgenin pozizyonu nu değiştirir
                offset: const Offset(0, 0),
              ),
            ]),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor, fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
