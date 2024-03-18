import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp2/image_grid.dart';
import 'package:flutterapp2/service/photo_api.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});
  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          // Use FutureBuilder to wait for the images to be fetched
          Expanded(
            child: FutureBuilder<List<String>>(
              future: _apiService.getAllImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Check for errors
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  // Once data is fetched, pass it to the ImageGrid
                  return ImageGrid(images: snapshot.data ?? []);
                } else {
                  // Show a loading spinner while fetching data
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // The draggable images list remains unchanged
          SizedBox(
            height: 120,
            child: FutureBuilder<List<String>>(
              future: _apiService.getAllImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return LongPressDraggable<String>(
                        data: snapshot.data![index],
                        feedback: Material(
                          child: Image.memory(
                              base64Decode(snapshot.data![index]),
                              width: 100,
                              height: 100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.memory(base64Decode(snapshot.data![index])),
                        ),
                      );
                    },
                  );
                } else {
                  // Show a placeholder or empty container when data is not yet available
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
