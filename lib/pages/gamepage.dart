import 'package:app_jam_uygulama/components/home_page_drawer.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oyun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutterde en sevdigin widget?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                _buildSmallTextBox('Container', 16),
                _buildSmallTextBox('Text', 16),
                _buildSmallTextBox('Column', 16),
                _buildSmallTextBox('Center', 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

// _buildSmallTextBox method

  Widget _buildSmallTextBox(String text, double fontSize) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
