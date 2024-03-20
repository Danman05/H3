// A widget that displays the picture taken by the user.
import 'dart:convert';
import 'package:flutterapp2/StashedFiles/image_droptarget.dart';
import 'package:flutterapp2/models/photo.dart';
import 'package:flutterapp2/service/photo_api.dart';
import 'package:flutter/material.dart';
class GalleryScreen extends StatefulWidget {
    const GalleryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GalleryScreenState();
  
}
class _GalleryScreenState extends State<GalleryScreen> {
  String acceptedData = "";
  final PhotoService _apiService = PhotoService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Picture Gallary'),
        ),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
       body: FutureBuilder<List<Photo>>(
          future: _apiService.getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final images = snapshot.data!.toList();
              if (images.isEmpty) {
                return const Center(child: Text('No Photos'));
              }
return Column(
              mainAxisAlignment: MainAxisAlignment
                  .end, // Aligns the row of images at the bottom
              children: [
            
                Row(                
                  children: List<Widget>.generate(images.length, (index) {
                    return ImageDroptarget();
                  }),
                ),
                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enables horizontal scrolling
                  child: Row( 
                    children: List<Widget>.generate(
                      images.length,
                      (index) {
                        final String base64Image = images[index].base64;
                        return LongPressDraggable(
                          data: base64Image,
                          feedback: SizedBox( // Feedback is the currently dragged element
                            width: 150,
                            height: 150,
                            child: 
                            Image.memory(base64Decode(base64Image)),
                          ),
                          // padding: const EdgeInsets.all(4.0),
                          child: Image.memory(
                            base64Decode(base64Image),
                            height: 100, // Image height
                            width: 100, // Image width
                          ), 
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
            } else if (snapshot.hasError) { // Error
              return Center(child: Text('Error: ${snapshot.error}'));
            } else { // Loading indicator
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
  }
}
