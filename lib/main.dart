import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicapp/firebase_options.dart';
import 'package:musicapp/services/auth/login_or_Register.dart';
import 'package:musicapp/themes/theme_provider.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load();

  // Initialize Firebase with error handling
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Firebase initialized successfully
    debugPrint("Firebase initialized successfully.");
  } catch (e) {
    // Error initializing Firebase
    debugPrint("Error initializing Firebase: $e");
  }

  // Run the app
  runApp(
    MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        // Restaurant provider
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      home: const LoginOrRegister(),
    );
  }
}
