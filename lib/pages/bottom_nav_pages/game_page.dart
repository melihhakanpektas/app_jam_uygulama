import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: Html(
        data: """
          <iframe width="${MediaQuery.of(context).size.width}" height="${MediaQuery.of(context).size.width * 0.54}" src="https://www.youtube.com/embed/bF1cRb-bwLY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          """,
      ),
    );
  }
}
