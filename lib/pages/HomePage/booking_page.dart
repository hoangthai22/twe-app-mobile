import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/provider/appProvider.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coffee = COFFEE_DATA[1];
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          toolbarHeight: 65,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Step 4 of 4",
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "Roboto",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                "Xác nhận thông tin ",
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
        body: Consumer<AppProvider>(builder: (context, provider, child) {
          return Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CoffeeItem(
                        coffee: provider.getBookingCoffee,
                        onPush: (i) {},
                        onSubmit: (coffee) {},
                        isButton: false)),
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
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                provider.getBookingMajor,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
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
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                provider.getBookingSubject,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
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
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                provider.getBookingDate + ", ",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                              Text(
                                SLOT[provider.getBookingSlot],
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
                          "Danh sách giảng viên đã mời ",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        height: 120,
                        // width: 120,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: provider.getListMentorInvite
                              .map(
                                (mentor) => Container(
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          // padding: const EdgeInsets.only(right: 15),
                                          child: CircleAvatar(
                                        radius: 40, // Image radius
                                        backgroundImage:
                                            NetworkImage(mentor.avatar),
                                      )),
                                      Container(
                                        alignment: Alignment.center,
                                        // width: 150,
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          mentor.mentorName,
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
                      Container(
                        margin:
                            EdgeInsets.only(right: 15, left: 15, bottom: 15),
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: MaterialColors.primary,
                          textStyle: TextStyle(color: Colors.white),
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          "Xác nhận",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
