import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında'),
      ),
      body: Center(
        child: Text(
          'Bu uygulama, Oyun ve Uygulama Akademisi öğrencileri için tasarlanmıştır ve ücretsiz olarak sunulmaktadır. Uygulama, Android ve iOS cihazlar için mevcuttur ve kolay bir şekilde indirilip kullanılabilir. Kullanıcı dostu arayüzü sayesinde, öğrenciler ders takvimlerini kolaylıkla takip edebilir ve Oyun ve Uygulama Akademisi\'nin eğitimlerine anında erişebilirler. Proje geliştirme ekipleri oluşturarak, öğrenciler birbirleriyle iletişim kurabilir ve projeleri hakkında tartışmalar açabilirler. Bu sayede, öğrencilerin yaratıcılıklarını geliştirmeleri ve projelerini daha verimli bir şekilde yönetmeleri kolaylaşır. Ayrıca, Akademi\'nin sorduğu sorulara cevap vererek, öğrenciler puan kazanabilir ve sıralamada yükselme şansı yakalayabilirler. Oyun ve Uygulama Akademisi Mobil App, geleceğin oyun ve uygulama geliştiricilerine yardımcı olmak için tasarlanmış bir uygulamadır. Öğrenciler, Akademi\'nin verdiği eğitimler sayesinde daha başarılı projeler geliştirebilir ve sektöre hazırlanabilirler. Uygulama, öğrencilerin öğrenme sürecini daha keyifli hale getirir ve onların tutkulu bir topluluğun bir parçası olmalarına yardımcı olur. Özetle, Oyun ve Uygulama Akademisi Mobil App, oyun ve uygulama geliştirme tutkusu olan öğrencilerin bir araya geldiği, eğitimlerine kolayca erişebildikleri, projelerini daha verimli bir şekilde yönetebildikleri ve birbirleriyle iletişim kurabildikleri bir uygulamadır. Akademi\'nin sorduğu sorulara cevap vererek, öğrenciler puan kazanabilir ve sıralamada yükselme şansı yakalayabilirler. Oyun ve Uygulama Akademisi Mobil App, öğrencilerin gelecekteki başarılarına yardımcı olmak için tasarlanmış bir uygulamadır.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
