import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/components/Setting/my_meetup_item.dart';
import 'package:twe/models/meetup.dart';

import '../../common/constants.dart';

class MySessionPageWaiteMentor extends StatefulWidget {
  const MySessionPageWaiteMentor({Key? key}) : super(key: key);

  @override
  State<MySessionPageWaiteMentor> createState() => _MySessionPageWaiteMentor();
}

class _MySessionPageWaiteMentor extends State<MySessionPageWaiteMentor>
    with AutomaticKeepAliveClientMixin<MySessionPageWaiteMentor> {
  @override
  bool get wantKeepAlive => true;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<SessionModel> listMeetup = [];
  bool isLoadingCircle = true;
  @override
  void initState() {
    super.initState();
    var id = auth.currentUser!.uid;
    ApiServices.getListAllMyMeetupByStatus(id, 0, 1, 10).then((value) => {
          if (value != null)
            {
              setState(() {
                listMeetup = value;
                isLoadingCircle = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        if (isLoadingCircle)
          ...[]
        else
          ...listMeetup
              .map((meetup) => MyMeetupitem(
                    isStatus: false,
                    sessionModel: meetup,
                  ))
              .toList()
      ]),
    );
  }
}
