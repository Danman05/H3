import 'package:flutter/material.dart';

class ColumnPost extends StatefulWidget {

  final String title;
  const ColumnPost({ super.key, required this.title });

  @override
  State<ColumnPost> createState() => _ColumnPostState();
}

class _ColumnPostState extends State<ColumnPost> {



    final List<String> toDoItems = [
    "Task",
    "Another Task",
    "Complete Flutter project",
  ];
  final TextStyle _defTextStyle = const TextStyle(fontSize: 24, color: Colors.black, decoration: TextDecoration.none);

  @override
  Widget build(BuildContext context) {
return Container(
      padding: const EdgeInsets.all(8.0),
      child: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.title,
                  textAlign: TextAlign.center, style: _defTextStyle),
              Expanded(
                child: ListView.builder(
                  itemCount: toDoItems.length,
                  itemBuilder: (context, index) {
                    return Draggable(
                      feedback: Text(
                        '${widget.title}: ${toDoItems[index]}',
                        style: _defTextStyle,
                      ),
                      child: Row(
                        children: [
                          Container(
                              color: Colors.yellow,
                              width:
                                  8), // Provide some spacing between the icon and the text
                          Expanded(
                              child: Text(
                            toDoItems[index],
                            style: _defTextStyle,
                          )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
          
        },
        onAcceptWithDetails: (details) {
          print(details.data);
        },
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //      Text(widget.title, textAlign: TextAlign.center, style: _defTextStyle),
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: toDoItems.length,
        //         itemBuilder: (context, index) {
        //           return Draggable(
        //             feedback: Text('${widget.title}: ${toDoItems[index]}', style: _defTextStyle,),
        //             child: Row(
        //               children: [
        //                  Container(
        //                   color: Colors.yellow,
        //                     width:
        //                         8), // Provide some spacing between the icon and the text
        //                 Expanded(child: Text(toDoItems[index], style: _defTextStyle,)),
        //               ],
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}