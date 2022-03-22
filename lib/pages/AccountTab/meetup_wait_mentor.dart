import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
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
    fetch();
  }

  fetch() {
    setState(() {
      isLoadingCircle = true;
    });
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
                      function: (v) {
                        fetch();
                      },
                      isCancelBtn: true,
                      status: 0,
                      isStatus: true,
                      sessionModel: meetup,
                    ))
                .toList()
          else ...[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 130,
              child: Container(
                  margin: EdgeInsets.only(top: 100, left: 30, right: 30),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Hãy tìm cho mình một Mentor phù hợp và gửi lời mới tới họ nhé!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        color: Colors.black54,
                        fontWeight: FontWeight.w400),
                  )),
            )
          ]
        ]),
      ),
    );
  }
}
