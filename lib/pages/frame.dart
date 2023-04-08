import 'package:app_jam_uygulama/components/home_page_drawer.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/home_page.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/info_page.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/lessons_page.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/note_sharing/note_sharing_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int currentIndex = 2;

  final pages = <Widget>[
    const InfoPage(
      key: ValueKey<int>(867127),
    ),
    const NoteSharingPage(
      key: ValueKey<int>(2347562435),
    ),
    const HomePage(
      key: ValueKey<int>(742457),
    ),
    const LessonsPage(
      key: ValueKey<int>(2357457913),
    ),
    const HomePage(
      key: ValueKey<int>(5793686),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(title: const Text('Oyun ve Uygulama Akademisi')),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).appBarTheme.backgroundColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                onItemTapped(0);
              },
            ),
            IconButton(
              icon: Stack(
                children: const [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.share,
                      size: 15,
                    ),
                  ),
                  Icon(MdiIcons.table)
                ],
              ),
              onPressed: () {
                onItemTapped(1);
              },
            ),
            SizedBox(
              width: 60.0,
              height: 60.0,
              child: Stack(
                children: [
                  const Center(
                    child: Image(
                      width: 40,
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/oua_logo.png'),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          onItemTapped(2);
                        },
                      ),
                    ),
                  )
                ],
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
      body: AnimatedSwitcher(
        key: ValueKey<int>(5477862),
        duration: const Duration(milliseconds: 500),
        child: pages[currentIndex],
      ),
    );
  }
}
