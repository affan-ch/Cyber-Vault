import 'package:cyber_vault/pages/credit_card_page.dart';
import 'package:cyber_vault/pages/documents_page.dart';
import 'package:cyber_vault/pages/passwords_page.dart';
import 'package:cyber_vault/pages/personal_info_page.dart';
import 'package:cyber_vault/pages/secure_notes.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cyber_vault/pages/splash_screen.dart';
import 'package:cyber_vault/pages/home_page.dart';
import 'package:cyber_vault/pages/login_page.dart';
import 'package:cyber_vault/pages/signup_page.dart';
import 'package:cyber_vault/pages/add_password_page.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cyber Vault',
        routes: {
          '/': (context) => const SplashScreen(
                // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
                child: LoginPage(),
              ),
          '/login': (context) => const LoginPage(),
          '/signUp': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/passwords': (context) => const PasswordsPage(),
          '/personal_info': (context) => const PersonalInfoPage(),
          '/secure_notes': (context) => const SecureNotesPage(),
          '/documents': (context) => const DocumentsPage(),
          '/credit_card': (context) => const CreditCardPage(),
          '/add_password': (context) => const AddPasswordPage(),
        },
        theme: ThemeData(
          colorScheme:
              lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        darkTheme: ThemeData(
          colorScheme:
              darkDynamic ?? ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
      );
    });
  }
}
