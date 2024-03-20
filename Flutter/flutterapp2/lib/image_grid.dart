import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp2/models/photo.dart';

class ImageGrid extends StatefulWidget {
  final List<Photo>? images;

  const ImageGrid({super.key, required this.images});
  @override
  State<StatefulWidget> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final List<String> _droppedImages = [];
  Map<int, String> droppedImages = {}; // Maps grid index to base64 image string

  @override
  Widget build(BuildContext context) {
    // print("wow ${widget.images?.length}" );
    // print(_droppedImages.length);
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: _droppedImages.isEmpty ? 1 : _droppedImages.length,
      itemBuilder: (context, index) {
        return DragTarget(
          onAcceptWithDetails: (DragTargetDetails<String> image) {
            setState(() {
              _droppedImages.add(image.data);
            });
          },
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return accepted.isNotEmpty
                ? Image.memory(base64Decode(accepted.first))
                : _droppedImages.isNotEmpty
                    ? LongPressDraggable(
                        data: _droppedImages[index],
                        feedback:
                            Image.memory(base64Decode(_droppedImages[index])),
                        child:
                            Image.memory(base64Decode(_droppedImages[index])))
                    // Image.memory(base64Decode(_droppedImages[index]))
                    : Container(color: Colors.grey[200]);
          },
        );
      },
    );
  }
}
