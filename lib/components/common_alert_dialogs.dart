import 'dart:io';

import 'package:app_jam_uygulama/providers/app_info_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CommonAlertDialogs {
  static settings(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        bool notificationsEnabled = true;
        bool darkModeEnabled = false;
        return AlertDialog(
          title: const Text('Ayarlar'),
          content: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Bildirimleri Aç'),
                  trailing: Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Karanlık Modu Aç'),
                  trailing: Switch(
                    value: darkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        darkModeEnabled = value;
                      });
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Dil Seçimi'),
                  trailing: DropdownButton<String>(
                    value: 'TR',
                    items: <String>['TR', 'EN']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (_) {},
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Çıkış Yap'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    // Çıkış yapma işlemleri burada yapılabilir
                  },
                ),
              ],
            );
          }),
        );
      });
  static profile(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        final user = FirebaseAuth.instance.currentUser!;
        final userName = context.read<AppInfoBloc>().state.userName;
        return AlertDialog(
          title: const Text('Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              BlocBuilder<AppInfoBloc, AppInfo>(builder: (context, state) {
                return CircleAvatar(
                  radius: 75,
                  backgroundImage:
                      const AssetImage('assets/images/blankperson.jpg'),
                  foregroundImage:
                      state.url != null ? NetworkImage(state.url!) : null,
                );
              }),
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
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedFile == null) return;
                    final storageRef =
                        FirebaseStorage.instance.ref().child(user.uid);
                    final uploadTask =
                        storageRef.putFile(File(pickedFile.path));
                    await uploadTask.whenComplete(() async {
                      print('Resim yüklendi.');
                      context.read<AppInfoBloc>().setImageUrl(
                          await FirebaseStorage.instance
                              .ref()
                              .child(user.uid)
                              .getDownloadURL());
                    });
                  },
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
          ),
        );
      });
  static shareNewNote(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final subtitleController = TextEditingController();
        final formKey = GlobalKey<FormState>();
        return AlertDialog(
          title: const Text('Not Paylaş'),
          scrollable: true,
          content: Form(
            key: formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Başlık',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  validator: (a) {
                    final value = a;
                    if (value == null || value.trim().isEmpty) {
                      return 'Boş bırakılamaz';
                    }
                    if (value.trim().length < 7) return 'Çok Kısa';
                    return null;
                  }),
              TextFormField(
                controller: subtitleController,
                maxLength: 5000,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Açıklama',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
                validator: (a) {
                  final value = a;
                  if (value == null || value.trim().isEmpty) {
                    return 'Boş bırakılamaz';
                  }
                  if (value.trim().length < 50) return 'Çok Kısa';
                  return null;
                },
                maxLines: null,
              ),
              ElevatedButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final subtitle = subtitleController.text.trim();
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      CommonAlertDialogs.loadingScreen(context);
                      FirebaseFirestore.instance.collection('notes').doc().set({
                        'title': title,
                        'subtitle': subtitle,
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'name': context.read<AppInfoBloc>().state.userName,
                        'date': Timestamp.now()
                      }).then((value) => Navigator.of(context)
                        ..pop()
                        ..pop());
                    }
                  },
                  child: const Text('Paylaş'))
            ]),
          ),
        );
      });
  static loadingScreen(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: 50,
                    child: Image.asset('assets/images/oua_logo.png')),
                const SizedBox(
                  height: 16,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ));
  static newUser(BuildContext context) => showDialog(
      context: (context),
      builder: (BuildContext context) {
        final nameController = TextEditingController();
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        final confirmPasswordController = TextEditingController();
        return AlertDialog(
          title: const Text('Kayıt Ol'),
          scrollable: true,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // full name
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Ad Soyad',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 10),
              // email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 10),
              // password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Şifre',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 10),
              // confirm password
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Şifre Onayla',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set({'name': nameController.text}).then(
                              (value) => Navigator.pop(context));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Şifre zayıf. Lütfen daha güçlü bir şifre seçin.'),
                          ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Bu email adresi ile daha önce kayıt olunmuş.'),
                          ),
                        );
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Şifreler uyuşmuyor.'),
                      ),
                    );
                  }
                },
                child: const Text('Kayıt Ol'),
              ),
            ],
          ),
        );
      });
  static forgotPassword(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          final resetEmailController = TextEditingController();
          final formKey = GlobalKey<FormState>();
          return AlertDialog(
            title: const Text('Şifre Sıfırlama'),
            content: Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bu alan boş bırakılamaz';
                  }
                  if (value == '') return null;
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return 'Geçersiz email adresi';
                  }
                  return null;
                },
                controller: resetEmailController,
                decoration:
                    const InputDecoration(hintText: 'Email adresinizi girin'),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('İptal'),
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(
                            email: resetEmailController.text)
                        .then((value) {
                      // Show a success message to the user
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Password reset email sent')));
                    }).catchError((error) {
                      // Show an error message to the user
                      if (error.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Email address not associated with an account')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Error resetting password: $error')));
                      }
                    }).then((value) => Navigator.pop(context));
                  }
                },
                child: const Text('Gönder'),
              ),
            ],
          );
        },
      );
}
