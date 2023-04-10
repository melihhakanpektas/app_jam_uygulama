import 'dart:async';

import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/oyun_pages/result_page.dart';
import 'package:app_jam_uygulama/providers/lessons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class QuizPage extends StatefulWidget {
  final int index1;
  final int index2;
  const QuizPage(this.index1, this.index2, {super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<ModuleQuestions> questions;
  Timer? timer;
  int second = 0;
  int dogruSayisi = 0;
  int currentQuestion = 0;

  answerTheQuestion(int answerIndex) {
    if (questions[currentQuestion].trueIndex == answerIndex) dogruSayisi++;
    if (currentQuestion == questions.length - 1) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(questions.length, dogruSayisi,
              second, widget.index1, widget.index2)));
    } else {
      setState(
        () {
          currentQuestion++;
        },
      );
    }
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        second++;
      });
    });
    super.initState();

    final headers = context.read<LessonsBloc>().state
      ..removeWhere((element) =>
          element.title == 'Unity ile Oyun Geliştirme' ||
          element.title == 'Oyun Sanatı');
    questions = headers[widget.index1].subtopics[widget.index2].questions;
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const GameBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Süre',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          second.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Soru',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          '${currentQuestion + 1}/${questions.length}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  questions[currentQuestion].question,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Column(
                                children: [
                                  ...List.generate(
                                    4,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            answerTheQuestion(index);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                    questions[currentQuestion]
                                                        .answers[index]),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
