import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      Myapp(),
    ),
  );
}

// ignore: must_be_immutable
class Myapp extends GetView {
  FirebaseAuth auth = FirebaseAuth.instance;
  Myapp({Key? key}) : super(key: key);
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
              theme: ThemeData(
                  colorScheme: const ColorScheme(
                      brightness: Brightness.light,
                      primary: Colors.amber,
                      secondary: Color(0xFF00BFA5),
                      surface: Color(0xFFF5F5F5),
                      background: Color(0xFFF5F5F5),
                      error: Color(0xFFB00020),
                      onPrimary: Colors.white,
                      onSecondary: Colors.white,
                      onSurface: Colors.white,
                      onBackground: Colors.white,
                      onError: Colors.white),
                  textTheme: GoogleFonts.poppinsTextTheme(),
                  useMaterial3: true),
              debugShowCheckedModeBanner: false,
              title: 'Sicika',
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.HOME //home
                      : Routes.INTRODUCTION_PAGE, //login
              getPages: AppPages.routes);
        }
        return const CircularProgressIndicator(
          color: Colors.amber,
        );
      },
    );
  }
}
