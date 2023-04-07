import 'package:flutter/material.dart';

enum NotificationTimes {
  doNotRemind,
  fiveMinutesAgo,
  tenMinutesAgo,
  fifteenMinutesAgo,
  thirtyMinutesAgo,
  oneHourAgo,
  oneDayAgo
}

class Notification {
  final String title;
  final int duration;
  final NotificationTimes type;
  const Notification(
      {required this.title, required this.duration, required this.type});
}

class NotificationHelper {
  final NotificationTimes time;
  NotificationHelper(this.time);
  static Map<NotificationTimes, Notification> notifications(
      {BuildContext? context}) {
    return {
      NotificationTimes.doNotRemind: Notification(
          title: context != null ? 'Hatırlatma' : '',
          duration: 0,
          type: NotificationTimes.doNotRemind),
      NotificationTimes.fiveMinutesAgo: const Notification(
          title: '5 dakika sonra',
          duration: 5,
          type: NotificationTimes.fiveMinutesAgo),
      NotificationTimes.tenMinutesAgo: const Notification(
          title: '10 dakika sonra',
          duration: 10,
          type: NotificationTimes.tenMinutesAgo),
      NotificationTimes.fifteenMinutesAgo: const Notification(
          title: '15 dakika sonra',
          duration: 15,
          type: NotificationTimes.fifteenMinutesAgo),
      NotificationTimes.thirtyMinutesAgo: const Notification(
          title: '30 dakika sonra',
          duration: 30,
          type: NotificationTimes.thirtyMinutesAgo),
      NotificationTimes.oneHourAgo: const Notification(
          title: '1 saat sonra',
          duration: 60,
          type: NotificationTimes.oneHourAgo),
      NotificationTimes.oneDayAgo: const Notification(
          title: '1 gün sonra',
          duration: 1440,
          type: NotificationTimes.oneDayAgo),
    };
  }

  String title(context) => notifications(context: context)[time]!.title;
  int duration() => notifications()[time]!.duration;
}
