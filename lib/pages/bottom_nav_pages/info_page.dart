import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(
            width: AppBar().preferredSize.width,
            height: AppBar().preferredSize.height + 25),
        const Image(
          image: NetworkImage(
              'https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/homepage-images/illustration_1.2.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Akademi Hakkında',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            "Google Türkiye, Sanayi ve Teknoloji Bakanlığı, Cumhurbaşkanlığı Dijital Dönüşüm Ofisi'nin desteği ve Girişimcilik Vakfı ve T3 Girişim Merkezi'nin iş birliğinde 2021 yılında hayata geçen Oyun ve Uygulama Akademisi, Türkiye’de oyun geliştirme, uygulama yazılımcılığı ve bu iki alanın girişimcilikle bir araya gelmesini destekleyen bütüncül bir yetkinlik kazandırma programıdır. Program kapsamında bursiyerler kariyer hayatları boyunca faydalanabilecekleri yetkinlikler kazanarak, tamamladıkları eğitimler için sertifika almaya hak kazanacaktır."),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Yöntem',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
            "Oyun ve uygulama geliştirme eğitimleri (Flutter, Unity ve Oyun Sanatı), Coursera’da yer alan Türkçe Google Proje Yönetimi Sertifika Programı, yazılımcılar için temel İngilizce eğitimi ve teknoloji alanında girişim kurmak isteyenler için bilinmesi gereken hukuk, finans, insan kaynağı ve temel girişimcilik eğitimlerinin yanı sıra BİT sektöründe çalışmak isteyenler için farklı deneyimler sunulmaktadır. Bunlara ilaveten tamamlayıcı yetkinlikler olarak sektörel networking eğitimleri, sosyal beceri eğitimleri, alanında öncü profesyoneller ve girişimcilerin ağırlandığı kariyer hızlandırma zirvelerine de yer verilmektedir. Akademi bursiyerleri eğitimler, atölyeler ve program sonunda gerçekleşecek Bootcamp ile kendi oyun veya uygulamalarını geliştirebilecektir. Akademi, aynı zamanda bireyler arası iş birliğine ve güçlü bir iş ağı oluşturmalarına odaklanan yenilikçi bir topluluk programıdır."),
        const SizedBox(
          height: 20,
        ),
        const Image(
          image: NetworkImage(
              'https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/about-us-images/about-us-img-3.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.blue,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/2/616407b6162f2.png?v=1.2',
            'Oyun ve Uygulama Geliştirme Eğitimleri',
            'Hayalindeki oyunu ve uygulamayı tasarlayıp geliştirmen için ihtiyacın olan ‘Flutter ile Uygulama Geliştirme’ ve ‘Unity ile Oyun Geliştirme’ temel eğitimlerini alabilecek; Oyun Sanatı (Game Art) eğitimi ile oyun tasarım süreçlerini yakından deneyimleyebileceksin.'),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.red,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/3/6164081213475.png?v=1.2',
            'Google Proje Yönetimi Sertifika Programı',
            'Coursera’da yer alan ve Türkiye’de ilk defa Türkçe olarak hazırlanan bu programa Akademi bursiyeri olarak hiçbir ücret ödemeden katılarak proje yönetimi konusunda uzmanlaşabilecek ve bu alanda bir kariyer sertifikası sahibi olabileceksin!'),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.orange,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/4/6164092a1ff4b.png?v=1.2',
            'Teknoloji Girişimciliği Eğitimleri',
            'Temel girişimcilik, hukuk, finans ve insan kaynağı eğitimleri ile kendi teknoloji girişimini kurman ve sürdürmen için gerekli olan tüm temel eğitim ve içeriklere ulaşabileceksin.'),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.green,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/6/630e09c8c4152.png?v=1.2',
            'Yazılımcılar için İngilizce Eğitimi',
            'Oyun ve Uygulama Akademisi’nde kariyerini teknoloji sektöründe kurarken faydalanabileceğin, oyun ve uygulama geliştirme alanında uluslararası standart ve gelişmeleri takip edebilmeni kolaylaştıracak İngilizce eğitimlerine katılabileceksin.'),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.blue,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/5/616408a57535f.png?v=1.2',
            'Yazılımcılar için İngilizce Eğitimi',
            'Hayalindeki oyunu ve uygulamayı tasarlayıp geliştirmen için ihtiyacın olan ‘Flutter ile Uygulama Geliştirme’ ve ‘Unity ile Oyun Geliştirme’ temel eğitimlerini alabilecek; Oyun Sanatı (Game Art) eğitimi ile oyun tasarım süreçlerini yakından deneyimleyebileceksin.'),
        const SizedBox(
          height: 20,
        ),
        cardWidget(
            Colors.grey,
            'https://oyunveuygulamaakademisi.com/file/show/media/images/academy_program/7/630e09ff38e37.png?v=1.2',
            "Ideathon, Game & App Jam, Mezuniyet Bootcamp'i",
            'Oyun ve Uygulama Akademisi’nde kazandığın yetkinlikleri kullanarak geliştirdiğin fikirleri çeşitli yarışmalarla bir iş modeline dönüştürebilecek, kendi oyun veya uygulamanı geliştirebilecek ve girişimin için ilk adımı Akademi ile atabileceksin.'),
        const SizedBox(
          height: 20,
        ),
        const Image(
          image: NetworkImage(
              'https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/about-us-images/about-us-img-5.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Akademi’yi Farklı Kılanlar',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
            """• Bilişim ve teknoloji sektörüne özel yaklaşık 450 saat eğitim programı
• Tüm dünyada geçerli oyun ve uygulama geliştirme eğitimleri
• Sonuç ve kariyer odaklı programlar
• 18-29 yaş arası üniversite öğrencisi veya mezunu herkesin başvurusuna açık
• Tamamen ücretsiz eğitim ve aktiviteler
• Her yerden, her zaman eğitimlere çevrimiçi erişim imkanı
• Uluslararası Google ve Coursera sertifikalarıyla onaylanmış eğitimler
• Topluluğa dahil olma, hayat boyu yol arkadaşın olabilecek insanları tanıma, onlarla yakından çalışma imkanı
• Kendi oyun veya uygulamanı geliştirerek bir portfolyo yaratma şansı
• Fikrini iş modeline dönüştürme imkanı
• Girişimcilik ekosistemi ile tanışarak, eşsiz bir networke dahil olma fırsatı"""),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 90,
        )
      ],
    );
  }

  Container cardWidget(
      Color color, String url, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Image(
            width: 100,
            image: NetworkImage(
              url,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
