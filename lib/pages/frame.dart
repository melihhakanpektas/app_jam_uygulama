import 'dart:ui';

import 'package:app_jam_uygulama/components/home_page_drawer.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/game_page.dart';
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
    const GamePage(
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
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex == 2) {
          return true;
        } else {
          onItemTapped(2);
          return false;
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const HomePageDrawer(),
        appBar: AppBar(
          bottomOpacity: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Oyun ve Uygulama Akademisi'),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.info), label: 'Hakkında'),
              BottomNavigationBarItem(
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
                  label: 'Not Paylaş'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Stack(
                      children: const [
                        Center(
                          child: Image(
                            width: 40,
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/oua_logo.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: 'Ana Sayfa'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'Dersler'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.games), label: 'Oyun'),
            ]),
        body: AnimatedSwitcher(
          key: const ValueKey<int>(5477862),
          duration: const Duration(milliseconds: 500),
          child: pages[currentIndex],
        ),
      ),
    );
  }
}
