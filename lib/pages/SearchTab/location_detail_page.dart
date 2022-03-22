import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Feedback/feedback.dart';
import 'package:twe/components/CreateSession/bottomNav.dart';
import 'package:twe/components/SearchMentor/scheduleModal.dart';
import 'package:twe/models/location.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

class _CoffeeDetailPage extends State<CoffeeDetailPage> {
  late CoffeeModel coffee;
  late String skill;
  late bool isLoading = true;
  late List listRate = [];
  List<int> listRateEmpty = [];
  String slot = "";
  String date = "";

  @override
  void initState() {
    super.initState();
    skill = "";
    coffee = COFFEE_DATA[0];
    getLocationDetailById();
  }

  getLocationDetailById() {
    ApiServices.getDetailLocationById(widget.coffeeId.toString())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    coffee = value;
                    listRate = [for (var i = 1; i <= coffee.rate!; i++) i];
                    listRateEmpty = [
                      for (var i = 1; i <= 5 - coffee.rate!; i++) i
                    ];
                    isLoading = false;
                  })
                }
            });
  }

  void onSubmit(context) {
    return _ModalBottom(context);
  }

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
    // print(widget.isCoffeeTab);
    // listRate = [for (var i = 1; i <= coffee.rate!; i++) i];
    return Scaffold(
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
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              child: Image(
                            // color:70olors.red,
                            // height: 250,
                            fit: BoxFit.cover,
                            image: NetworkImage(coffee.image!),
                          )),
                        ),
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
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: Text(
                        coffee.name!,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 5),
                      child: Text(
                        coffee.description!,
                        style: TextStyle(
                            color: MaterialColors.muted,
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
                      child: Row(children: [
                        if (listRate.length > 0)
                          ...listRate
                              .map(
                                (e) => Icon(
                                  Icons.star,
                                  size: 21,
                                  color: Colors.amber,
                                ),
                              )
                              .toList(),
                        if (listRateEmpty.length > 0)
                          ...listRateEmpty.map((e) {
                            return Icon(
                              Icons.star_border,
                              size: 22,
                              color: Colors.amber,
                            );
                          }).toList(),
                      ]),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
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
                              "${coffee.openTime} - ${coffee.closeTime}",
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
                      padding:
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
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
                              "${coffee.street}, ${coffee.distric}, TP HCM",
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
                                "20.000 - 100.000",
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
                          top: 10,
                          bottom: 15,
                          right: 15,
                          left: 15,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 1.0)),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(bottom: 5, left: 18, top: 15),
                          child: Text(
                            "Đánh giá",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black12, width: 1)),
                          ),
                          padding:
                              EdgeInsets.only(bottom: 10, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (listRate.length > 0)
                                ...listRate.map((e) {
                                  return Icon(
                                    Icons.star,
                                    size: 22,
                                    color: Colors.amber,
                                  );
                                }).toList(),
                              if (listRateEmpty.length > 0)
                                ...listRateEmpty.map((e) {
                                  return Icon(
                                    Icons.star_border,
                                    size: 22,
                                    color: Colors.amber,
                                  );
                                }).toList(),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 5),
                                child: Text(
                                  "${listRate.length}/5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: MaterialColors.primary,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              Text(
                                " (${5} đánh giá)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.amber,
                      width: 300,
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 15, right: 15),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          FeedBack(
                            avatar: coffee.image!,
                            userId: 1,
                            userName: "Hoang Thai Hoang Thai Hoang Thai ",
                            feedbackContent: coffee.description!,
                            time: "22:20, 11 thg 1, 2022",
                          ),
                          FeedBack(
                            avatar: coffee.image!,
                            userId: 1,
                            userName: "Hoang Thai Hoang Thai Hoang Thai ",
                            feedbackContent: coffee.description!,
                            time: "22:20, 11 thg 1, 2022",
                          ),
                          FeedBack(
                            avatar: coffee.image!,
                            userId: 1,
                            userName: "Hoang Thai",
                            feedbackContent:
                                (coffee.description! + coffee.description!),
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

        bottomNavigationBar:
            Consumer<AppProvider>(builder: (context, provider, child) {
          return !isLoading
              ? BottomNavMentorDetail(
                  checkInvited: false,
                  title: "Tiếp tục",
                  onRedirect: () {
                    provider.setBookingCoffee(coffee);
                    Navigator.of(context).pushNamed('/list-mentor',
                        arguments: ScreenArguments(false));
                  })
              : Text("");
        }));
  }
}

class CoffeeDetailPage extends StatefulWidget {
  final int coffeeId;
  final bool isCoffeeTab;

  CoffeeDetailPage({required this.coffeeId, required this.isCoffeeTab});

  @override
  _CoffeeDetailPage createState() => _CoffeeDetailPage();
}
