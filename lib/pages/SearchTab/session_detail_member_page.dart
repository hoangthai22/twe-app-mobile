import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/listMember.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/models/mentor.dart';

class SessionMemberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SessionMemberPage();
}

class _SessionMemberPage extends State<SessionMemberPage> {
  @override
  Widget build(BuildContext context) {
    return ListMember();
  }
}
