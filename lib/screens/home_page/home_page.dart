import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/controllers/words_controller.dart';
import 'package:words_app_githup/controllers/words_game_controller.dart';
import 'package:words_app_githup/screens/animation_card/animation_card_home_page.dart';
import 'package:words_app_githup/screens/home_page/custom_button.dart';
import 'package:words_app_githup/screens/idioms_pages/idioms_home_page.dart';
import 'package:words_app_githup/screens/selected_words/selected_words_home_page.dart';

import '../study_screens/study_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<WordsController>(context, listen: false).getAllWordsFromDb();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .transportTenWord();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .getRandomIndex();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .transportGameWords();
      Provider.of<Controller>(context, listen: false).reset();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .deleteAllTenList();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .deleteQuizList();
      Provider.of<TransportTenWordsController>(context, listen: false)
          .deleteGameWordList();

      saved();
    });

    super.initState();
  }

  Future<void> saved() async {
    Provider.of<WordsController>(context, listen: false).counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(top: bigPading),
                  child: Column(
                    children: [
                      SizedBox(height: smallPading),
                      const Center(
                          child: Text(
                        ' ENGLISH CENTER ',
                        style: TextStyle(
                            color: kSecondColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                      )),
                      SizedBox(height: smallPading),
                      const Center(
                          child: Text(
                        'İngilizcede Kullanılan En Populer 5000 Kelime',
                        style: TextStyle(
                            color: kSecondColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                )),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 25,
                      shadowColor: kSecondColor,
                      child: Container(
                        color: kPrimaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Spacer(flex: 1),
                            Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    const Spacer(flex: 1),
                                    CustomButtom(
                                        text: 'Kelime Seç',
                                        color: sColor,
                                        textColor: kPrimaryColor,
                                        tap: () {
                                          Provider.of<WordsController>(context,
                                                  listen: false)
                                              .shuffle();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ChooseCardHomePage()));
                                        }),
                                    const Spacer(flex: 1),
                                    CustomButtom(
                                      tap: () {
                                        Provider.of<TransportTenWordsController>(
                                                context,
                                                listen: false)
                                            .shuffle();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StudyHomePage()));
                                      },
                                      text: 'Pratik Yap',
                                      color: fColor,
                                      textColor: kPrimaryColor,
                                    ),
                                    const Spacer(flex: 1),
                                  ],
                                )),
                            const Spacer(flex: 1),
                            Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    const Spacer(flex: 1),
                                    CustomButtom(
                                      tap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const IdiomsHomePage()));
                                      },
                                      text: 'Deyimler',
                                      textColor: kPrimaryColor,
                                      color: tColor,
                                    ),
                                    const Spacer(flex: 1),
                                    CustomButtom(
                                      tap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SelectedWordsHomePage()));
                                      },
                                      text: 'Seçilen \n Kelimeler',
                                      color: fthColor,
                                      textColor: kPrimaryColor,
                                    ),
                                    const Spacer(flex: 1),
                                  ],
                                )),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
