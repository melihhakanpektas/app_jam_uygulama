import 'package:app_jam_uygulama/pages/wrapper.dart';
import 'package:app_jam_uygulama/providers/lessons_bloc.dart';
import 'package:app_jam_uygulama/services/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'providers/app_info_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LessonsBloc()),
        BlocProvider(
          create: (context) => AppInfoBloc(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          SfGlobalLocalizations.delegate
        ],
        locale: const Locale('tr', 'TR'),
        supportedLocales: const [
          Locale('tr', 'TR'),
          Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Teacher Calendar',
        theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Colors.white,
          //OTHER
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white)),
          textTheme: GoogleFonts.montserratTextTheme(
              ThemeData(brightness: Brightness.light).textTheme),
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: GoogleFonts.montserratTextTheme(
                ThemeData(brightness: Brightness.dark).textTheme),
            colorSchemeSeed: Colors.white,
            //OTHER
            appBarTheme: const AppBarTheme(
                centerTitle: false,
                backgroundColor: Color.fromARGB(255, 41, 45, 46)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white))),
        home: const MyHomePage(title: 'Teacher Calendar'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}
