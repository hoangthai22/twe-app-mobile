import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/mentor.dart';

class MemberItem extends StatelessWidget {
  late MentorModel item;
  late bool isBorderBottom;

  MemberItem({required this.item, required this.isBorderBottom});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: isBorderBottom
              ? const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1.0)),
                )
              : null,
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 30, // Image radius
                backgroundImage: NetworkImage(item.image!),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                    color: Colors.black,
                    child: Text(
                      item.fullname!,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.school,
                            color: MaterialColors.primary,
                            size: 18,
                          ),
                        ),
                        Text(
                          item.listMajor![0].toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ))
              ],
            ),
          ]),
        ),
        Positioned(
          child: Text(
            "...",
            style: TextStyle(
                fontSize: 28,
                color: Colors.black54,
                fontWeight: FontWeight.w700),
          ),
          right: 15,
          top: 10,
        )
      ],
    );
  }
}
