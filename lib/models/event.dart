import 'package:app_jam_uygulama/notification/notification_helper.dart';
import 'package:flutter/material.dart';

///Her [Event] bir [CompressedEvent] parcasidir. Bu nedenle [Event] uzerinde
///yapilan degisikliklerin [CompressedEvent] sinifinda da yansitilmasi
///gerekir. CRUD fonksiyonlari hazirlarken dikkatli ol.
/// It creates a class called Event.
class Event {
  final String id;
  final String title;
  final DateTime fromDate;
  final DateTime toDate;
  final EventStatus? status;
  final String url;
  Event(
      {required this.id,
      required this.title,
      required this.fromDate,
      required this.toDate,
      this.status,
      required this.url});

  String get payload => id;

  bool get isPast => fromDate.isBefore(DateTime.now());

  Color get color => DateTime(fromDate.year, fromDate.month, fromDate.day) ==
          DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)
      ? Colors.orange
      : toDate.isAfter(DateTime.now())
          ? Colors.green
          : Colors.red;

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
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      status: status ?? this.status,
      url: url ?? this.url,
    );
  }

  bool isEqual(Event other) {
    if (id == other.id &&
        title == other.title &&
        fromDate == other.fromDate &&
        toDate == other.toDate &&
        status == other.status &&
        url == other.url) {
      return true;
    } else {
      return false;
    }
  }
}

enum EventStatus { ignored, canceled, done }
