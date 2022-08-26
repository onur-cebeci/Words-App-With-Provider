import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/study_card_controller.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/screens/study_screens/study_card/study_card_widget.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      whiteColor,
      silverColor,
    ]);

class StudyCardHomePage extends StatefulWidget {
  const StudyCardHomePage({Key? key}) : super(key: key);
  @override
  State<StudyCardHomePage> createState() => _StudyCardHomePageState();
}

class _StudyCardHomePageState extends State<StudyCardHomePage> {
  @override
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
          appBar: CostumAppBarWidget(context, darkColor, '1. Aşama'),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: bigPading),
                SmoothPageIndicator(
                  controller:
                      Provider.of<StudyCardController>(context, listen: false)
                          .pageController,
                  count: Provider.of<TransportTenWordsController>(context,
                          listen: false)
                      .tenWords
                      .length,
                  effect: const WormEffect(activeDotColor: darkColor),
                ),
                const AnimationCard(),
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
    Provider.of<StudyCardController>(context, listen: false).init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double page =
        Provider.of<StudyCardController>(context, listen: false).page;

    final _pageController =
        Provider.of<StudyCardController>(context, listen: true).pageController;

    return Expanded(
      child: PageView.builder(
          controller: _pageController,
          itemCount:
              Provider.of<TransportTenWordsController>(context, listen: false)
                  .tenWords
                  .length,
          itemBuilder: (context, index) {
            final _listIndex =
                Provider.of<TransportTenWordsController>(context, listen: true)
                    .tenWords[index];

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
