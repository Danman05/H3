import 'package:flutter/material.dart';
import 'package:scrumboard/screens/column_post.dart';

class LandscapeLayout extends StatefulWidget {
  const LandscapeLayout({super.key});

  @override
  State<LandscapeLayout> createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            // Column 1
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const ColumnPost(title: "TO DO",),
              ),
            ),
          ),
          Expanded(
            // Column 2
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const ColumnPost(title: "IN PROGRESS")
              ),
            ),
          ),
          Expanded(
            // Column 3
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const ColumnPost(title: "IN REVIEW")
              ),
            ),
          ),
          Expanded(
            // Column 4
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[350],
                child: const ColumnPost(title: "DONE")
              ),
            ),
          ),
        ],
      ),
    );
  }
}
