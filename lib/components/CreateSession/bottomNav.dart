import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class BottomNavMentorDetail extends StatelessWidget {
  Function onRedirect;

  String title;
  bool checkInvited;

  BottomNavMentorDetail({
    required this.onRedirect,
    required this.checkInvited,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        padding: EdgeInsets.only(left: 15, right: 15),
       
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                 margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: checkInvited
                        ? MaterialColors.primary.withOpacity(0.5)
                        : MaterialColors.primary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  // width: 180,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextButton(
                    onPressed: () {
                      checkInvited ? null : onRedirect();
                    },
                    child: Text(title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                  ))
            ]));
  }
}
