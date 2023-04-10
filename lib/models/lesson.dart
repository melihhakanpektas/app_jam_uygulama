// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String subtitle;
  final String url;
  final String duration;

  Lesson({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.duration,
  });

  Lesson copyWith({
    String? title,
    String? subtitle,
    String? url,
    String? duration,
  }) {
    return Lesson(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      url: url ?? this.url,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'url': url,
      'duration': duration,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      url: map['url'] as String,
      duration: map['duration'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) =>
      Lesson.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Lesson(title: $title, subtitle: $subtitle, url: $url, duration: $duration)';
  }

  @override
  bool operator ==(covariant Lesson other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subtitle == subtitle &&
        other.url == url &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        url.hashCode ^
        duration.hashCode;
  }
}

class LessonTopics {
  final String title;
  final String subtitle;
  final String duration;
  final List<Lesson> lessons;
  final List<ModuleQuestions> questions;

  LessonTopics({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.lessons,
    required this.questions,
  });

  LessonTopics copyWith({
    String? title,
    String? subtitle,
    String? duration,
    List<Lesson>? lessons,
    List<ModuleQuestions>? questions,
  }) {
    return LessonTopics(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      duration: duration ?? this.duration,
      lessons: lessons ?? this.lessons,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'duration': duration,
      'lessons': lessons.map((x) => x.toMap()).toList(),
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory LessonTopics.fromMap(Map<String, dynamic> map) {
    return LessonTopics(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      duration: map['duration'] as String,
      lessons: List<Lesson>.from(
        (map['lessons'] as List<dynamic>).map<Lesson>(
          (x) => Lesson.fromMap(x as Map<String, dynamic>),
        ),
      ),
      questions: List<ModuleQuestions>.from(
        (map['questions'] as List<dynamic>).map<ModuleQuestions>(
          (x) => ModuleQuestions.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonTopics.fromJson(String source) =>
      LessonTopics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LessonTopics(title: $title, subtitle: $subtitle, duration: $duration, lessons: $lessons, questions: $questions)';
  }

  @override
  bool operator ==(covariant LessonTopics other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subtitle == subtitle &&
        other.duration == duration &&
        listEquals(other.lessons, lessons) &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        duration.hashCode ^
        lessons.hashCode ^
        questions.hashCode;
  }
}

class HeaderTopics {
  final String title;
  final String description;
  final String duration;
  final Color color;
  final List<LessonTopics> subtopics;

  const HeaderTopics({
    required this.title,
    required this.description,
    required this.duration,
    required this.color,
    required this.subtopics,
  });

  HeaderTopics copyWith({
    String? title,
    String? description,
    String? duration,
    Color? color,
    List<LessonTopics>? subtopics,
  }) {
    return HeaderTopics(
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      color: color ?? this.color,
      subtopics: subtopics ?? this.subtopics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'duration': duration,
      'color': color.value,
      'subtopics': subtopics.map((x) => x.toMap()).toList(),
    };
  }

  factory HeaderTopics.fromMap(Map<String, dynamic> map) {
    return HeaderTopics(
      title: map['title'] as String,
      description: map['description'] as String,
      duration: map['duration'] as String,
      color: Color(map['color'] as int),
      subtopics: List<LessonTopics>.from(
        (map['subtopics'] as List<dynamic>).map<LessonTopics>(
          (x) => LessonTopics.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderTopics.fromJson(String source) =>
      HeaderTopics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HeaderTopics(title: $title, description: $description, duration: $duration, color: $color, subtopics: $subtopics)';
  }

  @override
  bool operator ==(covariant HeaderTopics other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.duration == duration &&
        other.color == color &&
        listEquals(other.subtopics, subtopics);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        duration.hashCode ^
        color.hashCode ^
        subtopics.hashCode;
  }
}

class ModuleQuestions {
  final String question;
  final List<String> answers;
  final int trueIndex;

  ModuleQuestions({
    required this.question,
    required this.answers,
    required this.trueIndex,
  });

  ModuleQuestions copyWith({
    String? question,
    List<String>? answers,
    int? trueIndex,
  }) {
    return ModuleQuestions(
      question: question ?? this.question,
      answers: answers ?? this.answers,
      trueIndex: trueIndex ?? this.trueIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'trueIndex': trueIndex,
    };
  }

  factory ModuleQuestions.fromMap(Map<String, dynamic> map) {
    return ModuleQuestions(
      question: map['question'] as String,
      answers: List<String>.from((map['answers'])),
      trueIndex: map['trueIndex'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleQuestions.fromJson(String source) =>
      ModuleQuestions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModuleQuestions(question: $question, answers: $answers, trueIndex: $trueIndex)';

  @override
  bool operator ==(covariant ModuleQuestions other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.answers, answers) &&
        other.trueIndex == trueIndex;
  }

  @override
  int get hashCode => question.hashCode ^ answers.hashCode ^ trueIndex.hashCode;
}

class ScoreBoard {
  final String uid;
  final String name;
  final int point;
  final int index1;
  final int index2;

  ScoreBoard({
    required this.uid,
    required this.name,
    required this.point,
    required this.index1,
    required this.index2,
  });

  ScoreBoard copyWith({
    String? uid,
    String? name,
    int? point,
    int? index1,
    int? index2,
  }) {
    return ScoreBoard(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      point: point ?? this.point,
      index1: index1 ?? this.index1,
      index2: index2 ?? this.index2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'point': point,
      'index1': index1,
      'index2': index2,
    };
  }

  factory ScoreBoard.fromMap(Map<String, dynamic> map) {
    return ScoreBoard(
      uid: map['uid'] as String,
      name: map['name'] as String,
      point: map['point'] as int,
      index1: map['index1'] as int,
      index2: map['index2'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreBoard.fromJson(String source) =>
      ScoreBoard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScoreBoard(uid: $uid, name: $name, point: $point, index1: $index1, index2: $index2)';
  }

  @override
  bool operator ==(covariant ScoreBoard other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.point == point &&
        other.index1 == index1 &&
        other.index2 == index2;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        point.hashCode ^
        index1.hashCode ^
        index2.hashCode;
  }
}
