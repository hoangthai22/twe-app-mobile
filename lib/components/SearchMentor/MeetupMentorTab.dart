import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class SessionMentorTab extends StatefulWidget {
  MentorModel mentor;

  SessionMentorTab({required this.mentor});
  @override
  State<StatefulWidget> createState() => _SessionMentorTab();
}

class _SessionMentorTab extends State<SessionMentorTab> {
  String date = DateTime.now().toString().split(" ")[0];
  bool isLoading = true;
  List<int> listSlot = [];
  List<int> listSchedule = [1, 2, 3, 4, 5, 6];

  getScheduleMentor(String date, String mentorID) {
    listSchedule = [1, 2, 3, 4, 5, 6];
    setState(() {
      isLoading = true;
    });
    ApiServices.getScheduleMentorByDate(date, mentorID).then((value) => {
          setState(() {
            listSlot = value;

            for (var item in listSlot) {
              var index = listSchedule.indexWhere((element) => element == item);
              listSchedule.remove(listSchedule[index]);
            }
            isLoading = false;
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScheduleMentor(date, widget.mentor.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        // width: MediaQuery.of(context).size.width,
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950, 1),
                      lastDate: DateTime(2023, 12),
                      locale: Locale("vi", "VI"),
                      builder: (context, picker) {
                        return Theme(
                          //TODO: change colors
                          data: ThemeData.dark().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: MaterialColors.primary,
                              onPrimary: Colors.white,
                              surface: MaterialColors.primary,
                              onSurface: Colors.black,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: picker!,
                        );
                      }).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        date = selectedDate.toString().split(" ")[0];
                        getScheduleMentor(date, widget.mentor.id!);
                      });
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: MaterialColors.primary, width: 1),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            date,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              if (isLoading) ...[
                Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          color: MaterialColors.primary,
                        )))
              ] else
                ...listSchedule.map((e) => buildSlot(e)).toList()
            ]));
  }

  Widget buildSlot(int slot) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Slot ${slot} (${getSlot(slot)}) AM",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Consumer<AppProvider>(builder: (context, provider, child) {
              return Container(
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MaterialColors.primary,
                      textStyle: TextStyle(color: Colors.white),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Lên lịch meetup",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    onPressed: () => {
                          Navigator.pushNamed(context, "/create-session"),
                          provider.setListMentorInvite(widget.mentor),
                          provider.setBookingSlot(slot),
                          provider.setBookingDate(date),
                        }),
              );
            })
          ]),
    );
  }
}
