import 'package:cyber_vault/pages/authenticator_page.dart';
import 'package:cyber_vault/pages/generator_page.dart';
import 'package:cyber_vault/pages/home_page.dart';
import 'package:cyber_vault/pages/settings_page.dart';
import 'package:cyber_vault/pages/vault_page.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.key_outlined),
            selectedIcon: Icon(Icons.key_rounded),
            label: 'Vault',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.lock_rounded),
            icon: Icon(Icons.lock_outline),
            label: 'Authenticator',
          ),
          NavigationDestination(
            icon: Icon(Icons.password),
            selectedIcon: Icon(Icons.password_outlined),
            label: 'Generate',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const VaultPage(),
        const AuthenticatorPage(),
        const GeneratorPage(),
        const SettingsPage()
      ][currentPageIndex],
    );
  }
}
