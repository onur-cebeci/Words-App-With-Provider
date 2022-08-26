import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/controllers/words_game_controller.dart';
import 'package:words_app_githup/screens/home_page/home_page.dart';

class MassageBox extends StatelessWidget {
  const MassageBox({Key? key, required this.sessionCompleted})
      : super(key: key);
  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {
    String title = 'Well Done';
    String buttonText = 'Yeni Kelime';

    if (sessionCompleted) {
      title = 'Tamamlandı';
      buttonText = 'Ana Sayfaya Dön';
    }
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(
          child: Text(
        title,
        style: const TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),
      )),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                shadowColor: Colors.white38),
            onPressed: () {
              if (sessionCompleted) {
                Provider.of<Controller>(context, listen: false).reset();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              } else {
                Provider.of<Controller>(context, listen: false)
                    .requestWord(request: true);
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                buttonText,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ))
      ],
    );
  }
}
