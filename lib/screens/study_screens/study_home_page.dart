import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/constant.dart';
import 'package:words_app_githup/controllers/transport_ten_words_controller.dart';
import 'package:words_app_githup/screens/study_screens/study_card/study_card_home_page.dart';
import 'package:words_app_githup/screens/witgets/alert_dialog.dart';

class StudyHomePage extends StatelessWidget {
  const StudyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _studylist =
        Provider.of<TransportTenWordsController>(context).studyList;
    return _studylist.length < 5
        ? GetCustomAlertDiolog()
        : const StudyCardHomePage();
  }
}

class GetCustomAlertDiolog extends StatelessWidget {
  const GetCustomAlertDiolog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                kPrimaryColor,
                silverColor,
              ]),
        ),
        child: CustomAlertDiolog(context));
  }
}
