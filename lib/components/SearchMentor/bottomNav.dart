import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavMentorDetail extends StatelessWidget {
  Function function;
  Function onRedirect;
  String session;
  String title;
  bool isChosseDay;
  BottomNavMentorDetail(
      {required this.function,
      required this.onRedirect,
      required this.isChosseDay,
      required this.title,
      required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: isChosseDay
                ? [
                    Expanded(
                        flex: 8,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                  color: Color(0xff107163), width: 1),
                            ),
                            child: TextButton(
                              onPressed: () {
                                function();
                              },
                              child: session.isEmpty
                                  ? Text(this.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff107163),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Roboto"))
                                  : Text(session,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff107163),
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Roboto")),
                            ))),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 8,
                        child: Container(
                            decoration: BoxDecoration(
                              color: session.isEmpty
                                  ? Color(0xffEEEEEE)
                                  : Color(0xff107163),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: TextButton(
                              onPressed: session.isEmpty
                                  ? null
                                  : () {
                                      onRedirect();
                                    },
                              child: const Text('Tiếp tục',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  )),
                            )))
                  ]
                : [
                    Container(
                        decoration: BoxDecoration(
                          color: Color(0xff107163),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        width: 180,
                        child: TextButton(
                          onPressed: () {
                            onRedirect();
                          },
                          child: const Text('Tiếp tục',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              )),
                        ))
                  ]));
  }
}
