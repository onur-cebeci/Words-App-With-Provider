class StudyCardTenWordsModel {
  final int id;
  final String englishWord;
  final String turkishWord;
  final String pronunciation;
  final String lvl;

  StudyCardTenWordsModel({
    required this.englishWord,
    required this.turkishWord,
    required this.id,
    required this.pronunciation,
    required this.lvl,
  });
  factory StudyCardTenWordsModel.create(
      {required String englishWord,
      required String turkishWord,
      required String pronunciation,
      required int id,
      required String lvl,
      required}) {
    return StudyCardTenWordsModel(
      lvl: lvl,
      id: id,
      turkishWord: turkishWord,
      englishWord: englishWord,
      pronunciation: pronunciation,
    );
  }
}
