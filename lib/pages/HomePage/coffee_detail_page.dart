import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Feedback/feedback.dart';
import 'package:twe/components/CreateSession/bottomNav.dart';
import 'package:twe/components/SearchMentor/scheduleModal.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class _CoffeeDetailPage extends State<CoffeeDetailPage> {
  late CoffeeModel coffee;
  late String skill;
  String slot = "";
  String date = "";

  @override
  void initState() {
    super.initState();
    skill = "";
    coffee = COFFEE_DATA[2];
  }

  void onSubmit(context) {
    return _ModalBottom(context);
  }

  void onRedirect(context) {}

  void _ModalBottom(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ScheduleModal(
              onGetSlot: (i) => setState(() {
                    slot = SLOT[i];
                  }),
              onGetDate: (d) => {
                    setState(() {
                      String YYYY_MM_DD = d.toIso8601String().split('T').first;
                      date = YYYY_MM_DD;
                    }),
                  });
        });
  }

  @override
  Widget build(BuildContext context) {
    var listRate = [for (var i = 1; i <= coffee.rate; i++) i];

    return Scaffold(
        // appBar: AppBar(
        //   leading: BackButton(color: Colors.black),
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     'Coffee',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 17,
        //       fontFamily: 'Roboto',
        //     ),
        //   ),
        // ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Stack(
                children: <Widget>[
                  ClipRRect(
                      child: Image(
                    // color:70olors.red,
                    height: 250,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://gongcha.com.vn/wp-content/uploads/2018/03/Banner-Trang-Ch%E1%BB%A7-k%E1%BA%BF-%C4%91%E1%BB%8Ba-ch%E1%BB%89-CH-800x380-01.jpg"),
                  )),
                  Positioned(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white38,
                      ),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            size: 24,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    top: 15,
                    left: 15,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                child: Text(
                  coffee.coffeeName,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                child: Row(
                  children: listRate
                      .map(
                        (e) => Icon(
                          Icons.star,
                          size: 21,
                          color: Colors.amber,
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.timer,
                        size: 21,
                        color: Color(0xff107163),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "7:00 - 22:00",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff107163),
                      size: 21,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 - 65,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "${coffee.address}",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.attach_money,
                          size: 21,
                          color: Color(0xff107163),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "25.000 ₫ - 100.000 ₫",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 15,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.phone,
                          size: 20,
                          color: Color(0xff107163),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "09834812992",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 15, right: 15),
                child: Text(
                  "Nhận xét (2)",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 300,
                margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: <Widget>[
                    FeedBack(
                      avatar: coffee.avatar,
                      userId: 1,
                      userName: "Hoang Thai Hoang Thai Hoang Thai ",
                      feedbackContent: coffee.description,
                      time: "22:20, 11 thg 1, 2022",
                    ),
                    FeedBack(
                      avatar: coffee.avatar,
                      userId: 1,
                      userName: "Hoang Thai",
                      feedbackContent:
                          (coffee.description + coffee.description),
                      time: "22:20, 11 thg 1, 2022",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // Consumer<AppProvider>(builder: (context, provider, child) {
        //   return Container(
        //     color: Colors.white,
        //     child: Text("ID: ${widget.coffeeId} \n MentorId: ${provider.booking.mentorId} \n date: ${provider.booking.date} \n slot: ${provider.booking.slot}"),
        //   );
        // }),
        bottomNavigationBar: BottomNavMentorDetail(
            checkInvited: false,
            title: "Tiếp tục",
            onRedirect: () => widget.onPush()));
  }
}

class CoffeeDetailPage extends StatefulWidget {
  final int coffeeId;

  final onPush;

  CoffeeDetailPage({required this.coffeeId, required this.onPush});

  @override
  _CoffeeDetailPage createState() => _CoffeeDetailPage();
}
