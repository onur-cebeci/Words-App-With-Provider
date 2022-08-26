class QuestionModel {
  final String question;
  final String correctOption;
  bool? answered;
  final List<Option> list;

  QuestionModel({
    required this.list,
    required this.question,
    required this.correctOption,
    required this.answered,
  });

  factory QuestionModel.create({
    required String question,
    required List<Option> list,
    required String correctOption,
  }) {
    return QuestionModel(
      question: question,
      list: list,
      correctOption: correctOption,
      answered: false,
    );
  }
}

class Option {
  final String text;
  final bool isCorrect;
  Option({required this.text, required this.isCorrect});
}

/*
import 'package:words_app/models/local_storage/local_save_model.dart';

class Question {
  final String text;
  final List<Option> options;
  bool islocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.islocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;
  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final question = [
  Question(text: 'I......... saving up to by a car ', options: [
    const Option(text: ' do', isCorrect: false),
    const Option(text: ' am', isCorrect: true),
    const Option(text: ' are', isCorrect: false),
    const Option(text: ' is', isCorrect: false),
  ]),
  Question(text: '2 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: false),
    const Option(text: 'are', isCorrect: true),
    const Option(text: 'is', isCorrect: false),
  ]),
  Question(text: '3 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: true),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: false),
  ]),
  Question(text: '4 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: false),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: true),
  ]),
  Question(text: '5 I......... saving up to by a car', options: [
    const Option(text: 'do', isCorrect: false),
    const Option(text: 'am', isCorrect: true),
    const Option(text: 'are', isCorrect: false),
    const Option(text: 'is', isCorrect: false),
  ]),
];

 */
