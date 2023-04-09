import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final userImageUrl = FirebaseAuth.instance.currentUser!.photoURL;

  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final userName = context.read<AppInfoBloc>().state.userName;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        CircleAvatar(
          radius: 100,
          backgroundImage: const AssetImage('assets/images/blankperson.jpg'),
          foregroundImage:
              userImageUrl != null ? NetworkImage(userImageUrl!) : null,
        ),
        const SizedBox(height: 16),
        Text(
          userName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          user.email!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Profil Resmini Değiştir'),
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Hesap Ayarları'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Gizlilik ve Güvenlik'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text('Geribildirim Gönder'),
          onTap: () {},
        ),
      ],
    );
  }
}
