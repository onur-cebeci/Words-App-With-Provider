import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_app_githup/models/local_storage/local_save_model.dart';

class NumberLocalStorage {
  late Box<CounterModel> _numBox;

  NumberLocalStorage() {
    _numBox = Hive.box<CounterModel>('numWords');
  }

  Future<void> addnum({required CounterModel index}) async {
    await _numBox.put(index.name, index);
  }

  Future<List<CounterModel>> getAllList() async {
    List<CounterModel> _allList = <CounterModel>[];
    _allList = _numBox.values.toList();

    return _allList;
  }

  Future<bool> deleteIndex({required CounterModel index}) async {
    await index.delete();
    return true;
  }
}
