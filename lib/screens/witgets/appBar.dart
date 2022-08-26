import 'package:flutter/material.dart';
import 'package:words_app_githup/screens/home_page/home_page.dart';

PreferredSizeWidget CostumAppBarWidget(
    BuildContext context, Color color, String text) {
  return AppBar(
    backgroundColor: color,
    leading: InkWell(
      child: const Icon(Icons.arrow_back),
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      },
    ),
    title: Text(text),
  );
}
