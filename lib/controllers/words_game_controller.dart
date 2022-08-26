import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/data/study_words_local_storage.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';
import 'package:words_app_githup/screens/study_screens/game_words/message_box.dart';

class Controller extends ChangeNotifier {
  late List<StudyWordsSaveModel> studyList = <StudyWordsSaveModel>[];
  late StudyWordsLocalStorage studyWordsLocalStorage = StudyWordsLocalStorage();
  int totalLetters = 0;
  int letterAnswered = 0;
  int wordsAnswered = 0;
  bool genareteWord = true;
  bool sessionCompleted = false;
  bool tab = false;

  setUp({required int total}) {
    letterAnswered = 0;
    totalLetters = total;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) async {
    studyList = await studyWordsLocalStorage.getAllList();
    letterAnswered++;
    if (letterAnswered == totalLetters) {
      wordsAnswered++;
      tab = false;
      if (wordsAnswered ==
              Provider.of<TransportTenWordsController>(context, listen: false)
                  .gameWoldList
                  .length ||
          wordsAnswered == 5) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MassageBox(sessionCompleted: sessionCompleted));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    genareteWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    genareteWord = true;
  }

  press() {
    tab = !tab;
    notifyListeners();
  }
}
