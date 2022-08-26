import 'package:flutter/material.dart';
import 'package:words_app_githup/constant.dart';

class Drop extends StatelessWidget {
  const Drop({
    Key? key,
    required this.letter,
  }) : super(key: key);
  final String? letter;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool accept = false;

    return SizedBox(
      height: size.height * 0.15,
      width: letter!.length >= 7 ? size.width * 0.15 : size.width * 0.12,
      child: Center(
        child: DragTarget(onWillAccept: (data) {
          if (data == letter!) {
            return true;
          } else {
            return false;
          }
        }, onAccept: (data) {
          accept = true;
        }, builder: (context, candidateData, rejectedData) {
          if (accept) {
            return Text(letter!,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: fColor));
          } else {
            return Container(
              height: 50,
              width: 50,
              color: fColor,
            );
          }
        }),
      ),
    );
  }
}
