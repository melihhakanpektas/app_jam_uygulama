import 'package:app_jam_uygulama/calendar/event_data_source.dart';
import 'package:app_jam_uygulama/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final yapilacaklarListesi = [
      'Game & App Jam’e katıl.(ZORUNLU)',
      'Flutter Eğitimlerinin 12-17 arası modüllerini(%80) tamamla. (ZORUNLU)',
      'Google Proje Yönetimi Eğitimlerinin 3.kursunu tamamla.(ZORUNLU)',
      'Yazılımcılar için İngilizce derslerinin ilk 6 modülünü tamamla.(SEÇENLER İÇİN ZORUNLU)',
      'Canlı yayınlara katıl'
    ];
    final yapilanlarCheck = [true, true, false, false, true];

    final eventList = [
      Event(
          id: '02345hj234blt23',
          title: 'Game Jam Açılış Buluşması',
          fromDate: DateTime(2023, 04, 07, 21, 00),
          toDate: DateTime(2023, 04, 07, 22, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '367367vbbsyj',
          title: 'Game App Jam Ürün Geliştirme',
          fromDate: DateTime(2023, 04, 08, 09, 00),
          toDate: DateTime(2023, 04, 08, 18, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '678vbsahjkg567',
          title: 'App Jam Soru Cevap Buluşması',
          fromDate: DateTime(2023, 04, 08, 17, 00),
          toDate: DateTime(2023, 04, 08, 18, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: 'fgm7j578m',
          title: 'Game Jam Soru Cevap Buluşması Tolgay Hıçkıran',
          fromDate: DateTime(2023, 04, 08, 17, 00),
          toDate: DateTime(2023, 04, 08, 18, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '5680125yjkmfghu456',
          title: 'Game & App Jam Ürün Geliştirme',
          fromDate: DateTime(2023, 04, 09, 09, 00),
          toDate: DateTime(2023, 04, 09, 18, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '4579345734365ert',
          title: 'Game & App Jam Ürünlerin Teslim Edilmesi',
          fromDate: DateTime(2023, 04, 10, 12, 00),
          toDate: DateTime(2023, 04, 10, 12, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: 'bes5634',
          title: 'OUA ve Tech To Rescue Webinar',
          fromDate: DateTime(2023, 04, 11, 21, 00),
          toDate: DateTime(2023, 04, 11, 22, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '4wer534y345',
          title: 'Yazilimcilar Icin Ingilizce Canli Yayini 5',
          fromDate: DateTime(2023, 04, 12, 21, 00),
          toDate: DateTime(2023, 04, 12, 22, 30),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
      Event(
          id: '346h4we5h3456j',
          title: 'Game & App Jam Sonuclarinin Aciklanmasi',
          fromDate: DateTime(2023, 04, 14, 21, 00),
          toDate: DateTime(2023, 04, 14, 22, 00),
          url: 'https://www.youtube.com/live/BXom3U92yqk?feature=share'),
    ];
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Yumuşak köşeleri sağlar
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Bu Ay Yapılacaklar Listesi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 0,
              ),
              ...List.generate(
                  yapilacaklarListesi.length,
                  (i) => Column(
                        children: [
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            leading: Checkbox(
                              value: yapilanlarCheck[i],
                              onChanged: null,
                            ),
                            title: Text(yapilacaklarListesi[i]),
                          ),
                        ],
                      ))
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Yumuşak köşeleri sağlar
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Takvim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 0,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  SfCalendar(
                    scheduleViewMonthHeaderBuilder: (BuildContext buildContext,
                        ScheduleViewMonthHeaderDetails details) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              '${DateFormat('MMMM', 'tr_TR').format(DateTime(2023, details.date.month))} ${details.date.year}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    dataSource: EventDataSource(eventList),
                    view: CalendarView.schedule,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }
}
