import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class MentorItem extends StatefulWidget {
  MentorModel mentor;
  late final ValueChanged<String> onPush;
  late final onSubmit;
  late final isBtnInvite;
  MentorItem(
      {Key? key,
      required this.mentor,
      required this.onPush,
      required this.onSubmit,
      required this.isBtnInvite})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MentorItem();
}

class _MentorItem extends State<MentorItem> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    void onClick() {
      widget.onPush(widget.mentor.id!);
    }

    void onRedirect() {
      widget.onSubmit();
    }

    var listRate = [for (var i = 1; i <= widget.mentor.rate!; i++) i];
    var listRateEmpty = [for (var i = 1; i <= 5 - widget.mentor.rate!; i++) i];

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
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
          onTap: () => onClick(),
          child: Stack(
            children: [
              Container(
                  height: 220,
                  decoration: const BoxDecoration(),
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: CircleAvatar(
                                    radius: 35, // Image radius
                                    backgroundImage:
                                        NetworkImage(widget.mentor.image!),
                                  ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.mentor.fullname!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                              child: Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Row(children: [
                                              if (listRate.length > 0)
                                                ...listRate.map((e) {
                                                  return Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: Colors.amber,
                                                  );
                                                }).toList(),
                                              if (listRateEmpty.length > 0)
                                                ...listRateEmpty.map((e) {
                                                  return Icon(
                                                    Icons.star_border,
                                                    size: 18,
                                                    color: Colors.amber,
                                                  );
                                                }).toList(),
                                              Container(
                                                child: Text(
                                                  " (${widget.mentor.rate})",
                                                  style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ]),
                                          )),
                                        ]),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  height: 35,
                                                  child: ListView(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: widget
                                                          .mentor.listMajor!
                                                          .map(
                                                            (item) => Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                right: 5,
                                                                top: 5,
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(7),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    MaterialColors
                                                                        .primary,
                                                                border: Border.all(
                                                                    color: MaterialColors
                                                                        .primary,
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                          .toList())))
                                        ]),
                                    Container(
                                      // height: 50,
                                      child: Wrap(
                                          // scrollDirection: Axis.horizontal,
                                          spacing: 7,
                                          children: widget
                                              .mentor.listCertificate!
                                              .map(
                                                (item) => Container(
                                                  margin:
                                                      EdgeInsets.only(top: 7),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: MaterialColors
                                                            .primary,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Text(
                                                    item.toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color: MaterialColors
                                                          .primary,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList()),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        widget.mentor.slogan!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      // Container(
                      //   // height: 50,
                      //   child: Wrap(
                      //       // scrollDirection: Axis.horizontal,
                      //       spacing: 7,
                      //       children: mentor.listCertificate!
                      //           .map(
                      //             (item) => Container(
                      //               margin: EdgeInsets.only(top: 15),
                      //               padding: EdgeInsets.all(8),
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 border: Border.all(
                      //                     color: MaterialColors.primary,
                      //                     width: 1),
                      //                 borderRadius: BorderRadius.circular(10.0),
                      //               ),
                      //               child: Text(
                      //                 item.toString(),
                      //                 style: TextStyle(
                      //                   fontFamily: 'Roboto',
                      //                   color: MaterialColors.primary,
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w400,
                      //                 ),
                      //               ),
                      //             ),
                      //           )
                      //           .toList()),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10),
                      //   width: MediaQuery.of(context).size.width * 1,
                      //   child: Text(mentor.slogan!,
                      //       maxLines: 2,
                      //       style: const TextStyle(
                      //         fontFamily: 'Roboto',
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 15,
                      //         overflow: TextOverflow.ellipsis,
                      //       )),
                      // ),
                    ],
                  )),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: widget.isBtnInvite
                        ? MediaQuery.of(context).size.width * 0.425
                        : MediaQuery.of(context).size.width - 50,
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
                        "Thông tin chi tiết",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () => onClick(),
                    ),
                  )),
              Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLike = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        isLike
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 32,
                        color: isLike ? Colors.red : Colors.black87,
                      ),
                    ),
                  )),
              (widget.isBtnInvite == true
                  ? Consumer<AppProvider>(builder: (context, provider, child) {
                      provider.getListMentorInvite.length > 0
                          ? print(provider.getListMentorInvite[0].id)
                          : print("object");
                      print(widget.mentor.id);

                      var checkInvited =
                          provider.checkIsInviteMentor(widget.mentor);
                      return Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.425,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: checkInvited
                                    ? MaterialColors.primary.withOpacity(0.5)
                                    : MaterialColors.primary,
                                textStyle: TextStyle(color: Colors.white),
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: checkInvited
                                  ? Text("Đã Mời")
                                  : Text("Mời"),
                              onPressed: () =>
                                  checkInvited ? null : onRedirect(),
                            ),
                          ));
                    })
                  : Container()),
            ],
          ),
        ));
  }
}
