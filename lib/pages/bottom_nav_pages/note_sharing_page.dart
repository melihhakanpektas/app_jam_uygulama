import 'dart:math';

import 'package:app_jam_uygulama/components/common_alert_dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteSharingPage extends StatefulWidget {
  const NoteSharingPage({super.key});

  @override
  State<NoteSharingPage> createState() => _NoteSharingPageState();
}

class _NoteSharingPageState extends State<NoteSharingPage> {
  final colorList = [Colors.red, Colors.blue, Colors.green, Colors.orange];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('notes').snapshots(),
              builder: (context, snapshot) => !snapshot.hasData
                  ? Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Image.asset('assets/images/oua_logo.png')),
                        const SizedBox(
                          height: 16,
                        ),
                        const CircularProgressIndicator(),
                      ],
                    ))
                  : snapshot.data == null || snapshot.data!.docs.isEmpty
                      ? const Center(child: Text('Burada hiç not yok'))
                      : ListView(
                          padding: const EdgeInsets.all(6),
                          children: [
                            SizedBox(
                                width: AppBar().preferredSize.width,
                                height: AppBar().preferredSize.height + 25),
                            ...List.generate(snapshot.data!.docs.length,
                                (index) {
                              final docs = snapshot.data!.docs;
                              docs.sort((a, b) => (b.data()['date']
                                      as Timestamp)
                                  .compareTo((a.data()['date'] as Timestamp)));
                              return Card(
                                  elevation: 5,
                                  color: colorList[Random().nextInt(3)],
                                  child: ListTile(
                                    title: Text(
                                      docs[index].data()['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          docs[index].data()['subtitle'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              DateFormat('dd/MM/yyyy HH:mm')
                                                  .format((docs[index]
                                                              .data()['date']
                                                          as Timestamp)
                                                      .toDate()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            Text(
                                              docs[index].data()['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                            const SizedBox(
                              height: 90,
                            )
                          ],
                        )),
          Positioned(
            right: 15,
            bottom: 120,
            child: Opacity(
              opacity: 0.8,
              child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => CommonAlertDialogs.shareNewNote(context)),
            ),
          ),
        ],
      ),
    );
  }
}
