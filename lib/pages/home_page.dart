import 'package:app_jam_uygulama/components/home_page_drawer.dart';
import 'package:app_jam_uygulama/providers/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final yapilacaklarListesi = [
    'Game & App Jam’e katıl.(ZORUNLU)',
    'Flutter Eğitimlerinin 12-17 arası modüllerini(%80) tamamla. (ZORUNLU)',
    'Google Proje Yönetimi Eğitimlerinin 3.kursunu tamamla.(ZORUNLU)',
    'Yazılımcılar için İngilizce derslerinin ilk 6 modülünü tamamla.(SEÇENLER İÇİN ZORUNLU)',
    'Canlı yayınlara katıl'
  ];
  final yapilanlarCheck = [true, true, false, false, true];

  @override
  void initState() {
    super.initState();
    context.read<AppInfoBloc>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(title: const Text('Oyun ve Uygulama Akademisi')),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                onItemTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                onItemTapped(1);
              },
            ),
            InkWell(
              onTap: () {
                onItemTapped(2);
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                child: const Center(
                  child: Image(
                    width: 40,
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/oua_logo.png'),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.book),
              onPressed: () {
                onItemTapped(3);
              },
            ),
            IconButton(
              icon: const Icon(Icons.games),
              onPressed: () {
                onItemTapped(4);
              },
            ),
          ],
        ),
      ),
      body: ListView(
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
                SfCalendar(
                  view: CalendarView.schedule,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
