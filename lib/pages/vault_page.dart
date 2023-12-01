import 'package:flutter/material.dart';

class VaultPage extends StatelessWidget {
  const VaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/accounts');
            },
            leading: const Icon(Icons.vpn_key, size: 25),
            title: const Text('Accounts'),
            subtitle: const Text('Manage your login accounts.'),
            trailing: const Icon(Icons.chevron_right),
            isThreeLine: false,
          )),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/credit_card');
              },
              leading:
                  const Icon(Icons.credit_card, size: 25), // Credit Card Icon
              title: const Text('Credit Cards'),
              subtitle: const Text('Manage your credit card information.'),
              trailing: const Icon(Icons.chevron_right),
              isThreeLine: false,
            ),
          ),
          // Card(
          //   child: ListTile(
          //     onTap: () {
          //       Navigator.pushNamed(context, '/documents');
          //     },
          //     leading: const Icon(Icons.description, size: 25), // Document Icon
          //     title: const Text('Documents'),
          //     subtitle: const Text('Access and organize your documents.'),
          //     trailing: const Icon(Icons.chevron_right),
          //     isThreeLine: false,
          //   ),
          // ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/secure_notes');
              },
              leading: const Icon(Icons.lock, size: 25), // Secure Note Icon
              title: const Text('Secure Notes'),
              subtitle: const Text('Store your confidential notes securely.'),
              trailing: const Icon(Icons.chevron_right),
              isThreeLine: false,
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/personal_info');
              },
              leading: const Icon(Icons.person, size: 25), // Personal Info Icon
              title: const Text('Personal Info'),
              subtitle: const Text('Manage your personal information.'),
              trailing: const Icon(Icons.chevron_right),
              isThreeLine: false,
            ),
          ),
        ]));
  }
}
