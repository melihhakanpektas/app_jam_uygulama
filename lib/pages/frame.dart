import 'package:app_jam_uygulama/components/home_page_drawer.dart';
import 'package:app_jam_uygulama/pages/bottom_nav_pages/home_page.dart';
import 'package:flutter/material.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int currentIndex = 0;

  final pages = <Widget>[
    const HomePage(
      key: ValueKey<int>(2356423457),
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
        duration: const Duration(seconds: 1),
        child: pages[currentIndex],
      ),
    );
  }
}
