class GameWordModel {
  final String gameWords;
  GameWordModel({required this.gameWords});
  factory GameWordModel.create({
    required String gameWord,
  }) {
    return GameWordModel(
      gameWords: gameWord,
    );
  }
}

