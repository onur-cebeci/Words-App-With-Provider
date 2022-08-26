import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/controllers/words_game_controller.dart';
import 'package:words_app_githup/screens/study_screens/game_words/drag.dart';
import 'package:words_app_githup/screens/study_screens/game_words/drop.dart';
import 'package:words_app_githup/screens/witgets/appBar.dart';

class GameHomePage extends StatefulWidget {
  const GameHomePage({Key? key}) : super(key: key);

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> _words =
        Provider.of<TransportTenWordsController>(context, listen: false)
            .gameWoldList
            .toList();
    late String _word = '';
    late String? _dropWord = '';
    _generateWord() {
      final r = Random().nextInt(_words.length);
      _word = _words[r];
      _dropWord = _word;
      _words.removeAt(r);
      final s = _word.characters.toList()..shuffle();
      _word = s.join();
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        Provider.of<Controller>(context, listen: false)
            .setUp(total: _word.length);
      });
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        Provider.of<Controller>(context, listen: false)
            .requestWord(request: false);
      });
    }

    return Scaffold(
      appBar: CostumAppBarWidget(context, fColor, 'Aşama 3'),
      body: Selector<Controller, bool>(
        selector: (_, controller) => controller.genareteWord,
        builder: (_, generate, __) {
          if (generate) {
            if (Provider.of<TransportTenWordsController>(context, listen: false)
                .gameWoldList
                .isNotEmpty) {
              _generateWord();
            }
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: kPrimaryColor,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: kPrimaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _dropWord!.characters
                          .map((e) => Drop(
                                letter: e,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: kPrimaryColor,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: fColor,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _word.characters
                            .map((e) => Drag(
                                  letter: e,
                                ))
                            .toList()),
                  ),
                ),
                InformationWidget(dropWord: _dropWord!),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  final String dropWord;
  const InformationWidget({Key? key, required this.dropWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          color: fColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<Controller>(context, listen: false).press();
                },
                child: Provider.of<Controller>(context, listen: true).tab ==
                        true
                    ? Text(
                        dropWord,
                        style: const TextStyle(fontSize: 40, inherit: false),
                      )
                    : Card(
                        color: fColor,
                        elevation: 20,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.all(smallPading),
                          child: const Text(
                            'Kelime',
                            style: TextStyle(
                              fontSize: 30,
                              inherit: false,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
