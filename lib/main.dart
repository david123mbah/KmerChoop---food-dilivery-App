import 'package:flutter/material.dart';
import 'package:musicapp/auth/login_or_Register.dart';
import 'package:musicapp/themes/theme_provider.dart';
import 'package:musicapp/utils/restuarant.dart';
import 'package:provider/provider.dart';





void main() {
  runApp( 
    MultiProvider(
      providers: [
  ChangeNotifierProvider( 
    create:  (context) =>  ThemeProvider()),

    // RESTAURANT PROVIDER
    ChangeNotifierProvider( 
    create:  (context) =>  Restaurant()),

    ],
     child: const MyApp(),
    ),
   
     );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
