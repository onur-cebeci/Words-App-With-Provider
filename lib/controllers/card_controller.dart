import 'package:flutter/material.dart';

class CardController extends ChangeNotifier {
  var pageController = PageController(viewportFraction: 0.8);
  double page = 0.0;
  animationController() {
    page = pageController.page!;
    notifyListeners();
  }

  init() {
    page = 0.0;
    pageController.addListener((animationController));
  }
}
