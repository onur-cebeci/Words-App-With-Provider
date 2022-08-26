import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/models/study_card_ten_word.dart';
import 'package:words_app_githup/screens/study_screens/study_exam_page/exam_page.dart';

class WordItemWidget extends StatelessWidget {
  final StudyCardTenWordsModel? word;

  final int index;
  const WordItemWidget({Key? key, this.word, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Spacer(flex: 1),
          const SizedBox(height: 30),
          size < 1000
              ? CardWidget(
                  word: word,
                  index: index,
                  height: 400,
                  width: 300,
                )
              : CardWidget(
                  word: word,
                  index: index,
                  height: 650,
                  width: 400,
                ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              index >
                      Provider.of<TransportTenWordsController>(context,
                                  listen: false)
                              .tenWords
                              .length -
                          2
                  ? MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const StudyExamPage()));
                      },
                      color: lightBlueColor,
                      child: SizedBox(
                        height: 40,
                        width: 60,
                        child: Row(
                          children: const [
                            Text(
                              'Geç ',
                              style: TextStyle(color: silverColor),
                            ),
                            Spacer(flex: 1),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: darkColor,
                            ),
                          ],
                        ),
                      ))
                  : Center(),
            ],
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.word,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);

  final StudyCardTenWordsModel? word;
  final int index;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              darkColor,
              lightBlueColor,
            ]),
      ),
      child: Column(
        children: [
          TopLine(word: word, index: index),
          CardBody(
            word: word,
            height: height - 100,
            width: width - 25,
          ),
        ],
      ),
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.word,
    required this.height,
    required this.width,
  }) : super(key: key);

  final StudyCardTenWordsModel? word;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)),
              height: height,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: smallPading),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              word!.englishWord,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: kPrimaryColor,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                  const Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsets.only(top: smallPading),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              word!.pronunciation,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(
                                  color: darkColor,
                                  overflow: TextOverflow.clip,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                  ),
                  const Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsets.only(top: smallPading),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              word!.turkishWord,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: kPrimaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                  const Spacer(flex: 1),
                ],
              )),
        )
      ],
    );
  }
}

class TopLine extends StatelessWidget {
  const TopLine({
    Key? key,
    required this.word,
    required this.index,
  }) : super(key: key);

  final StudyCardTenWordsModel? word;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 40,
            width: 50,
            child: Center(
              child: Text(
                word!.lvl,
                style: const TextStyle(
                    color: sColor, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
