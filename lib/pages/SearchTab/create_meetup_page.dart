import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/main.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/subject.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

class CreateSessionPage extends StatefulWidget {
  // final List<String> filterSub;

  CreateSessionPage({
    Key? key,
  }) : super(key: key);

  @override
  _CreateSessionPage createState() => _CreateSessionPage();
}

class _CreateSessionPage extends State<CreateSessionPage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  int isSelectedSlot = 1;
  MajorModel isSelectMajor = new MajorModel(majorId: "", majorName: "");
  List<MajorModel> majorList = [];
  List<SubjectModel> subList = [];
  SubjectModel isSelectSubject =
      new SubjectModel(subjectId: "", majorId: "", subjectName: "");

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    // majorList = MAJOR_DATA;
    _fetch();
    subList = [];
    isSelectedSlot = context.read<AppProvider>().getBookingSlot - 1 < 1
        ? 1
        : context.read<AppProvider>().getBookingSlot - 1;
    _selectedDay = DateTime.parse(context.read<AppProvider>().getBookingDate);
    _focusedDay = DateTime.parse(context.read<AppProvider>().getBookingDate);
  }

  _fetch() async {
    ApiServices.getMajors().then((item) => {
          if (item != null)
            {
              setState(() {
                majorList = item;
              })
            }
        });
  }

  getSkilltByMajorId(String id) async {
    ApiServices.getSkillBymajorId(id).then((item) => {
          print("item: $item"),
          if (item != null)
            {
              setState(() {
                subList = item;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          toolbarHeight: 65,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Step 1 of 4",
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: "Roboto",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                "Tạo buổi meetup",
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
        body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 1,
            padding: EdgeInsets.all(10),
            child: Consumer<AppProvider>(builder: (context, provider, child) {
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        TableCalendar(
                          daysOfWeekHeight: 40,
                          calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: MaterialColors.primary.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: MaterialColors.primary,
                                shape: BoxShape.circle,
                              )),
                          firstDay: kFirstDay,
                          lastDay: kLastDay,
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 30, right: 15),
                          child: Text(
                            'Buối sáng',
                            style: TextStyle(
                              color: Color(0xff363636),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.8,
                                crossAxisCount: 3,
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelectedSlot = index + 1;
                                    });
                                  },
                                  child: mentorTimingsData(SLOT[index],
                                      isSelectedSlot == index ? true : false),
                                );
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 30, right: 15),
                          child: Text(
                            'Buổi chiều',
                            style: TextStyle(
                              color: Color(0xff363636),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Colors.black12,
                              width: 1.0,
                            )),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(bottom: 30),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.8,
                                crossAxisCount: 3,
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelectedSlot = index + 3;
                                    });
                                  },
                                  child: mentorTimingsData(
                                      SLOT[index + 3],
                                      isSelectedSlot == (index + 3)
                                          ? true
                                          : false),
                                );
                              }),
                        ),
                      ]),
                  Container(
                      // width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.only(top: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            // margin: EdgeInsets.all(15),
                            margin:
                                EdgeInsets.only(top: 20, bottom: 15, left: 10),
                            child: Text(
                              "Chuyên ngành",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 45,
                            child: ListView(
                              children: majorList
                                  .map((e) => InkWell(
                                        child: subjectsData(
                                            e.majorName,
                                            isSelectMajor.majorId == (e.majorId)
                                                ? true
                                                : false),
                                        onTap: () {
                                          print("e.majorId: ${e.majorId}");

                                          setState(() {
                                            getSkilltByMajorId(e.majorId);
                                            final subs = subList.where((sub) {
                                              return sub.majorId == e.majorId;
                                            }).toList();
                                            isSelectMajor = e;
                                            subList = subs;
                                          });
                                        },
                                      ))
                                  .toList(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.all(15),
                            margin:
                                EdgeInsets.only(top: 25, bottom: 15, left: 10),
                            child: Text(
                              "Kỹ năng",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                              child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: subList
                                      .map((item) => Container(
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.black12,
                                                        width: 1.0))),
                                            child: ListTile(
                                              title: Text(
                                                "${item.subjectName}",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  isSelectSubject = item;
                                                });
                                              },
                                              leading: Radio(
                                                value: isSelectSubject,
                                                groupValue: item,
                                                activeColor:
                                                    MaterialColors.primary,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isSelectSubject = item;
                                                  });
                                                },
                                              ),
                                            ),
                                          ))
                                      .toList())),
                          Container(
                            margin:
                                EdgeInsets.only(top: 25, bottom: 15, left: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: isSelectSubject.subjectId != ""
                                    ? MaterialColors.primary
                                    : MaterialColors.primary.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text(
                                "Tiếp theo",
                                style: TextStyle(
                                    fontFamily: "Roboto", fontSize: 16),
                              ),
                              onPressed: () => isSelectSubject.subjectId != ""
                                  ? {
                                      provider.setBookingDate(
                                          "${_selectedDay.year}-${_selectedDay.month < 10 ? "0" + _selectedDay.month.toString() : _selectedDay.month}-${_selectedDay.day < 10 ? "0" + _selectedDay.day.toString() : _selectedDay.day}"),
                                      provider.setBookingSlot(isSelectedSlot),
                                      provider
                                          .setBookingSubjct(isSelectSubject),
                                      provider.setBookingMajor(isSelectMajor),
                                      Navigator.of(context).pushNamed(
                                        '/list-coffee',
                                        arguments: ScreenArguments(false),
                                      )
                                    }
                                  : {},
                            ),
                          )
                        ],
                      ))
                ],
              );
            })));
  }

  Widget mentorTimingsData(String time, bool isSelectedSlot) {
    return isSelectedSlot
        ? Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              color: MaterialColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget subjectsData(String title, bool isSelectedSlot) {
    return isSelectedSlot
        ? Container(
            margin: EdgeInsets.only(right: 5, left: 10),
            decoration: BoxDecoration(
              color: MaterialColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 2),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: 5, left: 10),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
