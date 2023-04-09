import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Bildirimleri Aç'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Karanlık Modu Aç'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Dil Seçimi'),
            trailing: DropdownButton<String>(
              value: 'TR',
              items: <String>['TR', 'EN']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (_) {},
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Çıkış Yap'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              // Çıkış yapma işlemleri burada yapılabilir
            },
          ),
        ],
      ),
    );
  }
}
