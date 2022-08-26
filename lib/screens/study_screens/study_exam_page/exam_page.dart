import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/screens/study_screens/game_words/game_home_page.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

class StudyExamPage extends StatefulWidget {
  const StudyExamPage({Key? key}) : super(key: key);

  @override
  State<StudyExamPage> createState() => _StudyExamPageState();
}

class _StudyExamPageState extends State<StudyExamPage> {
  String optionSelected = "";
  @override
  void initState() {
    Provider.of<TransportTenWordsController>(context, listen: false)
        .shuffleOption();
    super.initState();
  }

  PageController _pageController = PageController();

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CostumAppBarWidget(context, darkColor, '2. Aşama'),
      body: PageView.builder(
          controller: _pageController,
          itemCount: Provider.of<TransportTenWordsController>(context,
                          listen: false)
                      .quizList
                      .length <
                  10
              ? Provider.of<TransportTenWordsController>(context, listen: false)
                  .quizList
                  .length
              : 10,
          itemBuilder: (context, index) {
            final _itemIndex =
                Provider.of<TransportTenWordsController>(context, listen: false)
                    .quizList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  const Spacer(flex: 1),
                  Container(
                    height: size.height / 4,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              textColor,
                              fColor,
                            ]),
                        color: silverColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        _itemIndex.question,
                        style: const TextStyle(
                            color: darkColor,
                            fontSize: 42,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                  InkWell(
                    onTap: () {
                      if (_itemIndex.answered == false) {
                        if (_itemIndex.list[0] == _itemIndex.correctOption) {
                          optionSelected = _itemIndex.list[0].text;
                          _itemIndex.answered = true;
                          setState(() {});
                          nextPage();
                        } else {
                          optionSelected = _itemIndex.list[0].text;
                          _itemIndex.answered = true;

                          setState(() {});
                          nextPage();
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        height: size.height / 7,
                        width: size.width,
                        color: _itemIndex.answered == true
                            ? _itemIndex.list[0].isCorrect == true
                                ? Colors.green
                                : Colors.red
                            : Colors.grey.shade200,
                        child: Center(
                          child: Text(
                            _itemIndex.list[0].text,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  InkWell(
                    onTap: () {
                      if (_itemIndex.answered == false) {
                        if (_itemIndex.list[1] == _itemIndex.correctOption) {
                          optionSelected = _itemIndex.list[1].text;
                          _itemIndex.answered = true;
                          nextPage();
                          setState(() {});
                        } else {
                          optionSelected = _itemIndex.list[1].text;
                          _itemIndex.answered = true;
                          nextPage();
                          setState(() {});
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        height: size.height / 7,
                        width: size.width,
                        color: _itemIndex.answered == true
                            ? _itemIndex.list[1].isCorrect == true
                                ? Colors.green
                                : Colors.red
                            : Colors.grey.shade200,
                        child: Center(
                          child: Text(
                            _itemIndex.list[1].text,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  InkWell(
                    onTap: () {
                      if (_itemIndex.answered == false) {
                        if (_itemIndex.list[2] == _itemIndex.correctOption) {
                          optionSelected = _itemIndex.list[2].text;
                          _itemIndex.answered = true;
                          nextPage();
                          setState(() {});
                        } else {
                          optionSelected = _itemIndex.list[2].text;
                          _itemIndex.answered = true;
                          nextPage();
                          setState(() {});
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        height: size.height / 7,
                        width: size.width,
                        color: _itemIndex.answered == true
                            ? _itemIndex.list[2].isCorrect == true
                                ? Colors.green
                                : Colors.red
                            : Colors.grey.shade200,
                        child: Center(
                          child: Text(
                            _itemIndex.list[2].text,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      index >
                                  Provider.of<TransportTenWordsController>(
                                              context,
                                              listen: false)
                                          .quizList
                                          .length -
                                      2 ||
                              index > 8
                          ? MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GameHomePage()));
                              },
                              color: fColor,
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
                                      color: textColor,
                                    ),
                                  ],
                                ),
                              ))
                          : Center(),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            );
          }),
    );
  }
}
