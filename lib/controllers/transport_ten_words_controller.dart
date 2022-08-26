import 'dart:math';

import 'package:flutter/material.dart';
import 'package:words_app_githup/data/hive_local_storage.dart';
import 'package:words_app_githup/data/study_words_local_storage.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';
import 'package:words_app_githup/models/quiz_model.dart';
import 'package:words_app_githup/models/study_card_ten_word.dart';

class TransportTenWordsController extends ChangeNotifier {
  late List<WordsLocalSaveModel> allList = <WordsLocalSaveModel>[];
  late HiveLocalStorage hiveLocalStorage = HiveLocalStorage();
  late List<StudyWordsSaveModel> studyList = <StudyWordsSaveModel>[];
  late StudyWordsLocalStorage studyWordsLocalStorage = StudyWordsLocalStorage();
  late List<StudyCardTenWordsModel> tenWords = <StudyCardTenWordsModel>[];
  late List<QuestionModel> quizList = <QuestionModel>[];
  late List<String> gameWoldList = <String>[];
  int randomIndex = 1;
  int randomIndex2 = 1;

  transportTenWord() async {
    studyList = await studyWordsLocalStorage.getAllList();
    studyList.shuffle();
    if (studyList.length > 10 && tenWords.isEmpty) {
      for (int i = 0; i <= 9; i++) {
        var index = StudyCardTenWordsModel.create(
            englishWord: studyList[i].englishWord,
            turkishWord: studyList[i].turkishWord,
            pronunciation: studyList[i].pronunciation,
            id: studyList[i].id,
            lvl: studyList[i].lvl);
        tenWords.add(index);
      }
    } else if (studyList.length > 4 && tenWords.isEmpty) {
      for (int i = 0; i <= studyList.length; i++) {
        var index = StudyCardTenWordsModel.create(
            englishWord: studyList[i].englishWord,
            turkishWord: studyList[i].turkishWord,
            pronunciation: studyList[i].pronunciation,
            id: studyList[i].id,
            lvl: studyList[i].lvl);

        tenWords.add(index);
      }
    }
  }

  shuffle() {
    tenWords.shuffle();
    notifyListeners();
  }

  deleteAllTenList() async {
    tenWords = [];

    notifyListeners();
  }

  getRandomIndex() async {
    allList = await hiveLocalStorage.getAllList();
    studyList = await studyWordsLocalStorage.getAllList();
    randomIndex = Random().nextInt(allList.length);
    randomIndex2 = Random().nextInt(allList.length);

    studyList.forEach((index) async {
      randomIndex = Random().nextInt(allList.length);
      randomIndex2 = Random().nextInt(allList.length);
      if (index.turkishWord == allList[randomIndex].turkishWord) {
        randomIndex = Random().nextInt(allList.length);
      } else {
        randomIndex;
      }
      if (index.turkishWord == allList[randomIndex2].turkishWord) {
        randomIndex2 = Random().nextInt(allList.length);
      } else if (allList[randomIndex].turkishWord ==
          allList[randomIndex2].turkishWord) {
        randomIndex2 = Random().nextInt(allList.length);
      } else {
        randomIndex2;
      }

      var value = QuestionModel.create(
          question: index.englishWord,
          list: [
            Option(text: index.turkishWord, isCorrect: true),
            Option(text: allList[randomIndex].turkishWord, isCorrect: false),
            Option(text: allList[randomIndex2].turkishWord, isCorrect: false),
          ],
          correctOption: index.turkishWord);

      quizList.add(value);
    });
  }

  deleteQuizList() {
    quizList = [];
  }

  shuffleOption() {
    for (int i = 0; i < quizList.length; i++) {
      quizList[i].list.shuffle();
    }
  }

  transportGameWords() async {
    studyList = await studyWordsLocalStorage.getAllList();

    studyList.forEach((index) {
      var wordValue = index.englishWord.toString();
      if (index.englishWord.length < 9) {
        gameWoldList.add(wordValue);
      }
    });
  }

  deleteGameWordList() {
    gameWoldList = [];
  }
}
