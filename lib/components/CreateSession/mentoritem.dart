import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class MentorItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    void onClick() {
      onPush(mentor.id!);
    }

    void onRedirect() {
      onSubmit();
    }

    var listRate = [for (var i = 1; i <= mentor.rate!; i++) i];
    var listRateEmpty = [for (var i = 1; i <= 5 - mentor.rate!; i++) i];

    print(mentor.rate);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        // padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => onClick(),
          child: Stack(
            children: [
              Container(
                  height: 190,
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
                                        NetworkImage(mentor.image!),
                                  ))),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      mentor.fullname!,
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
                                                  height: 35,
                                                  child: ListView(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: mentor
                                                          .listMajor!
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
                                                                border: Border.all(
                                                                    color: MaterialColors
                                                                        .primary,
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: MaterialColors
                                                                      .primary,
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
                                            ]),
                                          )),
                                        ]),
                                  ],
                                ),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 1,
                        child: Text(mentor.description!,
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                    ],
                  )),
              (isBtnInvite == true
                  ? Consumer<AppProvider>(builder: (context, provider, child) {
                      var checkInvited =
                          provider.getListMentorInvite.contains(mentor);
                      return Positioned(
                          right: 15,
                          top: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: checkInvited
                                  ? MaterialColors.primary.withOpacity(0.5)
                                  : MaterialColors.primary,
                              textStyle: TextStyle(color: Colors.white),
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child:
                                checkInvited ? Text("??a?? M????i") : Text("M????i"),
                            onPressed: () => checkInvited ? null : onRedirect(),
                          ));
                    })
                  : Container()),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
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
                        "Th??ng tin chi ti????t",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () => onClick(),
                    ),
                  ))
            ],
          ),
        ));
  }
}
