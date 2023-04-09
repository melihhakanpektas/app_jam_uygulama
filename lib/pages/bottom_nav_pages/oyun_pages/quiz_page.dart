import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final int index1;
  final int index2;
  const QuizPage(this.index1, this.index2, {super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late LessonTopics topic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final topic = HeaderTopics.lessons[widget.index1].subtopics[widget.index2];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
