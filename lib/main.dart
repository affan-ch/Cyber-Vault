import 'dart:io';
import 'package:cyber_vault/services/local_session.dart';
import 'package:cyber_vault/services/validate_token.dart';
import 'package:cyber_vault/pages/add_credit_card_page.dart';
import 'package:cyber_vault/pages/add_personal_info_page.dart';
import 'package:cyber_vault/pages/credit_card_page.dart';
import 'package:cyber_vault/pages/documents_page.dart';
import 'package:cyber_vault/pages/accounts_page.dart';
import 'package:cyber_vault/pages/personal_info_page.dart';
import 'package:cyber_vault/pages/secure_notes.dart';
import 'package:cyber_vault/pages/shell_page.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cyber_vault/pages/splash_screen.dart';
import 'package:cyber_vault/pages/home_page.dart';
import 'package:cyber_vault/pages/login_page.dart';
import 'package:cyber_vault/pages/signup_page.dart';
import 'package:cyber_vault/pages/add_account_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  // Initialize sqflite for desktop
  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> initialRouteFuture;

  @override
  void initState() {
    super.initState();
    initialRouteFuture = checkToken();
  }

  Future<String?> checkToken() async {
    String token = await getTokenFromDb();

    if (token.isEmpty) {
      return '/login';
    }
    print(token);

    dynamic response = await validateToken(token);
    print("Status code: ${response.statusCode}");
    print(response.body);

    if (response.statusCode == 200) {
      return '/home';
    } else {
      await clearTable();
      return '/login';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cyber Vault',
        home: FutureBuilder<String?>(
          future: initialRouteFuture,
          builder: (context, snapshot) {
            // While the future is not resolved yet, show the splash screen
            if (snapshot.connectionState != ConnectionState.done) {
              return const SplashScreen(); // Your custom splash screen widget
            }

            // Once the future is resolved, decide which screen to show
            if (snapshot.data == '/home') {
              return const ShellPage(); // If the token is valid, go to the home screen
            } else {
              return const LoginPage(); // Otherwise, show the login page
            }
          },
        ),
        routes: {
          '/login': (context) => const LoginPage(),
          '/signUp': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/accounts': (context) => const AccountsPage(),
          '/personal_info': (context) => const PersonalInfoPage(),
          '/secure_notes': (context) => const SecureNotesPage(),
          '/documents': (context) => const DocumentsPage(),
          '/credit_card': (context) => const CreditCardPage(),
          '/add_creditCard': (context) => const AddCreditCardPage(),
          '/add_account': (context) => const AddAccountPage(),
          '/add_personalInfo': (context) => const AddPersonalInfoPage(),
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
