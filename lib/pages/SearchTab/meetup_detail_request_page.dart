import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/listMember.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/models/mentor.dart';

class SessionMemberRequestPage extends StatefulWidget {
  String meetingId;
  SessionMemberRequestPage({required this.meetingId});
  @override
  State<StatefulWidget> createState() => _SessionMemberRequestPage();
}

class _SessionMemberRequestPage extends State<SessionMemberRequestPage> {
  @override
  Widget build(BuildContext context) {
    return ListMemberRequest(meetingId: widget.meetingId,);
  }
}
