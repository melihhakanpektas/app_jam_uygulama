import 'package:app_jam_uygulama/pages/drawer_pages/profile.dart';
import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userImageUrl = FirebaseAuth.instance.currentUser?.photoURL;
    final name = context.watch<AppInfoBloc>().state.userName;
    print(userImageUrl);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      const AssetImage('assets/images/blankperson.jpg'),
                  foregroundImage:
                      userImageUrl != null ? NetworkImage(userImageUrl) : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(name)
              ],
            ),
          ),

          //asdfasdgasdgasdgsdg
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Dersler'),
            onTap: () {
              // Burada dersler sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.games),
            title: Text('Oyun'),
            onTap: () {
              // Burada oyun sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text('Not Paylaşımı'),
            onTap: () {
              // Burada not paylaşımı sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Proje Paylaşımı'),
            onTap: () {
              // Burada proje paylaşımı sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              // Burada ayarlar sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Hakkında'),
            onTap: () {
              // Burada hakkında sayfasına yönlendirebilirsiniz
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              // Burada çıkış yapıldığına dair kullanıcıya bir mesaj gösterebilirsiniz
            },
          ),
        ],
      ),
    );
  }
}
