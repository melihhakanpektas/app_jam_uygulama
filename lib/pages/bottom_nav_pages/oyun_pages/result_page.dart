import 'dart:math';
import 'dart:ui';

import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  final int totalQuestionCount;
  final int trueCount;
  final int timeTaken;
  final int index1;
  final int index2;
  const ResultPage(this.totalQuestionCount, this.trueCount, this.timeTaken,
      this.index1, this.index2,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> randomNumbers = [
      for (var i = 0; i < 11; i++) Random().nextInt(4)
    ];

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
    double dogruYuzdesi = (trueCount / totalQuestionCount) * 100;
    double zamanCezasi = (timeTaken / (totalQuestionCount * 2)) * 1;
    final puan = (dogruYuzdesi - zamanCezasi) * 10;
    FirebaseFirestore.instance.collection('scorboard').doc().set({
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'name': context.read<AppInfoBloc>().state.userName,
      'point': puan.toInt(),
      'index1': index1,
      'index2': index2,
    });
    return Material(
      child: Stack(
        children: [
          const GameBackground(),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
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
                                    var data =
                                        doc.data() as Map<String, dynamic>;
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
                                            .firstWhere(
                                                (element) => element.uid == a)
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
                                          trailing: Text(
                                              'Puan: ${lastData[index].point}'),
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
                        const SizedBox(height: 10),
                        Text(
                          'Puan: ${puan.toInt()}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Süre: $timeTaken',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Toplam Dogru: $trueCount/$totalQuestionCount',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Restart Quiz'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
