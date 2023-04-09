import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class GameUnity extends StatefulWidget {
  const GameUnity({super.key});

  @override
  State<GameUnity> createState() => _GameUnityState();
}

class _GameUnityState extends State<GameUnity> {
  final headers = HeaderTopics.lessons
    ..removeWhere((element) =>
        element.title == 'Unity ile Oyun Geliştirme' ||
        element.title == 'Oyun Sanatı');

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Stack(
          children: [
            const GameBackground(),
            Positioned(
              left: -200,
              bottom: 200,
              child: Hero(
                tag: 'unityButton',
                child: Material(
                  color: Colors.transparent,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        'Unity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -200,
              bottom: 200,
              child: Hero(
                tag: 'flutterButton',
                child: Material(
                  color: Colors.transparent,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const GameUnity()));
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
                        'Flutter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 35),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Konu Seç',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Expanded(
                                  child: ListView(
                                    padding: const EdgeInsets.all(25),
                                    children: [
                                      ...List.generate(headers.length,
                                          (index1) {
                                        final topic = headers[index1];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(topic.title),
                                            ...List.generate(
                                                topic.subtopics.length,
                                                (index2) {
                                              final subtopic =
                                                  topic.subtopics[index2];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
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
                                                          Flexible(
                                                              child: Text(
                                                            subtopic.title,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .lightBlue),
                                                          )),
                                                          Checkbox(
                                                              value: index1 ==
                                                                      0 &&
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
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'firstPage2',
                      child: Material(
                        color: Colors.transparent,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // context.read<AppInfoBloc>().setGamePageIndex(0);
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
