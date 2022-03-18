import 'package:flutter/material.dart';

import '../../common/constants.dart';
import 'meetup_cancel.dart';
import 'meetup_done.dart';
import 'meetup_going.dart';
import 'meetup_manager.dart';
import 'meetup_wait_location.dart';
import 'meetup_wait_mentor.dart';

class MySessionPage extends StatelessWidget {
  const MySessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        //MySessionPage(),
        MySessionPageWaiteLocation(),
        MySessionPageWaiteLocation(),
        // MySessionPageWaiteMentor(),
        // MySessionPageGoing(),
        // MySessionPageDone(),
        // MySessionPageCancel(),
      ]),
    );
  }
}
