import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/models/meetup.dart';
import '../../pages/HomeTab/help.dart';

class Session_Sugget_Card extends StatelessWidget {
  final SessionModel session_sugget_card;
  final double width;

  const Session_Sugget_Card({
    Key? key,
    required this.session_sugget_card,
    this.width = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listRate = [for (var i = 1; i <= MENTOR_DATA[0].rate!; i++) i];
    var listRateEmpty = [for (var i = 1; i <= 5 - MENTOR_DATA[0].rate!; i++) i];
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 1),
          width: this.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 0.0)),
              Container(
                width: 250,
                height: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          getImageNetwork(session_sugget_card.image)),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session_sugget_card.subject ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 10),
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
                            " (5.0)",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ]),
                    )),
                  ]),
              Container(
                  height: 35,
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 15),
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 5,
                      top: 5,
                    ),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: MaterialColors.primary,
                      border:
                          Border.all(color: MaterialColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      session_sugget_card.mentorName!,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
