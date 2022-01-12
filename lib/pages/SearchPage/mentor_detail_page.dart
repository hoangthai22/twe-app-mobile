import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';

class _MentorDetailPage extends State<MentorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.mentorId}',
          ),
        ),
        body: Container(
          child: InkWell(
            onTap: () {
              widget.onPush(widget.mentorId);
            },
            child: Text("Detail"),
          ),
        ));
  }
}

class MentorDetailPage extends StatefulWidget {
  final int mentorId;
  final int materialIndex;
  final ValueChanged<int> onPush;

  const MentorDetailPage(
      {required this.mentorId, required this.materialIndex, required this.onPush});

  @override
  _MentorDetailPage createState() => _MentorDetailPage();
}
