import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_app_githup/controllers/words_game_controller.dart';

class Drag extends StatefulWidget {
  const Drag({
    Key? key,
    required this.letter,
  }) : super(key: key);
  final String letter;

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  bool _accepted = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Selector<Controller, bool>(
        selector: (_, controller) => controller.genareteWord,
        builder: (_, generate, __) {
          if (generate) {
            _accepted = false;
          }
          return SizedBox(
            width: size.width * 0.10,
            height: size.height * 0.15,
            child: Center(
              child: _accepted
                  ? SizedBox()
                  : Draggable(
                      data: widget.letter,
                      onDragEnd: (details) {
                        if (details.wasAccepted) {
                          _accepted = true;
                          setState(() {});
                          Provider.of<Controller>(context, listen: false)
                              .incrementLetters(
                            context: context,
                          );
                        }
                      },
                      childWhenDragging: const SizedBox(),
                      feedback: Text(
                        widget.letter,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(shadows: [
                          Shadow(
                            offset: const Offset(3, 3),
                            color: Colors.black.withOpacity(0.40),
                            blurRadius: 5,
                          ),
                        ]),
                      ),
                      child: 4 < widget.letter.length
                          ? Text(
                              widget.letter,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(fontSize: 40),
                            )
                          : Text(
                              widget.letter,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(fontSize: 40),
                            ),
                    ),
            ),
          );
        });
  }
}
