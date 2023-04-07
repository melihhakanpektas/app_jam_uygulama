// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInfoBloc extends Cubit<AppInfo> {
  AppInfoBloc()
      : super(
          AppInfo(
            userName: 'User Name',
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
    emit(AppInfo(
      userName: name,
    ));
    return state;
  }
}

class AppInfo {
  final String userName;

  AppInfo({
    required this.userName,
  });

  AppInfo copyWith({
    String? userName,
  }) {
    return AppInfo(
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
    };
  }

  factory AppInfo.fromMap(Map<String, dynamic> map) {
    return AppInfo(
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppInfo.fromJson(String source) =>
      AppInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppPreferences(userName: $userName)';

  @override
  bool operator ==(covariant AppInfo other) {
    if (identical(this, other)) return true;

    return other.userName == userName;
  }

  @override
  int get hashCode => userName.hashCode;
}
