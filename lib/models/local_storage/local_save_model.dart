import 'package:hive/hive.dart';

part 'local_save_model.g.dart';

@HiveType(typeId: 1)
class WordsLocalSaveModel extends HiveObject {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String englishWord;
  @HiveField(3)
  final String turkishWord;
  @HiveField(4)
  final String pronunciation;
  @HiveField(5)
  final String lvl;
  @HiveField(6)
  bool? selected;

  WordsLocalSaveModel({
    required this.englishWord,
    required this.turkishWord,
    required this.selected,
    required this.lvl,
    required this.pronunciation,
    required this.id,
  });

  factory WordsLocalSaveModel.create({
    required String englishWord,
    required String turkishWord,
    required String pronunciation,
    required int id,
    required String lvl,
  }) {
    return WordsLocalSaveModel(
      englishWord: englishWord,
      turkishWord: turkishWord,
      lvl: lvl,
      selected: false,
      pronunciation: pronunciation,
      id: id,
    );
  }
}

@HiveType(typeId: 2)
class StudyWordsSaveModel extends HiveObject {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String englishWord;
  @HiveField(3)
  final String turkishWord;
  @HiveField(4)
  final String pronunciation;
  @HiveField(5)
  final String lvl;
  @HiveField(6)
  bool? selected;
  StudyWordsSaveModel({
    required this.englishWord,
    required this.turkishWord,
    required this.lvl,
    required this.pronunciation,
    required this.selected,
    required this.id,
  });

  factory StudyWordsSaveModel.create({
    required String englishWord,
    required String turkishWord,
    required String pronunciation,
    required int id,
    required String lvl,
  }) {
    return StudyWordsSaveModel(
      englishWord: englishWord,
      turkishWord: turkishWord,
      lvl: lvl,
      pronunciation: pronunciation,
      id: id,
      selected: false,
    );
  }
}

@HiveType(typeId: 3)
class CounterModel extends HiveObject {
  @HiveField(1)
  final int num;
  @HiveField(2)
  final String name;

  CounterModel({
    required this.name,
    required this.num,
  });
  factory CounterModel.create({
    required int num,
    required String name,
  }) {
    return CounterModel(num: num, name: name);
  }
}
