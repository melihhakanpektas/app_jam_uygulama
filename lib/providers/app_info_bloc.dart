// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInfoBloc extends Cubit<AppInfo> {
  AppInfoBloc()
      : super(
          AppInfo(
            url: null,
            userName: 'User Name',
            pageIndex: 2,
            gamePageIndex: 0,
            lessonIndex1: 0,
            lessonIndex2: 0,
            lessonIndex3: 0,
          ),
        );

  Future<AppInfo> refresh() async {
    final name = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
          (value) => value.data()!['name'],
        );
    final sp = await SharedPreferences.getInstance();
    final lessonIndex1 = sp.getInt('lessonIndex1');
    final lessonIndex2 = sp.getInt('lessonIndex2');
    final lessonIndex3 = sp.getInt('lessonIndex3');
    emit(state.copyWith(
      userName: name,
      lessonIndex1: lessonIndex1 ?? 0,
      lessonIndex2: lessonIndex2 ?? 0,
      lessonIndex3: lessonIndex3 ?? 0,
    ));
    return state;
  }

  Future setLessonIndex(int indexNo, int index) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt('lessonIndex$indexNo', index);
    refresh();
  }

  setPageIndex(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  setImageUrl(String url) {
    emit(state.copyWith(url: url));
  }

  setGamePageIndex(int index) {
    emit(state.copyWith(gamePageIndex: index));
  }
}

class AppInfo {
  String? url;
  final String userName;
  final int pageIndex;
  final int gamePageIndex;
  final int lessonIndex1;
  final int lessonIndex2;
  final int lessonIndex3;

  AppInfo({
    this.url,
    required this.userName,
    required this.pageIndex,
    required this.gamePageIndex,
    required this.lessonIndex1,
    required this.lessonIndex2,
    required this.lessonIndex3,
  });

  AppInfo copyWith({
    String? url,
    String? userName,
    int? pageIndex,
    int? gamePageIndex,
    int? lessonIndex1,
    int? lessonIndex2,
    int? lessonIndex3,
  }) {
    return AppInfo(
      url: url ?? this.url,
      userName: userName ?? this.userName,
      pageIndex: pageIndex ?? this.pageIndex,
      gamePageIndex: gamePageIndex ?? this.gamePageIndex,
      lessonIndex1: lessonIndex1 ?? this.lessonIndex1,
      lessonIndex2: lessonIndex2 ?? this.lessonIndex2,
      lessonIndex3: lessonIndex3 ?? this.lessonIndex3,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'userName': userName,
      'pageIndex': pageIndex,
      'gamePageIndex': gamePageIndex,
      'lessonIndex1': lessonIndex1,
      'lessonIndex2': lessonIndex2,
      'lessonIndex3': lessonIndex3,
    };
  }

  factory AppInfo.fromMap(Map<String, dynamic> map) {
    return AppInfo(
      url: map['url'] != null ? map['url'] as String : null,
      userName: map['userName'] as String,
      pageIndex: map['pageIndex'] as int,
      gamePageIndex: map['gamePageIndex'] as int,
      lessonIndex1: map['lessonIndex1'] as int,
      lessonIndex2: map['lessonIndex2'] as int,
      lessonIndex3: map['lessonIndex3'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppInfo.fromJson(String source) =>
      AppInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppInfo(url: $url, userName: $userName, pageIndex: $pageIndex, gamePageIndex: $gamePageIndex, lessonIndex1: $lessonIndex1, lessonIndex2: $lessonIndex2, lessonIndex3: $lessonIndex3)';
  }

  @override
  bool operator ==(covariant AppInfo other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.userName == userName &&
        other.pageIndex == pageIndex &&
        other.gamePageIndex == gamePageIndex &&
        other.lessonIndex1 == lessonIndex1 &&
        other.lessonIndex2 == lessonIndex2 &&
        other.lessonIndex3 == lessonIndex3;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        userName.hashCode ^
        pageIndex.hashCode ^
        gamePageIndex.hashCode ^
        lessonIndex1.hashCode ^
        lessonIndex2.hashCode ^
        lessonIndex3.hashCode;
  }
}
