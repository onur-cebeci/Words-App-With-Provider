import 'package:flutter/material.dart';
import 'package:words_app_githup/data/study_words_local_storage.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';

class StudyCardController extends ChangeNotifier {
  late List<StudyWordsSaveModel> studyList = <StudyWordsSaveModel>[];
  late StudyWordsLocalStorage studyWordsLocalStorage = StudyWordsLocalStorage();
  late bool deleted = false;
  var pageController = PageController(viewportFraction: 0.8);
  double page = 0.0;

  changeBool() {
    deleted = true;
    notifyListeners();
  }

  animationController() {
    page = pageController.page!;
    notifyListeners();
  }

  init() {
    page = 0.0;
    pageController.addListener((animationController));
  }

  removeStudyWord({required int index}) async {
    studyList = await studyWordsLocalStorage.getAllList();
    print('Remove Tıklandı');
    if (studyList.length > 1) {
      await studyList.remove(studyList[index].englishWord);
      await studyWordsLocalStorage.deleteIndex(index: studyList[index]);
    } else {
      await studyWordsLocalStorage.deleteAllList();
    }
  }

  getFromDb() async {
    studyList = await studyWordsLocalStorage.getAllList();
  }
}
