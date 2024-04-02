import 'package:flutter/material.dart';

class PortraitLayout extends StatefulWidget {
  const PortraitLayout({ super.key });

  @override
  State<PortraitLayout> createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
      Expanded(  // Column 1
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    Expanded(child: Text("TO DO", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none)))
                  ],
                ),
              ),
            ),
          ),
      Expanded(
            // Column 1
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Text("IN PROGRESS ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none)))
                  ],
                ),
              ),
            ),
          ),
      
          Expanded(
            // Column 1
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Text("IN REVIEW",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none)))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // Column 1
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Text("DONE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none))
                    ),
      
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}