import 'package:app_jam_uygulama/models/lesson.dart';
import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  int lessonIndex1 = 0;
  int lessonIndex2 = 0;
  int lessonIndex3 = 0;
  String? videoId = YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=dQw4w9WgXcQ'); // ACABA BU NEYMIS?

  @override
  void initState() {
    super.initState();
    final appInfo = context.read<AppInfoBloc>().state;
    lessonIndex1 = appInfo.lessonIndex1;
    lessonIndex2 = appInfo.lessonIndex2;
    lessonIndex3 = appInfo.lessonIndex3;
    videoId = YoutubePlayer.convertUrlToId(HeaderTopics.lessons[lessonIndex1]
        .subtopics[lessonIndex2].lessons[lessonIndex3].url);
    debugPrint('videoId: ${videoId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Html(
          key: const ValueKey<int>(153324572342),
          data: """
          <iframe width="${MediaQuery.of(context).size.width}" height="${MediaQuery.of(context).size.width * 0.54}" src="https://www.youtube.com/embed/$videoId" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          """,
        ),
        toolbarHeight: MediaQuery.of(context).size.width * 0.54,
      ),
      body: ListView(children: [
        ...List.generate(HeaderTopics.lessons.length, (index1) {
          final header = HeaderTopics.lessons[index1];
          return ExpansionTile(
            initiallyExpanded: lessonIndex1 == index1,
            textColor: Colors.blue,
            childrenPadding: const EdgeInsets.only(left: 20),
            leading: Text(header.duration),
            title: Text(header.title),
            subtitle: Text(
              header.description,
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            children: [
              ...List.generate(HeaderTopics.lessons[index1].subtopics.length,
                  (index2) {
                final lessonTopic =
                    HeaderTopics.lessons[index1].subtopics[index2];
                return ExpansionTile(
                  initiallyExpanded: lessonIndex2 == index2,
                  textColor: Colors.orange,
                  childrenPadding: const EdgeInsets.only(left: 20.0),
                  leading: Text(lessonTopic.duration),
                  title: Text(lessonTopic.title),
                  subtitle: Text(
                    lessonTopic.subtitle,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: List.generate(lessonTopic.lessons.length, (index3) {
                    final lesson = lessonTopic.lessons[index3];
                    return ListTile(
                      textColor: lessonIndex3 == index3 &&
                              lessonIndex2 == index2 &&
                              lessonIndex1 == index1
                          ? Colors.green
                          : null,
                      leading: Text(lesson.duration),
                      title: Text(lesson.title),
                      subtitle: Text(
                        lesson.subtitle,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () async => setState(() {
                        lessonIndex1 = index1;
                        lessonIndex2 = index2;
                        lessonIndex3 = index3;
                        context.read<AppInfoBloc>()
                          ..setIndex(1, index1)
                          ..setIndex(2, index2)
                          ..setIndex(3, index3);

                        videoId = YoutubePlayer.convertUrlToId(HeaderTopics
                            .lessons[lessonIndex1]
                            .subtopics[lessonIndex2]
                            .lessons[lessonIndex3]
                            .url);
                      }),
                    );
                  }),
                );
              })
            ],
          );
        }),
        const SizedBox(
          height: 90,
        )
      ]),
    );
  }
}

class LessonDetails extends StatelessWidget {
  final int lessonIndex;
  final int subtopicIndex;

  const LessonDetails(
      {super.key, required this.lessonIndex, required this.subtopicIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(HeaderTopics.lessons[lessonIndex].title),
          subtitle: const Text(''),
        ),
      ),
      body: const Center(
        child: Text('Lesson Details'),
      ),
    );
  }
}
