import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String subtitle;
  final String url;
  final String duration;

  Lesson(
      {required this.title,
      required this.subtitle,
      required this.url,
      required this.duration});
}

class LessonTopics {
  final String title;
  final String subtitle;
  final String duration;
  final List<Lesson> lessons;

  LessonTopics(
      {required this.title,
      required this.subtitle,
      required this.duration,
      required this.lessons});
}

class HeaderTopics {
  final String title;
  final String description;
  final String duration;
  final Color color;
  final List<LessonTopics> subtopics;

  const HeaderTopics(
      {required this.title,
      required this.description,
      required this.duration,
      required this.color,
      required this.subtopics});

  static List<HeaderTopics> get lessons => [
        HeaderTopics(
            title: 'Flutter ile Uygulama Geliştirme Eğitimleri',
            description:
                'Flutter ile Android ve iOS uygulamaları geliştirmeyi öğrenin.',
            duration: '1358dk',
            color: Colors.blue,
            subtopics: [
              LessonTopics(
                  title: 'Flutter Kurulumu',
                  subtitle:
                      "Bu modülde Flutter ile uygulama geliştirmek için gereken programları bilgisayarınıza kurmayı öğreneceksiniz. Bu programları tanıyacak, gereken ayarları yapmayı öğrenecek ve örnek proje yaratmayı göreceksiniz.",
                  duration: '48dk',
                  lessons: [
                    Lesson(
                        title: 'Flutter Kurulumu: Flutter SDK',
                        subtitle:
                            'Bu derste SDK indirmeyi, kurmayı ve içeriğini tanımayı öğreneceksiniz.',
                        url: 'https://www.youtube.com/watch?v=RKwJwCaaFec',
                        duration: '12dk'),
                    Lesson(
                        title: 'Flutter Kurulumu: PATH Ayarları',
                        subtitle:
                            'Bu derste PATH ayarını yaparak flutter komutunu çalıştırmayı öğreneceksiniz.',
                        url: 'https://www.youtube.com/watch?v=_7f_43nDiSY',
                        duration: '5dk'),
                    Lesson(
                        title: 'Flutter Kurulumu: Android Studio',
                        subtitle:
                            "Bu derste Android Studio kurulumunu göreceksiniz. Android Studio ile Flutter arasındaki bağlantıyı kurarak Flutter ile uygulama geliştirmek için gereken altyapıyı hazırlamış olacaksınız. ",
                        url: 'https://www.youtube.com/watch?v=905L1sv1nq4',
                        duration: '15dk'),
                    Lesson(
                        title: 'Flutter Kurulumu: Örnek Proje Yaratma',
                        subtitle:
                            "Bu derste örnek proje yaratmayı ve çalıştırmayı göreceksiniz.",
                        url: 'https://www.youtube.com/watch?v=xxAwKhI-lsM',
                        duration: '9dk'),
                  ]),
              LessonTopics(
                  title: 'Dart Dilini ve IDE’yi Tanıma',
                  subtitle:
                      'Bu modülde örnek bir Flutter projesi ile Dart diline giriş yapacaksınız. Dart dilinin basit özelliklerini görecek, değişkenleri ve fonksiyonları tanıyacaksınız.',
                  duration: '49dk',
                  lessons: [
                    Lesson(
                        title: 'Flutter: Örnek Proje',
                        subtitle:
                            "Bu derste bir önceki derste yaratmış olduğumuz örnek Flutter uygulamasını inceleyerek Dart diline ve Flutter'a giriş yapacaksınız.",
                        url: 'https://www.youtube.com/watch?v=YOidpKRZf4A',
                        duration: '10dk'),
                    Lesson(
                        title: 'Flutter ve Dart Uygulamaları',
                        subtitle:
                            "Bu derste Flutter ve Dart uygulamalarını geliştirirken yaşanılan süreçleri göreceksiniz. Flutter ve Dart uygulamalarındaki bazı farklılıkları göreceksiniz ve IDE kullanarak yaptığınız değişiklikleri çalışmakta olan uygulamaya aktarmayı öğreneceksiniz.",
                        url: 'https://www.youtube.com/watch?v=B8Sfz0d8ugA',
                        duration: '10dk'),
                    Lesson(
                        title: 'Değişkenler ve Fonksiyonlar',
                        subtitle:
                            "Bu derste Dart dilinde değişkenleri ve fonksiyonları tanıyacaksınız. Farklı türden değişkenlerle fonksiyonların çağrılmasını göreceksiniz.",
                        url: 'https://www.youtube.com/watch?v=7yUGdZppZYk',
                        duration: '11dk'),
                    Lesson(
                        title: 'Fonksiyonlar',
                        subtitle:
                            'Bu derste fonksiyonları daha derinlemesine inceleyeceksiniz ve farklı türden parametlerin kullanımlarını göreceksiniz.',
                        url: 'https://www.youtube.com/watch?v=Qpc2p0DEmj4',
                        duration: '10dk'),
                  ])
            ]),
      ];
}
