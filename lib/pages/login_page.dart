import 'package:app_jam_uygulama/components/common_alert_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  bool isTeacher = false;

  @override
  void initState() {
    //TODO NotificationApi.cancelAll();

    //TODO BlocProvider.of<EventsBloc>(context).clear();
    super.initState();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: SizedBox(
                      height: 200,
                      child: Image(
                          image: AssetImage("assets/images/oua_logo.png")),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Oyun ve Uygulama Akademisine Hoş Geldin!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Devam etmek için lütfen giriş yapin',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
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
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Şifre',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                        //forgot Password
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Şifrenizi mi unuttunuz?',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      CommonAlertDialogs.forgotPassword(
                                          context),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    text: 'Hesabın yok mu? ',
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Kayıt ol.',
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            CommonAlertDialogs.newUser(context))
                                ])),
                            ElevatedButton(
                                key: const ValueKey<String>('loginButton'),
                                onPressed: () async {
                                  final isValid =
                                      formKey.currentState!.validate();
                                  if (isValid) {
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      // Oturum açma başarılı
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found' ||
                                          e.code == 'wrong-password') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Kullanıcı adı veya şifre hatalı.')));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Bir hata oluştu: ${e.message}')));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Bir hata oluştu: $e')));
                                    }
                                  }
                                },
                                child: const Text(
                                  'Giriş Yap',
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  /* ElevatedButton.icon(
                          key: const ValueKey<String>('loginButton'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50)),
                          onPressed: () async {
                            isTeacher
                                ? await context
                                    .read<PreferencesBloc>()
                                    .teacherMode()
                                : await context
                                    .read<PreferencesBloc>()
                                    .studentMode();
                            await AuthService().signInWithGoogle();
                          },
                          icon: SizedBox(
                              height: 30,
                              child: CommonMethods.neon(
                                  child: const Image(
                                      image:
                                          AssetImage("assets/google_icon.png")))),
                          label: CommonMethods.neon(
                              child: Text(
                            AppLocalizations.of(context)!.loginWithGoogle,
                          ))), */
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
