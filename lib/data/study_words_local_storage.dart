import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';

class StudyWordsLocalStorage {
  late Box<StudyWordsSaveModel> _wordsBox;

  StudyWordsLocalStorage() {
    _wordsBox = Hive.box<StudyWordsSaveModel>('studyWords');
  }

  Future<void> addIndex({required StudyWordsSaveModel index}) async {
    await _wordsBox.put(index.englishWord, index);
  }

  Future<bool> deleteIndex({required StudyWordsSaveModel index}) async {
    await index.delete();
    return true;
  }

  Future<List<StudyWordsSaveModel>> getAllList() async {
    List<StudyWordsSaveModel> _allList = <StudyWordsSaveModel>[];
    _allList = _wordsBox.values.toList();

    return _allList;
  }

  Future<StudyWordsSaveModel?> getIndex({required String id}) async {
    if (_wordsBox.containsKey(id)) {
      return _wordsBox.get(id);
    } else {
      return null;
    }
  }

  Future<StudyWordsSaveModel> updateIndex(
      {required StudyWordsSaveModel index}) async {
    await index.save();
    return index;
  }

  deleteAllList() async {
    return _wordsBox.clear();
  }
}
