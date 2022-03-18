import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/SearchCoffee/modalFilter.dart';
import 'package:twe/components/Session/modalInfo.dart';

class MemberItem extends StatefulWidget {
  late String memberName;
  late String majorName;
  late String id;
  late String image;
  late bool isBorderBottom;

  MemberItem(
      {required this.memberName,
      required this.majorName,
      required this.image,
      required this.id,
      required this.isBorderBottom});

  @override
  State<StatefulWidget> createState() => _MemberItem();
}

class _MemberItem extends State<MemberItem> {
  void showMemberInfo() {
    return _Modal(context);
  }

  void _Modal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ModalInfo(
            id: widget.id,
            isMember: true
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        InkWell(
          onTap: () {
            showMemberInfo();
            // Navigator.pushNamed(context, '/member-detail');
          },
          child: Container(
            decoration: widget.isBorderBottom
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
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: Colors.black,
                      child: Text(
                        widget.memberName,
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
                            widget.majorName,
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
        ),
        Positioned(
          child: InkWell(
            child: Text(
              "...",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
          right: 15,
          top: 10,
        )
      ],
    );
  }
}
