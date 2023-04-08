import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final userImageUrl = FirebaseAuth.instance.currentUser!.photoURL;
  @override
  Widget build(BuildContext context) {
    final userName = context.read<AppInfoBloc>().state.userName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            child: CircleAvatar(
              radius: 100,
              backgroundImage:
                  const AssetImage('assets/images/blankperson.jpg'),
              foregroundImage:
                  userImageUrl != null ? NetworkImage(userImageUrl!) : null,
            ),
          ),
          SizedBox(height: 16),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            user.email!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Profil Resmini Değiştir'),
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Hesap Ayarları'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Gizlilik ve Güvenlik'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Geribildirim Gönder'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
