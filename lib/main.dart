import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refcoins_app/core/theme.dart';
import 'package:refcoins_app/providers/character_provider.dart';
import 'package:refcoins_app/views/email_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterProvider(),
      child: MaterialApp(
        theme: appTheme,
        home: const EmailPage(),
      ),
    );
  }
}
