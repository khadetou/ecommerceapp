import 'package:ecommerceapp/provider/dart_theme_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "./screen/bottom_bar.dart";
import "./Colors/theme_data.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Ecommerce App",
            theme: Styles.themeData(
              themeChangeProvider.darkTheme,
              context,
            ),
            home: const BottomBarScreen(),
          );
        },
      ),
    );
  }
}
