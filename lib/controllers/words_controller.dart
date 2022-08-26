import 'package:flutter/material.dart';
import 'package:words_app_githup/data/hive_local_storage.dart';
import 'package:words_app_githup/data/num_storage.dart';
import 'package:words_app_githup/data/study_words_local_storage.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';
import 'package:words_app_githup/models/words_model.dart';

class WordsController extends ChangeNotifier {
  late List<WordsLocalSaveModel> allList = <WordsLocalSaveModel>[];
  late List<StudyWordsSaveModel> studyList = <StudyWordsSaveModel>[];
  late List<CounterModel> counterList = <CounterModel>[];

  late HiveLocalStorage hiveLocalStorage = HiveLocalStorage();
  late StudyWordsLocalStorage studyWordsLocalStorage = StudyWordsLocalStorage();
  late NumberLocalStorage numberLocalStorage = NumberLocalStorage();

  getAllWordsFromDb() async {
    allList = await hiveLocalStorage.getAllList();
    studyList = await studyWordsLocalStorage.getAllList();
    counterList = await numberLocalStorage.getAllList();
  }

  saveWords() async {
    allList = await hiveLocalStorage.getAllList();
    for (var word in words) {
      int i = 0;
      i++;

      var saveWord = WordsLocalSaveModel.create(
        englishWord: word.english!,
        turkishWord: word.turkish!,
        id: i,
        lvl: word.lvl!,
        pronunciation: word.pronunciation!,
      );

      allList.add(saveWord);
      await hiveLocalStorage.addIndex(index: saveWord);
    }
  }

  selectedCard({required int index}) async {
    allList[index].selected = !allList[index].selected!;

    hiveLocalStorage.updateIndex(index: allList[index]);
    studyList = await studyWordsLocalStorage.getAllList();
    notifyListeners();
  }

  transformApi({required int index}) async {
    if (allList[index].selected == true) {
      if (allList[index].selected == true) {
        var selectedWords = StudyWordsSaveModel.create(
            englishWord: allList[index].englishWord,
            turkishWord: allList[index].turkishWord,
            pronunciation: allList[index].pronunciation,
            id: allList[index].id,
            lvl: allList[index].lvl);

        studyList.add(selectedWords);
        await studyWordsLocalStorage.addIndex(index: selectedWords);
      }
    } else if (allList[index].selected == false) {
      var selectedWords = WordsLocalSaveModel.create(
          englishWord: allList[index].englishWord,
          turkishWord: allList[index].turkishWord,
          pronunciation: allList[index].pronunciation,
          id: allList[index].id,
          lvl: allList[index].lvl);
      allList.add(selectedWords);
      await hiveLocalStorage.addIndex(index: selectedWords);
    }
  }

  removeList({required int index}) async {
    if (allList[index].selected == true) {
      allList.remove(allList[index].id);
      await hiveLocalStorage.deleteIndex(index: allList[index]);
      notifyListeners();
    } else {
      studyList.remove(studyList[index].id);
      await studyWordsLocalStorage.deleteIndex(index: studyList[index]);
      notifyListeners();
    }
  }

  counter() async {
    allList = await hiveLocalStorage.getAllList();
    counterList = await numberLocalStorage.getAllList();

    if (counterList.length == 0) {
      var counterUp = CounterModel.create(num: 1, name: 'first');
      counterList.add(counterUp);
      await numberLocalStorage.addnum(index: counterUp);
      saveWords();
    } else if (allList.length <= 4 && counterList.length >= 1) {
      counterList.remove(counterList);
      await numberLocalStorage.deleteIndex(index: counterList[0]);

      counterList = [];
    }
    notifyListeners();
  }

  shuffle() async {
    allList = await hiveLocalStorage.getAllList();
    allList.shuffle();
    studyList = await studyWordsLocalStorage.getAllList();
    studyList.shuffle();
    notifyListeners();
  }
}
