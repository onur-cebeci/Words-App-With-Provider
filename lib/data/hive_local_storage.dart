import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';

class HiveLocalStorage {
  late Box<WordsLocalSaveModel> _wordsBox;

  HiveLocalStorage() {
    _wordsBox = Hive.box<WordsLocalSaveModel>('saveWords');
  }

  Future<void> addIndex({required WordsLocalSaveModel index}) async {
    await _wordsBox.put(index.englishWord, index);
  }

  Future<bool> deleteIndex({required WordsLocalSaveModel index}) async {
    await index.delete();
    return true;
  }

  Future<List<WordsLocalSaveModel>> getAllList() async {
    List<WordsLocalSaveModel> _allList = <WordsLocalSaveModel>[];
    _allList = _wordsBox.values.toList();

    return _allList;
  }

  Future<WordsLocalSaveModel?> getIndex({required String id}) async {
    if (_wordsBox.containsKey(id)) {
      return _wordsBox.get(id);
    } else {
      return null;
    }
  }

  Future<WordsLocalSaveModel> updateIndex(
      {required WordsLocalSaveModel index}) async {
    await index.save();
    return index;
  }
}
