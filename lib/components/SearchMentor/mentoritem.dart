import 'package:flutter/material.dart';
import 'package:twe/models/mentor.dart';

class MentorItem extends StatelessWidget {
  MentorModel mentor;
  late final ValueChanged<int> onPush;

  MentorItem({Key? key, required this.mentor, required this.onPush})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var skills = "";
    for (var element in mentor.skill) {
      if (skills != "") {
        skills = "$skills, $element";
      } else {
        skills = element;
      }
    }
    void onClick() {
      onPush(mentor.id);
    }

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        // padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
              height: 175,
              decoration: const BoxDecoration(
                  // border: Border(
                  //     bottom: BorderSide(color: Colors.black12, width: 1.0)),
                  ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(children: <Widget>[
                Expanded(
                    flex: 9,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                                padding: const EdgeInsets.only(right: 15),
                                child: CircleAvatar(
                                  radius: 35, // Image radius
                                  backgroundImage: NetworkImage(mentor.avatar),
                                ))),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    mentor.mentorName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ))),
                                        Expanded(
                                            flex: 9,
                                            child: Container(
                                                child: Text(
                                              "${mentor.rate}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                              ),
                                            )))
                                      ]),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: const Icon(
                                                  Icons.local_fire_department,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ))),
                                        Expanded(
                                            flex: 9,
                                            child: Container(
                                              child: Text(
                                                skills,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ))
                                      ])
                                ],
                              ),
                            ))
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    )),
                Expanded(
                    flex: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Text(mentor.description,
                          maxLines: 2,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          )),
                    )),
              ], mainAxisAlignment: MainAxisAlignment.spaceAround)),
        ));
  }
}
