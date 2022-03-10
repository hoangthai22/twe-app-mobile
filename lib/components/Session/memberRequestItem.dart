import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/mentor.dart';

class MemberRequestItem extends StatelessWidget {
  late String memberName;
  late String majorName;
  late String id;
  late String image;
  late bool isBorderBottom;

  MemberRequestItem(
      {required this.image,
      required this.memberName,
      required this.majorName,
      required this.id,
      required this.isBorderBottom});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/member-detail');
          },
          child: Container(
            height: 125,
            decoration: isBorderBottom
                ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1.0)),
                  )
                : null,
            padding: EdgeInsets.only(bottom: 0, top: 15),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 35, // Image radius
                  backgroundImage: NetworkImage(image),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: Colors.black,
                      child: Text(
                        memberName,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 10),
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
                            majorName,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: ElevatedButton(
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
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () => {}),
                      ),
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(left: 15,bottom: 5),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MaterialColors.muted,
                              textStyle: TextStyle(color: Colors.white),
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Hủy bỏ",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () => {}),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
