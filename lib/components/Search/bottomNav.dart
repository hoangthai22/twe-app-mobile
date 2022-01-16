import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavMentorDetail extends StatelessWidget {
  Function function;
  Function onRedirect;
  BottomNavMentorDetail({required this.function, required this.onRedirect});

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
          children: [
            Expanded(
                flex: 8,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      border: Border.all(color: Color(0xff107163), width: 1),
                    ),
                    child: TextButton(
                      onPressed: () {
                        function();
                      },
                      child: const Text('13-01-2022 07:00-08:30',
                     textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff107163),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          )),
                    ))),
            Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 8,
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff107163),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
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
                    )))
          ],
        ));
  }
}
