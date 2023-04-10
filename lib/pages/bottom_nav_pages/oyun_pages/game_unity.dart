import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/oyun_pages/quiz_page.dart';
import 'package:app_jam_uygulama/providers/lessons_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';

class GameUnity extends StatefulWidget {
  const GameUnity({super.key});

  @override
  State<GameUnity> createState() => _GameUnityState();
}

class _GameUnityState extends State<GameUnity> {
  @override
  Widget build(BuildContext context) {
    final headers = context.read<LessonsBloc>().state
      ..removeWhere((element) =>
          element.title == 'Flutter ile Uygulama Geliştirme Eğitimleri');
    return Material(
      child: Center(
        child: Stack(
          children: [
            const GameBackground(),
            Positioned(
              left: -200,
              bottom: 250,
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
              bottom: 250,
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
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Konu Seç',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(thickness: 2, height: 0),
                              Expanded(
                                child: ListView(
                                  padding: const EdgeInsets.all(25),
                                  children: [
                                    ...List.generate(headers.length, (index1) {
                                      final topic = headers[index1];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(topic.title),
                                          ...List.generate(
                                              topic.subtopics.length, (index2) {
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
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  QuizPage(
                                                                      index1,
                                                                      index2)));
                                                    },
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
                                                        FutureBuilder(
                                                            future: FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'scorboard')
                                                                .get(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return const Checkbox(
                                                                    value:
                                                                        false,
                                                                    onChanged:
                                                                        null);
                                                              } else {
                                                                var docs = snapshot
                                                                    .data!.docs
                                                                    .map((e) =>
                                                                        e.data())
                                                                    .toList();
                                                                for (var doc
                                                                    in docs) {
                                                                  if (doc['uid'] ==
                                                                          FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid &&
                                                                      doc['index1'] ==
                                                                          index1 &&
                                                                      doc['index2'] ==
                                                                          index2) {
                                                                    return const Checkbox(
                                                                        value:
                                                                            true,
                                                                        onChanged:
                                                                            null);
                                                                  } else {
                                                                    return const Checkbox(
                                                                        value:
                                                                            false,
                                                                        onChanged:
                                                                            null);
                                                                  }
                                                                }
                                                              }
                                                              return const Checkbox(
                                                                  value: false,
                                                                  onChanged:
                                                                      null);
                                                            })
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
                          ),
                        ),
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
