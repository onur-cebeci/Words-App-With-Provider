import 'package:flutter/material.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/screens/animation_card/animation_card_home_page.dart';

Widget CustomAlertDiolog(BuildContext context) {
  return AlertDialog(
    title: Column(
      children: const [
        Text(
          'Lütfen',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30, color: darkColor, fontWeight: FontWeight.bold),
        ),
        Text(
          '5',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 34, color: sColor, fontWeight: FontWeight.bold),
        ),
        Text(
          'Kelime Seçin',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30, color: darkColor, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    elevation: 10,
    actions: [
      Center(
        child: MaterialButton(
            color: sColor,
            textColor: kPrimaryColor,
            child: const Text('Kelime Seç'),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ChooseCardHomePage()));
            }),
      ),
    ],
  );
}
