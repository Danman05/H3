import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer'),
            ),
            ListTile(
              title: const Text('Stateful'),
              onTap: () {
                context.go('/stateful');
              },
            ),
            ListTile(
              title: const Text('Provider'),
              onTap: () {
                context.go('/provider');
              },
            ),
            ListTile(
              title: const Text('Bloc'),
              onTap: () {
                context.go('/bloc');
              },
            ),
            ListTile(
              title: const Text('Future'),
              onTap: () {
                context.go('/future');
              },
            ),
            ListTile(
              title: const Text('Stream'),
              onTap: () {
                context.go('/stream');
              },
            ),
          ],
        ),
      ),
      body:  const Center(
        child: Text('Welcome to my app'),
      ),
    );
  }
}
