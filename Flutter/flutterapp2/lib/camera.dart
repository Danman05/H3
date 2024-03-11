import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/camera_singleton.dart';
import 'package:flutterapp2/classes/photo_provider.dart';

/// Stateful widget class
class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<StatefulWidget> createState() {
    return _CameraPageState();
  }
}

/// Companion state class
class _CameraPageState extends State<CameraPage> {

  final _storage = const FlutterSecureStorage();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      CameraSingleton().camera!,
      // Define the resolution to use.
      ResolutionPreset.medium,
    
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Camera Page"),
        ),
        body: Center(
          child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator.
                return const Column(
                  children: <Widget> [
                    Text("Loading Camera"),
                    CircularProgressIndicator(),
                  ],
                );
              }
            }
          ),
        ),
        floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            final bytes = await File(image.path).readAsBytes();
            
            final String base64 = base64Encode(bytes);
            print(image.name);
            await _storage.write(key: image.name, value: base64);
            String? data = await _storage.read(key: image.name);
            print(data);
            // Image.memory(base64Decode(base64));
            // print(base64);
            // print(base64Decode(base64));
            // final file = File();
            if (!context.mounted) return;

            // Update the PhotoProvider with the new image path
            // Provider.of<PhotoProvider>(context, listen: false).addToList(image.path);
            // print("added ${image.path}");
            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      );
  }
}
// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      
      body: 
        Image.file(File(imagePath),
      )
    );
  }
}
