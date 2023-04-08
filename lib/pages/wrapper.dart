import 'dart:async';

import 'package:app_jam_uygulama/pages/frame.dart';
import 'package:app_jam_uygulama/pages/login_page.dart';
import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Stream _checkLogin =
      FirebaseAuth.instance.authStateChanges().asBroadcastStream();

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: _checkLogin,
      builder: (context, connectionSnapshot) {
        if (connectionSnapshot.connectionState == ConnectionState.waiting) {
          return Material(
              key: UniqueKey(),
              child: const Material(
                  child: Center(child: CircularProgressIndicator())));
        } else if (connectionSnapshot.hasData) {
          return FutureBuilder(
              future: context.read<AppInfoBloc>().refresh(),
              builder: (context, userDataSnapshot) {
                return !userDataSnapshot.hasData
                    ? AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: Material(
                            key: UniqueKey(),
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: Image.asset(
                                        'assets/images/oua_logo.png')),
                                const SizedBox(
                                  height: 16,
                                ),
                                const CircularProgressIndicator(),
                              ],
                            ))),
                      )
                    : FutureBuilder(
                        future: Future.delayed(const Duration(seconds: 2))
                            .then((value) => 'done'),
                        builder: (context, snapshot) => AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: !snapshot.hasData
                                ? Material(
                                    key: UniqueKey(),
                                    child: Center(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: Image.asset(
                                                'assets/images/oua_logo.png')),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Hoş Geldin',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          userDataSnapshot.data!.userName,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )))
                                : const Frame(
                                    key: ValueKey<int>(12352466),
                                  )));
              });
        } else if (connectionSnapshot.hasError) {
          return const Center(
            child: Text('Bir seyler ters gitti :('),
          );
        } else {
          return const LoginPage();
        }
      });
}
