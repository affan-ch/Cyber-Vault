// import 'package:cyber_vault/widgets/app_bar.dart';
import 'package:cyber_vault/widgets/navigation_bar.dart';

import 'package:flutter/material.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: null,
        // appBar: AppBarWidget(),
        body: NavigationExample());
  }
}
