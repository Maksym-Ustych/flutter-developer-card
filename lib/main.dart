import 'package:flutter/material.dart';
import 'contact_card.dart';

void main() {
  runApp(const DeveloperCardApp());
}

class DeveloperCardApp extends StatefulWidget {
  const DeveloperCardApp({super.key});

  @override
  State<DeveloperCardApp> createState() => _DeveloperCardAppState();
}

class _DeveloperCardAppState extends State<DeveloperCardApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Візитівка розробника',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: DeveloperCardScreen(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class DeveloperCardScreen extends StatelessWidget {
  const DeveloperCardScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Візитівка розробника'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Максим Устич',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Software Engineering Student',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 28),
              const ContactCard(
                icon: Icons.email,
                text: 'maksym@example.com',
              ),
              const ContactCard(
                icon: Icons.phone,
                text: '+380 XX XXX XX XX',
              ),
              const ContactCard(
                icon: Icons.location_on,
                text: 'Україна',
              ),
              const ContactCard(
                icon: Icons.code,
                text: 'Flutter / Dart',
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onThemeChanged,
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                label: Text(
                  isDarkMode ? 'Світла тема' : 'Темна тема',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}