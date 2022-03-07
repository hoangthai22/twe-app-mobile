import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/widget_span.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/mentorItemInvite.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';

class SessionDetailPage extends StatelessWidget {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Chuyên ngành',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.school,
                            size: 22,
                            color: MaterialColors.primary,
                          ),
                          margin: EdgeInsets.only(
                            right: 5,
                          ),
                        ),
                        Title(
                            color: Colors.black,
                            child: Text(
                              'Kĩ thuật phần mềm',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Môn học',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.subject,
                            size: 22,
                            color: MaterialColors.primary,
                          ),
                          margin: EdgeInsets.only(
                            right: 5,
                          ),
                        ),
                        Title(
                            color: Colors.black,
                            child: Text(
                              'Java',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Giá tiền',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.attach_money_outlined,
                            size: 22,
                            color: MaterialColors.primary,
                          ),
                        ),
                        Title(
                            color: Colors.black,
                            child: Text(
                              '500,000 VND / buổi học',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(bottom: 10),
                //       child: Text(
                //         'Thành viên',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontFamily: "Roboto",
                //           fontWeight: FontWeight.w700,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           child: Icon(
                //             Icons.group,
                //             size: 22,
                //             color: MaterialColors.primary,
                //           ),
                //           margin: EdgeInsets.only(
                //             right: 5,
                //           ),
                //         ),
                //         Title(
                //             color: Colors.black,
                //             child: Text(
                //               '3/5',
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontFamily: "Roboto",
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.black,
                //               ),
                //             )),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5, bottom: 2),
                              child: Icon(
                                Icons.calendar_month,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  '2022-02-02',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 5, bottom: 2),
                              child: Icon(
                                Icons.schedule,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  '07:00 - 08:30',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Trạng thái',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5, bottom: 2),
                              child: Icon(
                                Icons.wb_incandescent_outlined,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  'Đang chờ Mentor xác nhận',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
        if (status) ...[
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Giảng viên đã mời',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),

            height: 120,
            // width: 120,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [MENTOR_DATA[0], MENTOR_DATA[1]]
                  .map(
                    (mentor) => Container(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              // padding: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                            radius: 40, // Image radius
                            backgroundImage: NetworkImage(mentor.image!),
                          )),
                          Container(
                            alignment: Alignment.center,
                            // width: 150,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              mentor.fullname!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto"),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
        if (!status) ...[
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Giảng viên',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: InkWell(
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
          ),
        ],
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1.0)),
          ),
        ),
        CoffeeItem(
            coffee: COFFEE_DATA[0],
            onPush: (e) {},
            isTabPage: false,
            onSubmit: (e) {},
            isStar: true,
            heightImg: 130,
            widthImg: 120,
            isButton: false),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: Text(
              "Yêu cầu tham gia",
              style: TextStyle(fontFamily: "Roboto", fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              primary: MaterialColors.primary,
              textStyle: TextStyle(color: Colors.white),
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => {},
          ),
        )
      ]),
    ));
  }
}
