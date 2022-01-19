import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';

import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/subject.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleModal extends StatefulWidget {
  // final List<String> filterSub;

  final ValueChanged<DateTime> onGetDate;
  final ValueChanged<int> onGetSlot;

  ScheduleModal({
    Key? key,
    required this.onGetDate,
    required this.onGetSlot,
  }) : super(key: key);

  @override
  _ScheduleModal createState() => _ScheduleModal();
}

class _ScheduleModal extends State<ScheduleModal> {


  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  int isSelected = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  void cachbackFunc() {
    widget.onGetSlot(isSelected);
    widget.onGetDate(_selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      cachbackFunc();
                      Navigator.pop(context);
                    },
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.3333,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Áp dụng",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        "Lịch",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  InkWell(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.3333,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Xóa",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              )),
              TableCalendar(
                daysOfWeekHeight: 40,
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Color(0xff107163).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xff107163),
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
                            isSelected = index;
                          });
                        },
                        child: mentorTimingsData(
                            SLOT[index], isSelected == index ? true : false),
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
                margin: EdgeInsets.only(top: 20, left: 0),
                child: GridView.builder(
                    shrinkWrap: true,
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
                            isSelected = index + 3;
                          });
                        },
                        child: mentorTimingsData(SLOT[index + 3],
                            isSelected == (index + 3) ? true : false),
                      );
                    }),
              ),
            ]));
  }
}

// Widget demoDates(String day, String date, bool isSelected) {
//   return isSelected
//       ? Container(
//           // width: 50,
//           margin: EdgeInsets.only(right: 5),
//           decoration: BoxDecoration(
//             color: Color(0xff107163),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: Text(
//                   day,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 11,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 2),
//                 padding: EdgeInsets.all(7),
//                 child: Text(
//                   date,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         )
//       : Container(
//           // width: 50,
//           margin: EdgeInsets.only(right: 5),
//           decoration: BoxDecoration(
//             color: Color(0xffEEEEEE),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: Text(
//                   day,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 11,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 2),
//                 padding: EdgeInsets.all(7),
//                 child: Text(
//                   date,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 10,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         );
// }

Widget mentorTimingsData(String time, bool isSelected) {
  return isSelected
      ? Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
            color: Color(0xff107163),
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
