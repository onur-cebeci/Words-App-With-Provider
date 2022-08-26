import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/card_controller.dart';
import 'package:words_app_githup/controllers/words_controller.dart';
import 'package:words_app_githup/screens/animation_card/card_widget.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      whiteColor,
      silverColor,
    ]);

class ChooseCardHomePage extends StatefulWidget {
  const ChooseCardHomePage({Key? key}) : super(key: key);

  @override
  State<ChooseCardHomePage> createState() => _ChooseCardHomePageState();
}

class _ChooseCardHomePageState extends State<ChooseCardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: backgroundGradient,
          ),
        )),
        Scaffold(
          appBar: CostumAppBarWidget(context, sColor, 'Kelime Seç'),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: const [
                SizedBox(height: 120),
                AnimationCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimationCard extends StatefulWidget {
  const AnimationCard({Key? key}) : super(key: key);

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  @override
  void initState() {
    Provider.of<CardController>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double page = Provider.of<CardController>(context, listen: true).page;
    final _pageController =
        Provider.of<CardController>(context, listen: false).pageController;
    return Expanded(
      child: PageView.builder(
          controller: _pageController,
          itemCount: Provider.of<WordsController>(context, listen: true)
              .allList
              .length,
          itemBuilder: (context, index) {
            final _listIndex =
                Provider.of<WordsController>(context, listen: false)
                    .allList[index];
            final percent = (page - index).abs().clamp(0.0, 1.0);
            final factor = _pageController.position.userScrollDirection ==
                    ScrollDirection.forward
                ? 1.0
                : -1.0;
            final opacity = percent.clamp(0.0, 0.7);
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(vector.radians(45 * factor * percent)),
              child: Opacity(
                opacity: (1 - opacity),
                child: WordItemWidget(
                  index: index,
                  word: _listIndex,
                ),
              ),
            );
          }),
    );
  }
}
