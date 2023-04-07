import 'package:app_jam_uygulama/notification/notification_helper.dart';
import 'package:flutter/material.dart';

///Her [Event] bir [CompressedEvent] parcasidir. Bu nedenle [Event] uzerinde
///yapilan degisikliklerin [CompressedEvent] sinifinda da yansitilmasi
///gerekir. CRUD fonksiyonlari hazirlarken dikkatli ol.
/// It creates a class called Event.
class Event {
  final String id;
  final String title;
  final List<String> studentIdList;
  final String teacherEmail;
  final List<String> studentEmailList;
  final DateTime fromDate;
  final DateTime toDate;
  final int lessonFee;
  final NotificationTimes notificationTime;
  final bool isEveryWeek;
  final EventStatus? status;
  final String url;
  final int index;
  Event(
      {required this.id,
      required this.title,
      required this.studentIdList,
      required this.teacherEmail,
      required this.studentEmailList,
      required this.fromDate,
      required this.toDate,
      required this.lessonFee,
      required this.notificationTime,
      required this.isEveryWeek,
      this.status,
      required this.url,
      required this.index});

  String get payload => '$id-$index';

  @override
  String toString() {
    return '$id,$title,$studentIdList,$teacherEmail,$studentEmailList,$fromDate,$toDate,$lessonFee,$notificationTime,$isEveryWeek,$status,$url';
  }

  bool get isPast => fromDate.isBefore(DateTime.now());

  Color get color => status == null
      ? const Color(0xFFFF9800)
      : status == EventStatus.done
          ? Colors.lightGreen[800]!
          : const Color(0xFFFF5252);

  Event copyWith({
    String? id,
    String? title,
    List<String>? studentIdList,
    String? teacherEmail,
    List<String>? studentEmailList,
    DateTime? fromDate,
    DateTime? toDate,
    int? lessonFee,
    NotificationTimes? notificationTime,
    bool? isEveryWeek,
    EventStatus? status,
    String? url,
    int? index,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      studentIdList: studentIdList ?? this.studentIdList,
      teacherEmail: teacherEmail ?? this.teacherEmail,
      studentEmailList: studentEmailList ?? this.studentEmailList,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      lessonFee: lessonFee ?? this.lessonFee,
      notificationTime: notificationTime ?? this.notificationTime,
      isEveryWeek: isEveryWeek ?? this.isEveryWeek,
      status: status ?? this.status,
      url: url ?? this.url,
      index: index ?? this.index,
    );
  }

  bool isEqual(Event other) {
    if (id == other.id &&
        title == other.title &&
        studentIdList == other.studentIdList &&
        teacherEmail == other.teacherEmail &&
        studentEmailList == other.studentEmailList &&
        fromDate == other.fromDate &&
        toDate == other.toDate &&
        lessonFee == other.lessonFee &&
        notificationTime == other.notificationTime &&
        isEveryWeek == other.isEveryWeek &&
        status == other.status &&
        url == other.url &&
        index == other.index) {
      return true;
    } else {
      return false;
    }
  }
}

enum EventStatus { ignored, canceled, done }
