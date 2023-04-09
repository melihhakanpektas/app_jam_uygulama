import 'dart:ui';

import 'package:app_jam_uygulama/components/common_alert_dialogs.dart';
import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.watch<AppInfoBloc>().state.userName;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Drawer(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<AppInfoBloc, AppInfo>(
                      builder: (context, state) => CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            const AssetImage('assets/images/blankperson.jpg'),
                        foregroundImage:
                            state.url != null ? NetworkImage(state.url!) : null,
                      ),
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
                leading: const Icon(Icons.person),
                title: const Text(
                  'Profil',
                ),
                onTap: () {
                  CommonAlertDialogs.profile(context);
                },
              ),
              ListTile(
                leading: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: Stack(
                    children: const [
                      Center(
                        child: Image(
                          width: 25,
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/oua_logo.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                title: const Text('Ana Sayfa'),
                onTap: () {
                  context.read<AppInfoBloc>().setPageIndex(2);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('Dersler'),
                onTap: () {
                  context.read<AppInfoBloc>().setPageIndex(3);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.games),
                title: const Text('Oyun'),
                onTap: () {
                  context.read<AppInfoBloc>().setPageIndex(4);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Stack(
                  children: const [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.share,
                        size: 15,
                      ),
                    ),
                    Icon(MdiIcons.table)
                  ],
                ),
                title: const Text('Not Paylaşımı'),
                onTap: () {
                  context.read<AppInfoBloc>().setPageIndex(1);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ayarlar'),
                onTap: () {
                  CommonAlertDialogs.settings(context);
                  // Burada ayarlar sayfasına yönlendirebilirsiniz
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Akademi Hakkında'),
                onTap: () {
                  context.read<AppInfoBloc>().setPageIndex(0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Çıkış'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  // Burada çıkış yapıldığına dair kullanıcıya bir mesaj gösterebilirsiniz
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
