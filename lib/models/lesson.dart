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
        HeaderTopics(
            title: 'Unity ile Oyun Geliştirme',
            description:
                'Unity kullanarak mobil ve PC platformları için oyun geliştirmeyi öğrenin.',
            duration: '1092dk',
            color: Colors.blue,
            subtopics: [
              LessonTopics(
                  title: 'Unity ile Oyun Geliştirmeye Giriş',
                  subtitle: "Giriş ve Kurulumlar",
                  duration: '47dk',
                  lessons: [
                    Lesson(
                        title: 'Giriş',
                        subtitle: '',
                        url: 'https://youtu.be/9da6B1qansk',
                        duration: '1dk'),
                    Lesson(
                        title: 'Modül Tanıtımı',
                        subtitle: '',
                        url: 'https://youtu.be/amVO5FBjsNo',
                        duration: '1dk'),
                    Lesson(
                        title: 'Unity Kurulumu',
                        subtitle:
                            "Bu derste Unity Hub kurulumunu ve unity lisansları arasındaki farkları öğreneceksiniz. ",
                        url: 'https://youtu.be/EqsFMaelmSI',
                        duration: '11dk'),
                    Lesson(
                        title: 'Unity Hub İncelemesi',
                        subtitle:
                            "Bu derste Unity hub içerisindeki sekmeleri,unity kurulumu ve unity ile hangi platformlara çıktı verebileceğinizi göreceksiniz.",
                        url: 'https://youtu.be/TrWBFejNkWM',
                        duration: '10dk'),
                    Lesson(
                        title: 'Visual Studio Kurulumu',
                        subtitle:
                            "Bu derste Visual Studio kurulumunu ve oyun geliştirmek için indirmeniz gereken yazılım paketini öğreneceksiniz.",
                        url: 'https://youtu.be/6akysRNmqQ8',
                        duration: '7dk'),
                    Lesson(
                        title: 'Unity Kullanım Alanları',
                        subtitle:
                            "Bu derste unity'nin hangi sektörlerde kullanıldığını göreceksiniz.",
                        url: 'https://youtu.be/cirvFICT-bM',
                        duration: '6dk'),
                    Lesson(
                        title: 'JetBrains',
                        subtitle:
                            "Bu derste JetBrains'den ücretsiz öğrenci hesabı açmayı öğreneceksiniz.",
                        url: 'https://youtu.be/efT1i6d1YvE',
                        duration: '3dk'),
                  ]),
              LessonTopics(
                  title: 'Programlamaya Giriş',
                  subtitle:
                      'Bu modülümüzde, Unity oyun motorunun desteklediği ana dil olan C# dilini öğrenmeye başlayacağız. C# programlama dili nedir, kimindir, nerelerde kullanılabilir, temel olarak yazım şekli nasıldır gibi konulardan bahsedip basit bir Hello World uygulaması ile kod yazmaya giriş yapacağız. Konsola birtakım çıktılar verip alabileceğimiz temel hatalar üzerinde konuşacağız.',
                  duration: '44dk',
                  lessons: [
                    Lesson(
                        title: 'Modül Tanıtımı',
                        subtitle: "",
                        url: 'https://youtu.be/BkQAhnQQc74',
                        duration: '1dk'),
                    Lesson(
                        title: 'C# Giriş: Programlamaya Giriş',
                        subtitle:
                            "Bu derste unity'nin hangi yazılım dili ile programlanabileceğini göreceksiniz",
                        url: 'https://youtu.be/SOFqSEWKhJM',
                        duration: '4dk'),
                    Lesson(
                        title: 'Hello World',
                        subtitle:
                            "Bu derste ilk konsol uygulamamızı yapacağız. Ekrana Hello World yazdıracağız.",
                        url: 'https://youtu.be/ky1swdNyCeI',
                        duration: '10dk'),
                    Lesson(
                        title: 'Yazım: Hatalara Giriş',
                        subtitle:
                            'Bu derste c# syntax yapısı içinde doğru ve yanlış kullanımdan birkaç örnek göreceksiniz.',
                        url: 'https://youtu.be/xG4FPstoWls',
                        duration: '7dk'),
                    Lesson(
                        title:
                            'Execution Order : Programlama dili nasıl çalışır ?',
                        subtitle:
                            'Bu derste bilgisayarların yazılan kodu nasıl anladığına dair bilgi sahibi olacaksınız.',
                        url: 'https://youtu.be/ZVqwHnO9yUI',
                        duration: '7dk'),
                    Lesson(
                        title: 'Egzersiz: Console\'da Yazı Yazma',
                        subtitle: 'Bu derste kod çalışması yapacağız.',
                        url: 'https://youtu.be/4XADK8WhdiY',
                        duration: '2dk'),
                    Lesson(
                        title: 'Egzersiz: Farklı Çözüm',
                        subtitle:
                            'Bu derste bir önceki dersteki örneğin farklı bir çözümünü göreceksiniz.',
                        url: 'https://youtu.be/RXwwKYHQZAA',
                        duration: '2dk'),
                  ])
            ]),
        HeaderTopics(
            title: 'Oyun Sanatı',
            description:
                '2D ve 3D tasarım için en popüler uygulamaları kullanarak oyun sanatını öğrenin',
            duration: '2072dk',
            color: Colors.blue,
            subtopics: [
              LessonTopics(
                  title: 'Temel Sanat',
                  subtitle:
                      "Eğitimimize Temel Sanat modülümüzle başlangıç yapıp, oyun için sanatın ne demek olduğunu, sanat çeşitlerini, konsept ve obje tasarımı gibi teorik konuları işleyeceğiz.",
                  duration: '101dk',
                  lessons: [
                    Lesson(
                        title: 'Ana Giriş',
                        subtitle: '',
                        url: 'https://youtu.be/OXRSUpZnRzo',
                        duration: '1dk'),
                    Lesson(
                        title: 'Modül Girişi',
                        subtitle: '',
                        url: 'https://youtu.be/2PI_Tc05jhM',
                        duration: '1dk'),
                    Lesson(
                        title: 'Oyunda ' 'sanat' ' nedir? ',
                        subtitle:
                            "Bu dersimizde oyunda sanat nedir ve tarihsel gelişimini işleyeceğiz. ",
                        url: 'https://youtu.be/oWCZhJQhEBw',
                        duration: '5dk'),
                    Lesson(
                        title: 'Oyunlardaki '
                            'sanat tarzları'
                            ' nelerdir ve neye göre seçilir?',
                        subtitle:
                            "İyi günler bu dersimiz de oyunlardaki sanat tarzları nelerdir ve neye göre seçilir? Bundan bahsedeceğiz. Ayrıca dijital sanat tarzları nedir bunları inceleyeceğiz.",
                        url: 'https://youtu.be/UTEG1Ctiqoc',
                        duration: '10dk'),
                    Lesson(
                        title: 'Oyunlardaki hiyerarşik yapı düzeni',
                        subtitle:
                            "Bu dersimizde oyun içi iki boyutlu materyalleri tanıyacağız. Oyun tarzı, renkler, objeler, karakterler, teknik tasarımlar, mekan ve oyuncu yapı düzenlerinden bahsedeceğiz.",
                        url: 'https://youtu.be/ibTL_SfrtVM',
                        duration: '9dk'),
                    Lesson(
                        title: 'Konsept Tasarımı',
                        subtitle:
                            "Bu dersimizde konsept tasarımı ve üretim öncesi konsept tasarımlarının öneminden bahsedeceğiz.",
                        url: 'https://youtu.be/GwVTfJ_Ac_s',
                        duration: '5dk'),
                    Lesson(
                        title: 'Obje Tasarımı',
                        subtitle:
                            "Bu dersimizde obje tasarımlarını inceleyeceğiz. Cep telefonları oyunları yada tamamen bilgisayar oyunlarında olan objelerimizin tasarımlarından bahsedeceğiz.",
                        url: 'https://youtu.be/ur54UZkzyQI',
                        duration: '8dk'),
                    Lesson(
                        title: 'Karakter Tasarımı',
                        subtitle:
                            "Bu dersimizde karakterleri, ana karakterleri ve yan karakterleri işleyeceğiz. Ana karakterimizin oyunumuzla ve iki boyutlu çizimlerle ne kadar önemli olduğundan bahsedeceğiz.",
                        url: 'https://youtu.be/8b32K8Ca7gE',
                        duration: '9dk'),
                    Lesson(
                        title: 'Çevre/Mekan Tasarımı',
                        subtitle:
                            " Bu dersimiz de tamamen iç ve dış mekanların önemini ve nasıl yapıldığını inceleyeceğiz.  ",
                        url: 'https://youtu.be/swXxrgmo-L8',
                        duration: '5dk'),
                    Lesson(
                        title: 'Mekanik Tasarımlar',
                        subtitle:
                            " Bu dersimiz de tamamen iç ve dış olarak mekanik tasarımlarından bahsedeceğiz. ",
                        url: 'https://youtu.be/cc9CXIqI2AQ',
                        duration: '5dk'),
                    Lesson(
                        title: 'Kullanıcı Arayüzü',
                        subtitle:
                            "' Bu dersimiz de ara yüzleri inceledik ve bazı ikonlardan bahsedeceğiz. ",
                        url: 'https://youtu.be/Pa3e3aF-uDw',
                        duration: '9dk'),
                    Lesson(
                        title: 'Referans Kullanımı',
                        subtitle:
                            " Bu dersimiz de tamamen referans ve referansın ne kadar önemli olduğunu işleyeceğiz. ",
                        url: 'https://youtu.be/Yxqa3W2dRv8',
                        duration: '9dk'),

                        Lesson(
                        title: 'Eskiz Yapımı',
                        subtitle:
                            " Bu dersimizde eskiz yapımı ve tasarım öncesi eskizlerin öneminden bahsedeceğiz. ",
                        url: 'https://youtu.be/TukE7Jd_7SU',
                        duration: '4dk'),
                  ]),







              LessonTopics(
                  title: '2D Sanat ve Daha Fazlası',
                  subtitle:
                      'Temel Sanat konusundaki teorik bilgilerimizi derinleştireceğimiz bu modülümüzde anatomi, renkler ve ışıklar, perspektif, mimikler gibi oldukça önemli konuları işlerken oyun endüstrisindeki kullanımlar hakkında bilgi sahibi olacağız.',
                  duration: '98dk',
                  lessons: [
                    Lesson(
                        title: 'Modül Girişi',
                        subtitle: "",
                        url: '',
                        duration: '1dk'),
                    Lesson(
                        title: '2D Sanat Nedir?',
                        subtitle:
                            "",
                        url: '',
                        duration: '4dk'),
                    Lesson(
                        title: 'Gerçekçi Sanat',
                        subtitle:
                            "",
                        url: '',
                        duration: '5dk'),
                    Lesson(
                        title: 'Yarı Gerçekçi Sanat',
                        subtitle:
                            '',
                        url: '',
                        duration: '4dk'),
                    Lesson(
                        title: 'Stilize Edilmiş Sanat ',
                        subtitle:
                            '',
                        url: '',
                        duration: '4dk'),
                    Lesson(
                        title: 'Çizim Tabletleri',
                        subtitle: '',
                        url: '',
                        duration: '9dk'),
                    Lesson(
                        title: 'Çizim Programları',
                        subtitle:
                            '',
                        url: '',
                        duration: '5dk'),
                  ])
            ]),
      ];
}
