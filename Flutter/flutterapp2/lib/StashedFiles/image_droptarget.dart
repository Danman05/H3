import 'dart:convert';

import 'package:flutter/material.dart';

class ImageDroptarget extends StatefulWidget {
   ImageDroptarget({ super.key });

  late String base64String;

  @override
  State<StatefulWidget> createState() => _ImageDroptargetState();
}

class _ImageDroptargetState extends State<ImageDroptarget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.greenAccent,
      child: DragTarget(
      builder: (context, candidateData, rejectedData) {

        return Draggable(
          data: "123",
          feedback: SizedBox(
            width: 300,
            height: 300,
            child: Image.memory(base64Decode("acceptedData")),
          ),
          child: Image.memory(base64Decode("acceptedData")),
        );   
      },
        onAcceptWithDetails: (DragTargetDetails<String> image) {

      }),
    );
  }
}