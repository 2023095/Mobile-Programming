import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/settings/settings_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final manager = SettingsManager();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: manager.appState,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(manager.currentThemeTitle),
                onTap: () async {
                  await _showThemeDialog();
                },
              ),
              ListTile(
                title: const Text('Language'),
                subtitle: Text(manager.currentLanguageTitle),
                onTap: () async {
                  await _showLanguageDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ThemeMode theme = ThemeMode.system;

  Future<ThemeMode?> _showThemeDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose theme'),
        content: SegmentedButton<ThemeMode>(
          segments: [
            ButtonSegment(value: ThemeMode.light, icon: const Icon(Icons.light_mode)),
            ButtonSegment(
              value: ThemeMode.system,
              icon: const Icon(Icons.smartphone),
            ),
            ButtonSegment(value: ThemeMode.dark, icon: const Icon(Icons.dark_mode)),
          ],
          selected: {manager.currentTheme},
          onSelectionChanged: (Set<ThemeMode> selection) {
            manager.setTheme(selection.first);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Future<void> _showLanguageDialog() async {
    final options = <Locale?>[null, ...manager.supportedLocales];

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose language'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((locale) {
              final title = _localeTitle(locale);
              final selected = manager.currentLocale == locale;
              return ListTile(
                title: Text(title),
                trailing: selected ? const Icon(Icons.check) : null,
                selected: selected,
                onTap: () {
                  manager.setLocale(locale);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  String _localeTitle(Locale? locale) {
    if (locale == null) {
      return 'System default';
    }

    switch (locale.languageCode) {
      case 'mn':
        return 'Монгол';
      case 'ru':
        return 'Русский';
      case 'en':
      default:
        return 'English';
    }
  }
}
