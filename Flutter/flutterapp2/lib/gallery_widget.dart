import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/blocs/photo_bloc.dart';
import 'package:flutterapp2/blocs/photo_event.dart';
import 'package:flutterapp2/blocs/photo_state.dart';
import 'package:flutterapp2/models/photo.dart';
import 'package:flutterapp2/image_grid.dart';
import 'package:flutterapp2/service/photo_api.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});
  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final PhotoService _apiService = PhotoService();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


  final PhotoBloc photoBloc = BlocProvider.of<PhotoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Column(
        children: [
          // Use FutureBuilder to wait for the images to be fetched
          Expanded(
            child: FutureBuilder<List<Photo>>(
              future: _apiService.getAll(),
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
            child: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                switch (state.currentState) {
                  case PhotoStates.initial:
                    return Center(
                      child: ElevatedButton(
                        onPressed: () async {
                           photoBloc.add(GetAllPhotoEvent());
                        },
                        child: const Text('Click to load photos'),
                      ),
                    );
                  case PhotoStates.complete:       
                    return ListView.builder(
                      scrollDirection:  Axis.horizontal,
                      itemCount: state.photos!.length,
                      itemBuilder: (context, index) {
                        return LongPressDraggable<String>(
                          data: state.photos![index].base64,
                          feedback: Material(
                            child: Image.memory(
                              base64Decode(state.photos![index].base64),
                            width: 100,
                            height: 100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.memory(
                              base64Decode(state.photos![index].base64)),
                          ),
                        );
                      },
                    );
                  case PhotoStates.error:
                    return const Center(
                      child: Text('error loading photos..'),
                    );
                  default:
                    return const Center(
                      child: Text('what..'),
                    ); 
                }
              },
            ),
            
            
            // <List<Photo>>(
            //   future: _apiService.getAll(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done &&
            //         snapshot.hasData) {
            //       return ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: snapshot.data!.length,
            //         itemBuilder: (context, index) {
            //           return LongPressDraggable<String>(
            //             data: snapshot.data![index].base64,
            //             feedback: Material(
            //               child: Image.memory(
            //                   base64Decode(snapshot.data![index].base64),
            //                   width: 100,
            //                   height: 100),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child:
            //                   Image.memory(base64Decode(snapshot.data![index].base64)),
            //             ),
            //           );
            //         },
            //       );
            //     } else {
            //       // Show a placeholder or empty container when data is not yet available
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
