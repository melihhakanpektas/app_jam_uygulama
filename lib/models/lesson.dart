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
                        url: 'https://youtu.be/LR5oCN9UioU',
                        duration: '1dk'),
                    Lesson(
                        title: '2D Sanat Nedir?',
                        subtitle:
                            "Bu dersimizde iki boyutlu sanat ve dijital sanatı inceleyeceğiz.",
                        url: 'https://youtu.be/Q_RAS7vJOdA',
                        duration: '4dk'),
                    Lesson(
                        title: 'Gerçekçi Sanat',
                        subtitle:
                            "Bu dersimizde dijital sanat tekniklerinden realistik sanatı inceleyeceğiz",
                        url: 'https://youtu.be/GCd89uCPi-c',
                        duration: '5dk'),
                    Lesson(
                        title: 'Yarı Gerçekçi Sanat',
                        subtitle: 'https://youtu.be/oiX5b8fCp2U',
                        url:
                            'Bu dersimizde dijital sanat tekniği olan yarı gerçekçi sanatı inceleyeceğiz.',
                        duration: '4dk'),
                    Lesson(
                        title: 'Stilize Edilmiş Sanat ',
                        subtitle:
                            'Bu dersimizde objelerin ve karakterlerin farklı çizim teknikleriyle stilize edilerek, renklendirilmesiyle oluşan stilize edilmiş sanattan bahsedeceğiz.',
                        url: 'https://youtu.be/_sUnQ8yH4YA',
                        duration: '4dk'),
                    Lesson(
                        title: 'Piksel Sanat',
                        subtitle:
                            'Bu dersimizde görüntülerin piksel düzeyinde düzenlediği yazılım ile oluşturulan dijital bir sanat türü olan Piksel Sanat\'ı inceleyeceğiz.',
                        url: 'https://youtu.be/oM4YRkf26Ko',
                        duration: '4dk'),
                    Lesson(
                        title: 'Çizim Tabletleri',
                        subtitle:
                            'Bu dersimizde tabletleri işleyeceğiz. Hangileri bize uygundur ve özelliklerini nelerdir bunlardan bahsedeceğiz.',
                        url: 'https://youtu.be/qn_4Ei4WOlE',
                        duration: '9dk'),
                    Lesson(
                        title: 'Çizim Programları',
                        subtitle:
                            'Bu dersimizde tabletleri işleyeceğiz. Hangileri bize uygundur ve özelliklerini nelerdir bunlardan bahsedeceğiz.',
                        url: 'https://youtu.be/iOcPZhw0YSw',
                        duration: '5dk'),
                    Lesson(
                        title: 'Dijital Sanatın Kullanıldığı Meslekler',
                        subtitle:
                            'Bu dersimiz de iki boyutlu dijital sanatın kullanıldığı meslekleri inceleyeceğiz. Ve hangi bölüm sizlere göre hangisine yön öğrenmelisiniz bunlardan bahsedeceğiz.',
                        url: 'https://youtu.be/-zbNkSvAi_M',
                        duration: '5dk'),
                    Lesson(
                        title: 'Tasarım Öncesi Hazırlık Aşamaları',
                        subtitle:
                            'Bu dersimizde çizim öncesi planlamalara bakıp tasarım hazırlık aşamalarını inceleyeceğiz.',
                        url: 'https://youtu.be/v1pGKdwyVmA',
                        duration: '4dk'),
                    Lesson(
                        title: 'Perspektif',
                        subtitle:
                            'Bu dersimizde perspektifi işleyip açı ve yönlerin belirlenmesi hakkında bilgi edineceğiz.',
                        url: 'https://youtu.be/16CXb3qA5UA',
                        duration: '5dk'),
                    Lesson(
                        title: 'Mimikler',
                        subtitle:
                            'Bu dersimizde mimikleri işleyeceğiz ve yüz ifadeleri portre çalışmalarına bakacağız.',
                        url: 'https://youtu.be/JGrJNS2055E',
                        duration: '2dk'),
                    Lesson(
                        title: 'Anatomi',
                        subtitle:
                            'Bu dersimizde tamamı ile anatomi ya da bir canlı nasıl yapılır bunu inceleyeceğiz.',
                        url: 'https://youtu.be/eW2DtsEmPV8',
                        duration: '5dk'),
                    Lesson(
                        title: 'Renkler Ve Işıklar',
                        subtitle:
                            'Bu dersimizde ışık, renk ve gölgelendirmeden bahsedeceğiz.',
                        url: 'https://youtu.be/XBHV-uE_1YY',
                        duration: '9dk'),
                    Lesson(
                        title: 'Portfolyo Ve Sunum',
                        subtitle:
                            'Bu dersimizde portfolyo ve sunumdan bahsedeceğiz. Nasıl doğru bir portfolyo yapılır bunlara değineceğiz.',
                        url: 'https://youtu.be/owlFMqzHDBw',
                        duration: '5dk'),
                  ])
            ]),

//////////////////////////////////////////////////////////////////////////////////
        ///
//////////////////////////////////////////////////////////////////////////////////
        ///
//////////////////////////////////////////////////////////////////////////////////

        HeaderTopics(
            title: 'Yazılımcılar İçin İngilizce Eğitimi',
            description:
                'Kariyerini teknoloji sektöründe kurarken faydalanabileceğin, oyun ve uygulama geliştirme alanında uluslararası standart ve trendleri takip edebilmeni kolaylaştıracak İngilizce eğitimlerine katıl.',
            duration: '1693dk',
            color: Colors.blue,
            subtopics: [
              LessonTopics(
                  title: 'Tenses, Question Types, Nouns and Pronouns',
                  subtitle:
                      """Bu modülde grammer, cümle yapıları ve örnekler gibi birçok içerik ile Simple Present Tense, Present Continuous Tense, Past Continuous Tense, Present Perfect Simple Tense, Present Perfect Continuous Tense vs.. gibi gerekli olan temel yapıları öğreneceksiniz. Aynı zamanda \"stative and non-stative verb"\ örnekleri ve kullanım şekillerini; "regular verbs" örnekleri, "irregular verbs" kullanım ve telaffuzlarını ; \"will, going to, be about to" yapılarını ve İngilizce'deki temel kalıplar ile soru sorma-bu sorulara cevap vermeyi öğreneceksiniz.""",
                  duration: '300dk',
                  lessons: [
                    Lesson(
                        title: 'Giriş ',
                        subtitle: '',
                        url: 'https://youtu.be/8Whhqy6m008',
                        duration: '1dk'),
                    Lesson(
                        title: 'Modül Girişi',
                        subtitle: '',
                        url: 'https://youtu.be/RQNCIfF9aN4',
                        duration: '1dk'),
                    Lesson(
                        title: 'The Simple Present Tense',
                        subtitle:
                            'Bu derste grammer, cümle yapıları ve örnekler gibi birçok içerik ile Simple Present Tense\'i öğreneceksiniz.',
                        url: 'https://youtu.be/b5TDVEIDmxo',
                        duration: '16dk'),
                    Lesson(
                        title: 'The Present Continuous Tense',
                        subtitle:
                            'Bu derste cümle örnekleri ile Present Continuous Tense öğreneceksiniz.',
                        url: 'https://youtu.be/opOJaE_FDbQ',
                        duration: '9dk'),
                    Lesson(
                        title: 'Stative and Non-Stative Verbs',
                        subtitle:
                            'Bu derste stative and non-stative verb örnekleri ve kullanım şekillerini görerek öğreneceksiniz.',
                        url: 'https://youtu.be/0lPNUQLPB-Q',
                        duration: '18dk'),
                    Lesson(
                        title: 'The Simple Past Tense',
                        subtitle:
                            'Bu derste regular verbs ve cümle örnekleri, irregular verbs kullanım ve telaffuzlarını göreceksiniz.',
                        url: 'https://youtu.be/5gH8yJH8svI',
                        duration: '12dk'),
                    Lesson(
                        title: 'The Past Continuous Tense',
                        subtitle:
                            'Bu derste past continuous tense mantığını anlayarak, grammer örnek cümleleri ile bilgi sahibi olacaksınız.',
                        url: 'https://youtu.be/CCIOMZM6RAc',
                        duration: '8dk'),
                    Lesson(
                        title:
                            'The Present Perfect Simple Tense The Present Perfect Continuous Tense',
                        subtitle:
                            'Bu derste present perfect simple tense için kullanılan kalıplar ve örnekleri, present perfect continuous tense için kullanılan kalıplar ve örneklerini öğreneceksiniz.',
                        url: 'https://youtu.be/xlHUK_DQm7E',
                        duration: '15dk'),
                    Lesson(
                        title:
                            'The Past Perfect Simple Tense vs The Past Perfect Continuous Tense',
                        subtitle:
                            'Bu derste, kullanılan kalıplar ve birçok örnek cümle ile konuyu öğreneceksiniz.',
                        url: 'https://youtu.be/7zF6okt-sB4',
                        duration: '12dk'),
                    Lesson(
                        title: 'Future Tenses',
                        subtitle:
                            'Bu derste will, going to ve be about to yapılarını, aralarındaki farklarını kavrayarak, örnek cümleler ile future tense öğreneceksiniz.',
                        url: 'https://youtu.be/RCz74WSYT_c',
                        duration: '12dk'),
                    Lesson(
                        title: 'Time Clauses in Future Tenses',
                        subtitle:
                            'Bu derste cümle örnekleri, cümlelerde kullanılabilecek kalıpları ve kurallarını öğreneceksiniz.',
                        url: 'https://youtu.be/8KJoEa_upSo',
                        duration: '7dk'),
                    Lesson(
                        title: 'The Future Continuous Tense',
                        subtitle:
                            'Bu derste tense uygun yapıların kullanımlarını göreceksiniz ve örnek cümleler ile konuyu pekiştirerek öğreneceksiniz.',
                        url: 'https://youtu.be/OD3FwM-SgNA',
                        duration: '7dk'),
                    Lesson(
                        title:
                            'Future Perfect Simple vs Future Perfect Continuous',
                        subtitle:
                            'Bu derste konu ile ilgili birçok örnek cümle göreceksiniz ve ders sonunda alıştırma cümleleri yaparak dersi pekiştirebileceksiniz.',
                        url: 'https://youtu.be/mgR8L1OcCH4',
                        duration: '10dk'),
                    Lesson(
                        title: 'Questions in English',
                        subtitle:
                            'Bu derste İngilizcede soru sorma ve bu sorura cevap vermeyi öğreneceksiniz.',
                        url: 'https://youtu.be/i4Hwrr_VKcM',
                        duration: '16dk'),
                    Lesson(
                        title: '\ QUESTIONS WITH -HOW-',
                        subtitle:
                            'How "Nasıl" anlamına gelmektedir ama birçok kullanımı mevcuttur. Bu derste, bu kullanımları göreceksiniz.',
                        url: 'https://youtu.be/CepQ6_9o80A',
                        duration: '11dk'),
                    Lesson(
                        title: 'TAG QUESTIONS',
                        subtitle:
                            '"Tag Question" veya "Question Tag" olarak da kullanılmaktadır. Cümlelerin sonuna ".. değil mi?" anlamını vermek için ek sorular için kullanılır. Bu derste bu kullanımı göreceksiniz.',
                        url: 'https://youtu.be/vrW2qXVJ7aU',
                        duration: '9dk'),
                    Lesson(
                        title: 'PERSONAL PRONOUNS',
                        subtitle:
                            'Bu başlığın altında özne zamirleri (SP), nesne zamirleri (OP); iyelik sıfatları (PA), iyelik zamirleri (PP) ile "Reflexive Pronouns" (özne pekiştirme) uygulamalarını göreceksiniz.',
                        url: 'https://youtu.be/_LUNwI3OT2Q',
                        duration: '8dk'),
                    Lesson(
                        title:
                            'INDEFINITE PRONOUNS, GENERAL NOUNS, COLLECTIVE NOUNS',
                        subtitle:
                            'Bu derste, belgisiz zamirler; topluluk isimleri gibi konular işlenecektir. "Impersonal Pronouns" yani kişisel olmayan zamirler konusuna da değinilmiştir.',
                        url: 'https://youtu.be/MTyqAREEH6M',
                        duration: '8dk'),
                    Lesson(
                        title: '\ USING -OTHER-',
                        subtitle:
                            'Bu derste, "Başka, bir diğer, diğer vs." gibi anlamlarıyla bildiğiniz "Other" kullanımlarını öğreneceksiniz.',
                        url: 'https://youtu.be/QWWXI-STd58',
                        duration: '6dk'),
                    Lesson(
                        title: 'COMMON EXPRESSIONS WITH -OTHER-',
                        subtitle:
                            'Bu derste, "Other" ile kullanılan yaygın ifadeleri öğreneceksiniz.',
                        url: 'https://youtu.be/KgHsn1jvC5k',
                        duration: '7dk'),
                    Lesson(
                        title: 'SUBJECT-VERB AGREEMENT',
                        subtitle:
                            'Bu derste, özne-yüklem uyumu ele alınmıştır. Özellikle tekillik ve çoğulluk anlamlarını taşıyan kavramların kullanımlarını öğreneceksiğniz.',
                        url: 'https://youtu.be/ldUw85Y5mcQ',
                        duration: '12dk'),
                    Lesson(
                        title: 'REGULAR AND IRREGULAR PLURAL NOUNS',
                        subtitle:
                            'Bu derste, düzenli ve düzensiz çoğul isimler ele alınmıştır.',
                        url: 'https://youtu.be/m4C707FbkR0',
                        duration: '7dk'),
                    Lesson(
                        title: 'POSSESIVE NOUNS AND NOUNS USED AS ADJECTIVES',
                        subtitle:
                            'Bu derste, iyelik eki almış yani "-nın/-nin" anlamını verdiğimiz isimler (PN) ile sıfat görevinde yani Türkçe\'deki "İsim Tamlamaları\" olarak kullanılan isimler ele alınmıştır.',
                        url: 'https://youtu.be/LjpSBWdRMHA',
                        duration: '6dk'),
                    Lesson(
                        title: 'COUNTABLE AND UNCOUNTABLE NOUNS',
                        subtitle:
                            'Bu derste, İngilizce\'nin en önemli konularından birisi olan, sayılabilen ve sayılamayan isimler konusu ele alınmıştır.',
                        url: 'https://youtu.be/dobVGBRXD9o',
                        duration: '11dk'),
                    Lesson(
                        title: 'BASIC ARTICLE USAGE',
                        subtitle:
                            'Bu derste, a, and the kullanımı ve aynı zamanda genelleme yaparken no article kullanımını öğreneceksiniz.',
                        url: 'https://youtu.be/gzvXdmXQt1s',
                        duration: '8dk'),
                    Lesson(
                        title: 'EXPRESSING QUANTITY',
                        subtitle:
                            'Bu derste, miktar ifade etmeyi öğreneceksiniz. Özellikle sayılabilen ve sayılamayan isimleri ayırarak örenklerle öğreneceksiniz.',
                        url: 'https://youtu.be/qV_PpbTaKKY',
                        duration: '8dk'),
                    Lesson(
                        title: 'Using Few, A Few, Little and A Litte',
                        subtitle:
                            'Bu derste, sayılabilen ve sayılamayan isimleri anlayabilmek için çok önemli olan Few, A Few, Little ve A Little konusunu öğreneceksiniz.',
                        url: 'https://youtu.be/GJIgXPc8Efw',
                        duration: '6dk'),
                    //Lesson(title: '', subtitle: '', url: '', duration: 'dk'),
                  ]),



              LessonTopics(
                  title: 'Reading Practice',
                  subtitle:
                      'Bu modülde okuma parçaları üzerinden birçok çalışma yapacaksınız. Parçada yer alan metni çevri yaparak kavrayacak, eğitmenimiz ile birlikte çeviri yapmayı öğrenecek ve metinde çeviri yaparken bilmeniz gereken önemli noktaları görecek; bazı yapıların kullanımını ve önemli kelimeleri öğreneceksiniz.',
                  duration: '104dk',
                  lessons: [
                    Lesson(title: 'Modül Girişi', subtitle: "", url: 'https://youtu.be/bJGoFKSrlD4', duration: '1dk'),
                    Lesson(title: 'READING - WHAT IS UNITY PART 1', subtitle: "Bu derste, bir okuma parçası ele alınacaktır. Parçada yer alan \"Unity nedir?\" metni ile çeviri yapmayı öğrenirken bazı yapıların kullanımını ve önemli kelimeleri öğreneceksiniz.", url: 'https://youtu.be/Daa_3Dup_x8', duration: '15dk'),
                    Lesson(title: 'READING - WHAT IS UNITY (VOCABULARY) PART 2', subtitle: "Bu derste, okuma parçasında yer alan önemli kelimeleri ve anlamlarını öğreneceksiniz", url: 'https://youtu.be/11SJeDeJjcY', duration: '7dk'),
                    Lesson(title: 'READING-WHAT IS A UNITY DEVELOPER AND WHY USE UNITY PART 1', subtitle: "Bu derste, yine okuma parçası ele alınacaktır. Parçada yer alan metin ile çeviri yapmayı öğrenirken bazı yapıların kullanımını ve önemli kelimeleri öğreneceksiniz.", url: 'https://youtu.be/YKaaxtIIunc', duration: '14dk'),
                    Lesson(title: 'READING-WHAT IS A UNITY DEVELOPER AND WHY USE UNITY (VOCABULARY) PART 2', subtitle: "Bu derste, okuma parçasında yer alan önemli kelimeleri ve anlamlarını öğreneceksiniz.", url: 'https://youtu.be/GfUz3pUrB-A', duration: '13dk'),
                    Lesson(title: 'READING-ADVANTAGES OF USING UNITY PART 1', subtitle: "Bu derste, yine okuma parçası ele alınacaktır. Parçada yer alan metin ile çeviri yapmayı öğrenirken bazı yapıların kullanımını ve önemli kelimeleri öğreneceksiniz.", url: 'https://youtu.be/lRIWYBKjjJQ', duration: '11dk'),
                    Lesson(title: 'READING-ADVANTAGES OF USING UNITY (VOCABULARY) PART 2', subtitle: "Bu derste, okuma parçasında yer alan önemli kelimeleri ve anlamlarını öğreneceksiniz.", url: 'https://youtu.be/nVsMweTdtdo', duration: '8dk'),
                    Lesson(title: 'READING- HIRING UNITY DEVELOPERS PART 1', subtitle: "Bu derste, yine okuma parçası ele alınacaktır. Parçada yer alan metin ile çeviri yapmayı öğrenirken bazı yapıların kullanımını ve önemli kelimeleri öğreneceksiniz.", url: 'https://youtu.be/5qwSGjwb0a4', duration: '11dk'),
                    Lesson(title: 'READING- HIRING UNITY DEVELOPERS (VOCABULARY) PART 2', subtitle: "Bu derste, okuma parçasında yer alan önemli kelimeleri ve anlamlarını öğreneceksiniz.", url: 'https://youtu.be/O9pJuVwzaj0', duration: '9dk'),
                    Lesson(title: '', subtitle: "", url: '', duration: 'dk'),


                  ])
            ]),
HeaderTopics(
            title: 'Temel Girişimcilik',
            description:
            'Yeni nesil girişim dünyasında var olmak için çıkacağın bu yolculukta ihtiyacın olacak tüm unsurları öğreneceksin.',
            duration: '338dk',
            color: Colors.blue,
            subtopics: [
              LessonTopics(
                  title: 'Kullanıcı İçgörüsü Toplama ve Sentezleme',
                  subtitle:
                      "",
                  duration: '24dk',
                  lessons: [
                    Lesson(
                        title: 'Kullanıcı İçgörüsü Toplama ve Sentezleme 1',
                        subtitle:
                            "",
                        url: 'https://www.youtube.com/watch?v=RKwJwCaaFec',
                        duration: '12dk'),
                    Lesson(
                        title: 'Kullanıcı İçgörüsü Toplama ve Sentezleme 2',
                        subtitle:
                            '',
                        url: 'https://youtu.be/fLc6xbVjjOs',
                        duration: '10dk'),
                    Lesson(
                        title: 'Kullanıcı İçgörüsü Toplama ve Sentezleme 3',
                        subtitle:
                            "",
                        url: 'https://youtu.be/sxPi5_lVWkw',
                        duration: '4dk'),
                  ]),
              LessonTopics(
                  title: 'Fikir Doğrulama',
                  subtitle:
                      '',
                  duration: '45dk',
                  lessons: [
                    Lesson(
                        title: 'Fikir Doğrulama 1',
                        subtitle:
                            "",
                        url: 'https://youtu.be/xi0W5uN3-R4',
                        duration: '9dk'),
                    Lesson(
                        title: 'Fikir Doğrulama 2',
                        subtitle:
                            "",
                        url: 'https://youtu.be/x88__9rkMIU',
                        duration: '10dk'),
                    Lesson(
                        title: 'Fikir Doğrulama 3',
                        subtitle:
                            "",
                        url: 'https://youtu.be/Yo1Ze7Qqa5Y',
                        duration: '9dk'),
                    Lesson(
                        title: 'Fikir Doğrulama 4',
                        subtitle:
                            "",
                        url: 'https://youtu.be/RR9D_JdyRu0',
                        duration: '8dk'),
                    Lesson(
                        title: 'Fikir Doğrulama 5',
                        subtitle:
                            "",
                        url: 'https://youtu.be/6Gier_OlL5E',
                        duration: '9dk'),
                  ])
            ]),

            HeaderTopics(
            title: 'Girişimciler için Hukuk',
            description:
            'Girişimcilik dünyasına girmeden önce bilmeniz gereken temel hukuki bilgileri öğrenin.',
            duration: '104dk',
            color: Colors.blue,
            subtopics: [
                LessonTopics(
                  title: 'Girişimciler İçin Şirketleşme',
                  subtitle:
                      '',
                  duration: '25dk',
                  lessons: [
                    Lesson(
                        title: 'Girişimciler İçin Şirketleşme',
                        subtitle:
                            "",
                        url: 'https://youtu.be/gRec-V6WcZw',
                        duration: '25dk'),
                  ]),
                LessonTopics(
                  title: 'Girişimciler İçin Müzakere 101',
                  subtitle:
                      "",
                  duration: '36dk',
                  lessons: [
                    Lesson(
                        title: 'Girişimciler İçin Müzakere 101',
                        subtitle:
                            "",
                        url: 'https://youtu.be/j9y25qBTTtE',
                        duration: '36dk'),
                  ]),
              LessonTopics(
                  title: 'Girişimciler İçin KVKK ve GDPR',
                  subtitle:
                      '',
                  duration: '43dk',
                  lessons: [
                    Lesson(
                        title: 'Girişimciler İçin KVKK ve GDPR',
                        subtitle:
                            "",
                        url: 'https://youtu.be/XrJZkBRS2Ao',
                        duration: '43dk'),
                  ]),
            ]),

            HeaderTopics(
            title: 'Girişimciler için Finans',
            description:
            'Girişimcilerin faaliyette bulundukları Finansal Sistem , Finansal Araçlar, Muhasebe ve Vergi Uygulamaları hakkında bilgi sahibi olun.',
            duration: '177dk',
            color: Colors.blue,
            subtopics: [
                LessonTopics(
                  title: 'Girişimciler için Finansal Sistem',
                  subtitle:
                      '',
                  duration: '9dk',
                  lessons: [
                    Lesson(
                        title: 'Girişimciler için Finansal Sistem',
                        subtitle:
                            "",
                        url: 'https://youtu.be/jpSMIKfAnj8',
                        duration: 'dk'),
                  ]),
                LessonTopics(
                  title: 'İşletmelerin Dikkat Etmesi Gereken Hususlar',
                  subtitle:
                      '',
                  duration: '9dk',
                  lessons: [
                    Lesson(
                        title: 'İşletmelerin Kuruluş Süreci ve Dikkat Edilmesi Gereken Hususlar',
                        subtitle:
                            "",
                        url: 'https://youtu.be/fDSq-EJslPQ',
                        duration: '12dk'),
                    Lesson(
                        title: 'İşletmelerin Başarısızlık Nedenleri',
                        subtitle:
                            "",
                        url: 'https://youtu.be/ZOQi6hpQdvA',
                        duration: '8dk'),
                  ]
                  ),

                LessonTopics(
                  title: 'İşletmeler için Muhasebe',
                  subtitle:
                      "",
                  duration: '17dk',
                  lessons: [
                    Lesson(
                        title: 'İşletmeler için Muhasebe Nedir ve Mali Yönetim Açısından Neden Önemlidir',
                        subtitle:
                            "",
                        url: 'https://youtu.be/trHXfywW9uU',
                        duration: '9dk'),
                    Lesson(
                        title: 'Muhasebeciler ve İşletmeye Verdikleri Temel Hizmetler',
                        subtitle:
                            "",
                        url: 'https://youtu.be/qZn_bTL4m7o',
                        duration: '8dk'),
                  ])

            ]),

            HeaderTopics(
            title: 'Girişimciler için İK',
            description:
            'İş hayatınızı yeniden inşa ederken ihtiyacınız olan becerileri kazanacak, başarılı bir profesyonel hayat için gerekli olan uzaktan çalışma, yaşam boyu öğrenme, bütünsel sağlık gibi konularda önemli ipuçlarına erişebileceksiniz.',
            duration: '77dk',
            color: Colors.blue,
            subtopics: [
                LessonTopics(
                  title: 'İnsan Kaynakları Eğitimi',
                  subtitle:
                      '',
                  duration: '77dk',
                  lessons: [
                    Lesson(
                        title: 'Özgeçmiş ve Motivasyon Mektubu Hazırlama',
                        subtitle:
                            "",
                        url: 'https://youtu.be/Mmp2mnWtpHU',
                        duration: '6dk'),
                    Lesson(
                        title: 'Sosyal Platformlarda Oyun ve Uygulama Geliştirme Becerilerini Göster',
                        subtitle:
                            "",
                        url: 'https://youtu.be/dRJvjxFjLRs',
                        duration: '5dk'),
                    Lesson(
                        title: 'Etkili Network Oluşturmak ve Sürdürmek için İpuçları',
                        subtitle:
                            "",
                        url: 'https://youtu.be/UoIGQhChknA',
                        duration: '4dk'),
                    Lesson(
                        title: 'Profesyonel Yetkinliklerinizi ve Şirketin Değerlerine & Kültürüne Uyumunuzu Doğru Yansıtmak',
                        subtitle:
                            "",
                        url: 'https://youtu.be/1HS5yTC-N2U',
                        duration: '7dk'),
                    Lesson(
                        title: 'Telefon Mülakatı, Yüz Yüze Mülakat ve Teknik Mülakat',
                        subtitle:
                            "",
                        url: 'https://youtu.be/-HNuj-BdNDc',
                        duration: '6dk'),
                    Lesson(
                        title: 'Uygulama Geliştiricisi Kariyerine Başlarken Bazı İpuçları',
                        subtitle:
                            "",
                        url: 'https://youtu.be/B5VzxH8km_0',
                        duration: '10dk'),
                    Lesson(
                        title: 'Uzaktan Çalışma Zorluklarının Üstesinden Nasıl Gelinir?',
                        subtitle:
                            "",
                        url: 'https://youtu.be/lrVaE1F8tHM',
                        duration: '6dk'),
                    Lesson(
                        title: 'Uzaktan Çalışma Dünyasında Yaratıcılığı Artırmak',
                        subtitle:
                            "",
                        url: 'https://youtu.be/e35oaswK8ZQ',
                        duration: '7dk'),
                    Lesson(
                        title: 'Uzaktan Çalışma Dünyasında Daha Anlamlı Bağlantılar Nasıl Kurulur ve Sürdürülür?',
                        subtitle:
                            "",
                        url: 'https://youtu.be/nFxqo9X834c',
                        duration: '6dk'),
                    Lesson(
                        title: 'Freelance Oyun ve Uygulama Geliştiricisi Olmanın Avantajları, Zorlukları ve Dikkat Edilmesi Gereken Noktalar',
                        subtitle:
                            "",
                        url: 'https://youtu.be/0z0FxenJryo',
                        duration: '4dk'),
                    Lesson(
                        title: 'Fiziksel Sağlık',
                        subtitle:
                            "",
                        url: 'https://youtu.be/CehWRdDscA8',
                        duration: '6dk'),
                    Lesson(
                        title: 'Zihin Sağlığı ve Bağlı & Değerli Hissetmek',
                        subtitle:
                            "",
                        url: 'https://youtu.be/_0mgQZJvSpA',
                        duration: '5dk'),
                    Lesson(
                        title: 'Yaşam Boyu Öğrenme ve Gelişim',
                        subtitle:
                            "",
                        url: 'https://youtu.be/Wk0O3pKMMaQ',
                        duration: '5dk'),

                  ])
            ]),
      ];
}

