import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsBloc extends Cubit<List<HeaderTopics>> {
  LessonsBloc() : super([]);

  refresh() async {
    List<HeaderTopics> list = [];
    final collection =
        await FirebaseFirestore.instance.collection('lessons').get();
    await Future.forEach(collection.docs, (doc) async {
      final data = doc.data();
      list.add(HeaderTopics.fromMap(data));
    });
    emit(list);
  }
}
