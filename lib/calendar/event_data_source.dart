import 'package:app_jam_uygulama/models/event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource<Event> {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  Event convertAppointmentToObject(Event customData, Appointment appointment) =>
      Event(
          id: customData.id,
          title: customData.title,
          studentIdList: customData.studentIdList,
          studentEmailList: customData.studentEmailList,
          teacherEmail: customData.teacherEmail,
          fromDate: appointment.startTime,
          toDate: appointment.endTime,
          lessonFee: customData.lessonFee,
          notificationTime: customData.notificationTime,
          isEveryWeek: customData.isEveryWeek,
          status: customData.status,
          url: customData.url,
          index: customData.index);

  @override
  Event getId(int index) => getEvent(index);

  @override
  DateTime getStartTime(int index) => getEvent(index).fromDate;

  @override
  DateTime getEndTime(int index) => getEvent(index).toDate;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  Color getColor(int index) => getEvent(index).color;
}
