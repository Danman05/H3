import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterapp2/camera.dart';
import 'package:flutterapp2/camera_singleton.dart';
import 'package:flutterapp2/gallery_widget.dart';


Future<void> main() async{

    // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  CameraSingleton().camera = firstCamera;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(
              title: "Home Page",
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'camera',
              builder: (BuildContext context, GoRouterState state) {
                return const CameraPage();
              },
            ),
            GoRoute(
              path: 'gallery',
              builder: (BuildContext context, GoRouterState state) {
                return const GalleryWidget();
              },
            ),
          ]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Web App',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              title: const Text('Camera'),
              onTap: () {
                context.go('/camera');
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                context.go('/gallery');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Picture App'),
      ),
    );
  }
}
