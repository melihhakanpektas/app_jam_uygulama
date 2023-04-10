import 'package:flutter/material.dart';

class GameBackground extends StatefulWidget {
  const GameBackground({super.key});

  @override
  State<GameBackground> createState() => _GameBackgroundState();
}

class _GameBackgroundState extends State<GameBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //ARKAPLAN
        FractionalTranslation(
          translation: Offset(-_animation.value, 0.0),
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/infinity_background.jpg'),
                fit: BoxFit.fill,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
        ),
        FractionalTranslation(
          translation: Offset(-_animation.value + 1, 0),
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/infinity_background.jpg'),
                fit: BoxFit.fill,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
