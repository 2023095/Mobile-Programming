import 'package:flutter/material.dart';
import 'package:flutter_demo/l10n/app_localizations.dart';

class LocalizationDemo extends StatefulWidget {
  const LocalizationDemo({super.key});

  @override
  State<LocalizationDemo> createState() => _LocalizationDemoState();
}

class _LocalizationDemoState extends State<LocalizationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        AppLocalizations.of(context)!.helloWorld,
        style: TextStyle(fontSize: 30))),
    );
  }
}
