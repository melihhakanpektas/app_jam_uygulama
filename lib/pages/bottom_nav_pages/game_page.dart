import 'package:app_jam_uygulama/components/game_background.dart';
import 'package:flutter/material.dart';

import 'oyun_pages/choose_one_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GameBackground(
          key: ValueKey(234234),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'firstPage1',
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text('Oyun ve Uygulama Yarışması',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                      ),
                      const Image(
                          image: AssetImage('assets/images/oua_oyun.png')),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.trending_up,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'En Yüksek Skor: 100',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Hero(
                tag: 'firstPage2',
                child: Material(
                  color: Colors.transparent,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChooseOnePage()));
                      // context.read<AppInfoBloc>().setGamePageIndex(1);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        'Başlat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
