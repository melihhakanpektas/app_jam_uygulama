import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class GameFlutter extends StatefulWidget {
  const GameFlutter({super.key});

  @override
  State<GameFlutter> createState() => _GameFlutterState();
}

class _GameFlutterState extends State<GameFlutter> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Stack(
          children: [
            const GameBackground(),
            Column(
              children: [
                SizedBox(
                    width: AppBar().preferredSize.width,
                    height: AppBar().preferredSize.height + 35),
                Expanded(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: ListView(
                            padding: const EdgeInsets.all(25),
                            children: [
                              ...List.generate(HeaderTopics.lessons.length,
                                  (index1) {
                                final topic = HeaderTopics.lessons[index1];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(topic.title),
                                    ...List.generate(topic.subtopics.length,
                                        (index2) {
                                      final subtopic = topic.subtopics[index2];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(
                                              color: Colors.black,
                                              thickness: 2,
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(subtopic.title),
                                                  Checkbox(
                                                      value: index1 == 0 &&
                                                          index2 < 1,
                                                      onChanged: null)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    const Divider(
                                      thickness: 4,
                                    )
                                  ],
                                );
                              })
                            ],
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Geri',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
