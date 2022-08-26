import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/study_card_controller.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/controllers/words_controller.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

class SelectedWordsHomePage extends StatefulWidget {
  const SelectedWordsHomePage({Key? key}) : super(key: key);

  @override
  State<SelectedWordsHomePage> createState() => _SelectedWordsHomePageState();
}

class _SelectedWordsHomePageState extends State<SelectedWordsHomePage> {
  @override
  void initState() {
    Provider.of<StudyCardController>(context, listen: false).getFromDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CostumAppBarWidget(context, fthColor, ' Seçilen Kelimeler'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: smallPading),
              Expanded(
                  child: ListView.builder(
                      itemCount: Provider.of<TransportTenWordsController>(
                              context,
                              listen: false)
                          .studyList
                          .length,
                      itemBuilder: (context, index) {
                        var itemIndex =
                            Provider.of<WordsController>(context, listen: false)
                                .studyList[index];

                        return itemIndex.selected == false
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    height: size.height / 8,
                                    width: size.width - 50,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: sColor,
                                          blurRadius: 1,
                                          spreadRadius: 3,
                                        ),
                                      ],
                                      shape: BoxShape.rectangle,
                                      color: fthColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: FlipCard(
                                      speed: 800,
                                      direction: FlipDirection.VERTICAL,
                                      front: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              itemIndex.englishWord,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: smallPading),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<StudyCardController>(
                                                          context,
                                                          listen: false)
                                                      .removeStudyWord(
                                                          index: index);
                                                  itemIndex.selected = true;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 32,
                                                color: whiteColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      back: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              itemIndex.turkishWord,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: smallPading),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<StudyCardController>(
                                                          context,
                                                          listen: false)
                                                      .removeStudyWord(
                                                          index: index);
                                                  itemIndex.selected = true;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 32,
                                                color: darkColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              )
                            : Center();
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
