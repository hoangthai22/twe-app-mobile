import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/provider/appProvider.dart';

class SessionItem extends StatefulWidget {
  late SessionModel session;
  SessionItem({required this.session});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SessionItem();
  }
}

class _SessionItem extends State<SessionItem> {
  void onClick() {}
  bool isRequest = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isRequest = false;
    });
  }

  Widget getIsJoinMessage(int status) {
    switch (status) {
      case 0:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(Icons.person_add, size: 20, color: Colors.white),
              ),
              Text(
                "Tham gia (còn ${5 - widget.session.listMemberImage!.length} chỗ trống)",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Đã Yêu cầu",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Đã tham gia",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      default:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(Icons.person_add, size: 20, color: Colors.white),
              ),
              Text(
                "Tham gia (còn ${5 - widget.session.listMemberImage!.length} chỗ trống)",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        // padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => {
            Navigator.of(context)
                .pushNamed('/session', arguments: widget.session.sessionId)
          },
          child: Stack(
            children: [
              Container(
                  height: 230,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.session.image!),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width - 210,
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  widget.session.subject!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.attach_money_outlined,
                                      size: 22, color: MaterialColors.primary),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                        "${widget.session.price!.toInt()} / buổi",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.school,
                                      size: 20, color: MaterialColors.primary),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(widget.session.mentorName!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 2),
                                child: Icon(Icons.calendar_month_outlined,
                                    size: 20, color: MaterialColors.primary),
                              ),
                              Text(
                                widget.session.date!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: 15),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(Icons.schedule,
                                    size: 20, color: MaterialColors.primary),
                              ),
                              Text(
                                getSlot(widget.session.slot!) ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: 15),
                              ),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                  size: 20, color: MaterialColors.primary),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                    "${widget.session.cafeName}, số 45 Cư xá Bình Thới - ${widget.session.cafeStreet!}, ${widget.session.cafeDistric!}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          )),
                      // Container(
                      //     margin: EdgeInsets.only(top: 7),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Icon(Icons.info,
                      //             size: 20, color: MaterialColors.primary),
                      //         Container(
                      //           width: MediaQuery.of(context).size.width - 90,
                      //           margin: EdgeInsets.only(left: 5),
                      //           child: Text(session.description!,
                      //               maxLines: 2,
                      //               overflow: TextOverflow.ellipsis,
                      //               style: TextStyle(
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.w400)),
                      //         )
                      //       ],
                      //     ))
                    ],
                  )),
              Positioned(
                  right: 0,
                  top: 15,
                  child: Container(
                    height: 45,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MaterialColors.primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        )),
                    child: Text(
                      "${widget.session.listMemberImage!.length}/5 thành viên",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: Consumer<AppProvider>(
                      builder: (context, provider, child) {
                    return Container(
                      color: Colors.white,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 1 - 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (!isRequest && widget.session.isJoin == 0) {
                              setState(() {
                                isRequest = true;
                              });
                              ApiServices.postRequestJoinMeetup(
                                      widget.session.sessionId!,
                                      provider.getUid)
                                  .then((value) => {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: widget.session.isJoin == 1 ||
                                    widget.session.isJoin == 2 || isRequest
                                ? MaterialColors.primary.withOpacity(0.5)
                                : MaterialColors.primary,
                            textStyle: TextStyle(color: Colors.white),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: (isRequest)
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Đã Yêu cầu",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              : getIsJoinMessage(widget.session.isJoin!)),
                    );
                  }))
            ],
          ),
        ));
  }
}
