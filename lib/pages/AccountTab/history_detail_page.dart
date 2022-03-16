import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/components/CreateSession/mentorItemInvite.dart';
import 'package:twe/components/SearchCoffee/locationItem.dart';
import 'package:twe/models/meetup.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({
    Key? key,
    required this.historyId,
  }) : super(key: key);
  final String historyId;

  @override
  State<StatefulWidget> createState() => _HistoryDetailPage();
}

class _HistoryDetailPage extends State<HistoryDetailPage> {
  late SessionModel meeting;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryDetail();
  }

  getHistoryDetail() {
    ApiServices.getMeetingDetailByMeetingId(
            "12c9cd48-8cb7-4145-8fd9-323e20b329dd", widget.historyId)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    meeting = value;
                    isLoading = false;
                    print(meeting.isLead);
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          toolbarHeight: 65,
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thông tin chi tiết",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  // fontSize: 18,
                ),
              ),
            ],
          ),
          backgroundColor: MaterialColors.primary,
        ),
        body: isLoading
            ? Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: MaterialColors.primary,
                    )))
            : Container(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: CoffeeItem(
                            isButton: false,
                            coffee: COFFEE_DATA[2],
                            onPush: (i) {
                              // onCoffeeDetail(i);
                            },
                            onSubmit: (coffee) {},
                            isTabPage: false,
                            isStar: true,
                            heightImg: 130,
                            widthImg: 110)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              "Chuyên ngành",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //       bottom: BorderSide(
                              //           color: Colors.black12, width: 1.0)),
                              // ),
                              margin:
                                  EdgeInsets.only(top: 15, left: 15, right: 15),
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.school,
                                      size: 26,
                                      color: MaterialColors.primary,
                                    ),
                                  ),
                                  Text(
                                    meeting.majorName!,
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: Text(
                              "Môn học",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                              // decoration: const BoxDecoration(
                              //   border: Border(
                              //       bottom: BorderSide(
                              //           color: Colors.black12, width: 1.0)),
                              // ),
                              margin:
                                  EdgeInsets.only(top: 15, left: 15, right: 15),
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.subject,
                                      size: 26,
                                      color: MaterialColors.primary,
                                    ),
                                  ),
                                  Text(
                                    meeting.subject!,
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: Text(
                              "Thời gian",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black12, width: 1.0)),
                              ),
                              margin:
                                  EdgeInsets.only(top: 15, left: 15, right: 15),
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.timer,
                                      size: 26,
                                      color: MaterialColors.primary,
                                    ),
                                  ),
                                  Text(
                                    meeting.date! + ", ",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    getSlot(meeting.slot!),
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 15,
                              right: 15,
                            ),
                            child: Text(
                              "Mentor đã mời ",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // onMentorDetail(MENTOR_DATA[0].id);
                            },
                            child: MentorItemInvite(
                              mentorName: MENTOR_DATA[0].fullname!,
                              avatar: MENTOR_DATA[0].image!,
                              major: MAJOR_DATA[0].majorName,
                              isButtonCancel: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black12, width: 1.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text(
                                    "Tổng tiền",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 25),
                                      child: Text(
                                        "100.000 ₫",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "90 phút",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black45,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () => {
                                Navigator.of(context).pushNamed(
                                  '/feedback-history',
                                  arguments: widget.historyId,
                                )
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MaterialColors.primary,
                                textStyle: TextStyle(color: Colors.white),
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Đánh giá",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}
