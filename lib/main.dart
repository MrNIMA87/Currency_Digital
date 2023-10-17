import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/CryptoModel/CryptoData.dart';
import 'package:flutter_application_1/UI/Home_Page.dart';
import 'package:flutter_application_1/UI/Most_purchased.dart';
import 'package:flutter_application_1/UI/Panel_Login.dart';
import 'package:flutter_application_1/UI/Panel_Register.dart';
import 'package:flutter_application_1/provider/Crypto.dart';
import 'package:flutter_application_1/provider/MarketViewProvider.dart';
import 'package:flutter_application_1/provider/Theme_Provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => CryptoDataProvider()),
      ChangeNotifierProvider(create: (context) => MarketViewProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    });
  }
}
