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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        // padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black12, width: 1.0)),
              ),
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(children: <Widget>[
                Expanded(
                    flex: 6,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                                padding: const EdgeInsets.only(right: 15),
                                child: CircleAvatar(
                                  radius: 50, // Image radius
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
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
                                                  size: 24.0,
                                                ))),
                                        Expanded(
                                            flex: 9,
                                            child: Container(
                                                child: Text(
                                              "${mentor.rate}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
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
                                                  size: 24.0,
                                                ))),
                                        Expanded(
                                            flex: 9,
                                            child: Container(
                                              child: Text(
                                                skills,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
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
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Text(mentor.description,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ))
              ], mainAxisAlignment: MainAxisAlignment.spaceAround)),
        ));
  }
}
