import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/listMember.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/models/mentor.dart';

class SessionMemberPage extends StatefulWidget {
  String id;
  String sessionId;
  SessionMemberPage({required this.sessionId, required this.id});
  @override
  State<StatefulWidget> createState() => _SessionMemberPage();
}

class _SessionMemberPage extends State<SessionMemberPage> {
  late SessionModel sessions;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    ApiServices.getMeetingDetailByMeetingId(widget.id, widget.sessionId)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    sessions = value;
                    isLoading = false;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? ListMember(
            members: sessions.listMember!,
          )
        : Center(child: CircularProgressIndicator());
  }
}
