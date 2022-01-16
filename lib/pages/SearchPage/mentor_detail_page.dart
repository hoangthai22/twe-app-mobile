
import 'package:flutter/material.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Feedback/feedback.dart';
import 'package:twe/components/Search/bottomNav.dart';
import 'package:twe/components/Search/scheduleModal.dart';
import 'package:twe/models/mentor.dart';

class _MentorDetailPage extends State<MentorDetailPage> {
  late MentorModel mentor;
  late String skill;

  @override
  void initState() {
    super.initState();
    skill = "";
    mentor = MENTOR_DATA[2];
    for (var element in mentor.skill) {
      if (skill != "") {
        skill = "$skill, $element";
      } else {
        skill = element;
      }
    }
  }

  void onSubmit(context) {
    return _ModalBottom(context);
  }

  void onRedirect(context) {
    widget.onPush(widget.mentorId);
  }

  void _ModalBottom(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ScheduleModal(
              onGetSlot: (slot) => setState(() {
                    print("slot $slot");
                  }),
              onGetDate: (date) => {
                    setState(() {
                      print("date $date");
                    }),
                  });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'Hồ sơ',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        body: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
              children: [
                Container(
                    decoration: BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      radius: 60, // Image radius
                      backgroundImage: NetworkImage(mentor.avatar),
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      mentor.mentorName,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.0,
                      ),
                    ),
                    Text(
                      mentor.rate.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5, left: 20),
                      child: const Icon(
                        Icons.price_change_outlined,
                        color: Colors.green,
                        size: 20.0,
                      ),
                    ),
                    Container(
                        child: Text(
                      "~300.000/buổi",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black12, width: 1.0)),
                    ),
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      mentor.description,
                      style: TextStyle(fontSize: 14),
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Thông tin về tôi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: const Icon(
                          Icons.schedule,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              Text(
                                "Ngày sinh",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  "20-1-1990",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              Text(
                                "Số điện thoại",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  "0353278303",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.language,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              const Text(
                                "Ngôn ngữ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: const Text(
                                  "Tiếng Việt",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.subject,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              const Text(
                                "Chuyên ngành",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: const Text(
                                  "Kỹ thuật phần mềm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.subject,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              const Text(
                                "Kỹ năng",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1.0)),
                  ),
                  padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.cast_for_education,
                          color: Colors.green,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              const Text(
                                "Kinh nghiệm làm việc",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  mentor.description,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Text(
                    "Nhận xét của học sinh",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Container(
                  height: 200,
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      FeedBack(
                        avatar: mentor.avatar,
                        userId: 1,
                        userName: "Hoang Thai",
                        feedbackContent: mentor.description,
                        time: "22:20, 11 thg 1, 2022",
                      ),
                      FeedBack(
                        avatar: mentor.avatar,
                        userId: 1,
                        userName: "Hoang Thai",
                        feedbackContent: mentor.description,
                        time: "22:20, 11 thg 1, 2022",
                      )
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar: BottomNavMentorDetail(
            function: () => onSubmit(context),
            onRedirect: () => onRedirect(context)));
  }
}

class MentorDetailPage extends StatefulWidget {
  final int mentorId;
  final int materialIndex;
  final ValueChanged<int> onPush;

  const MentorDetailPage(
      {required this.mentorId,
      required this.materialIndex,
      required this.onPush});

  @override
  _MentorDetailPage createState() => _MentorDetailPage();
}
