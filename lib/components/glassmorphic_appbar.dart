import 'dart:ui';

import 'package:flutter/material.dart';

class GlassSliverAppBar extends StatelessWidget {
  final Widget? title;

  const GlassSliverAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: theme.brightness,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: title,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1616747037595-5a5a104cda0e',
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: theme.scaffoldBackgroundColor.withOpacity(0.2),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.scaffoldBackgroundColor.withOpacity(0.5),
                        theme.scaffoldBackgroundColor.withOpacity(0.3),
                        theme.scaffoldBackgroundColor.withOpacity(0.2),
                        Colors.transparent,
                      ],
                      stops: const [0, 0.3, 0.7, 1],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Item $index'),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
