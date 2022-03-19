import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/models/meetup.dart';

import '../../common/constants.dart';
import 'meetup_cancel.dart';
import 'meetup_done.dart';
import 'meetup_going.dart';
import 'meetup_manager.dart';
import '../../components/Setting/my_meetup_item.dart';
import 'meetup_wait_mentor.dart';

class MySessionPage extends StatefulWidget {
  const MySessionPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySessionPage();
  }
}

class _MySessionPage extends State<MySessionPage>
    with AutomaticKeepAliveClientMixin<MySessionPage> {
  @override
  bool get wantKeepAlive => true;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<SessionModel> listMeetup = [];
  bool isLoadingCircle = true;

  @override
  void initState() {
    super.initState();
    var id = auth.currentUser!.uid;
    ApiServices.getListAllMyMeetup(id, 1, 10).then((value) => {
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
      child: Skeleton(
        isLoading: isLoadingCircle,
        skeleton: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: [1, 2, 3]
                    .map(
                      (e) => Container(
                          margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: SkeletonItem(
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                borderRadius: BorderRadius.circular(10),
                                width: double.infinity,
                                minHeight:
                                    MediaQuery.of(context).size.height / 8,
                                maxHeight:
                                    MediaQuery.of(context).size.height / 3,
                              ),
                            ),
                          )),
                    )
                    .toList())),
        child: ListView(children: [
          if (listMeetup.length > 0)
            ...listMeetup
                .map((meetup) => MyMeetupitem(
                      isStatus: true,
                      sessionModel: meetup,
                    ))
                .toList()
        ]),
      ),
    );
  }
}
