import 'dart:math';
import 'dart:ui';

import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/oyun_pages/game_flutter.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/oyun_pages/game_unity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChooseOnePage extends StatefulWidget {
  const ChooseOnePage({Key? key}) : super(key: key);

  @override
  ChooseOnePageState createState() => ChooseOnePageState();
}

class ChooseOnePageState extends State<ChooseOnePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  List<int> randomNumbers = [for (var i = 0; i < 11; i++) Random().nextInt(4)];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isimListesi = [
      'Ali Kadir Kilic',
      'Melih Hakan Pektas',
      'Berna Cakir',
      'Zeynep Mete'
    ];
    final puanlar = [
      2458,
      5673,
      4956,
      2345,
      5678,
      3456,
      4567,
      2345,
      3745,
      4856,
    ];
    puanlar.sort((a, b) => b.compareTo(a));
    return Material(
      child: Center(
        child: Stack(
          children: [
            Positioned(
                top: -320,
                child: Hero(
                  tag: 'firstPage1',
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text('Oyun ve Uygulama Yarışması',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                        ),
                        const Image(
                            image: AssetImage('assets/images/oua_oyun.png')),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.trending_up,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'En Yüksek Skor: 100',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            //ARKAPLAN
            const GameBackground(
              key: ValueKey(234234),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('scorboard')
                            .snapshots(),
                        builder: ((context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.data!.docs.isNotEmpty) {
                            var dataMap = <String, ScoreBoard>{};
                            for (var doc in snapshot.data!.docs) {
                              var data = doc.data() as Map<String, dynamic>;
                              var uid = data['uid'] as String;
                              var name = data['name'] as String;
                              var point = data['point'] as int;
                              var index1 = data['index1'] as int;
                              var index2 = data['index2'] as int;

                              var key = '${index1}_$index2';
                              if (dataMap.containsKey(key)) {
                                var scoreboard = dataMap[key]!;
                                if (point > scoreboard.point) {
                                  dataMap[key] = scoreboard.copyWith(
                                      name: name, point: point, uid: uid);
                                }
                              } else {
                                dataMap[key] = ScoreBoard(
                                    uid: uid,
                                    name: name,
                                    point: point,
                                    index1: index1,
                                    index2: index2);
                              }
                            }

                            var data = dataMap.values.toList();
                            var uidList = data.map((e) => e.uid).toSet();
                            var lastData = [];

                            for (var a in uidList) {
                              int foldedPoint = dataMap.values
                                  .where((element) => element.uid == a)
                                  .map((e) => e.point)
                                  .fold(
                                      0,
                                      (previousValue, element) =>
                                          previousValue + element);
                              lastData.add(ScoreBoard(
                                  uid: a,
                                  name: dataMap.values
                                      .firstWhere((element) => element.uid == a)
                                      .name,
                                  point: foldedPoint,
                                  index1: 1,
                                  index2: 1));
                            }

                            return Column(
                              children: [
                                // Skor listesi
                                ...List.generate(
                                  lastData.length,
                                  (index) => ListTile(
                                    leading: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text((index + 1).toString()),
                                      ],
                                    ),
                                    title: Text(lastData[index].name),
                                    trailing:
                                        Text('Puan: ${lastData[index].point}'),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text('Veri Bulunamadi'),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            Text(
                              'Tarafını Seç',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Hero(
                                  tag: 'unityButton',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const GameUnity()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.0),
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
                                Hero(
                                  tag: 'flutterButton',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const GameFlutter()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.0),
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
