import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/meetup.dart';
import '../../pages/HomeTab/help.dart';

class SessionCard extends StatelessWidget {
  final SessionModel session;
  final double width;

  const SessionCard({
    Key? key,
    required this.session,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(session);
    return Container(
      //padding: EdgeInsets.all(0),
      // width: this.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 0.0)),
          /* Container(
            width: 100,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(getImageNetwork(session["icon"]))),
          ),*/
          Container(
            width: 250,
            height: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(getImageNetwork(session.image)),
                )),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.subject!,
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
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Icon(
                      IconData(0xf051f, fontFamily: 'MaterialIcons'),
                      size: 20,
                      color: MaterialColors.primary,
                    )),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        session.date ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Icon(
                        IconData(0xf518, fontFamily: 'MaterialIcons'),
                        size: 20,
                        color: MaterialColors.primary,
                      ),
                    ),
                    Container(
                      child: Text(
                        getSlot(session.slot!),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    IconData(0xe743, fontFamily: 'MaterialIcons'),
                    size: 22,
                    color: MaterialColors.primary,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    session.mentorName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    IconData(0xef68, fontFamily: 'MaterialIcons'),
                    color: MaterialColors.primary,
                    size: 22,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    session.cafeName.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Icon(
                            IconData(0xf58f, fontFamily: 'MaterialIcons'),
                            color: MaterialColors.primary,
                            size: 22)),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        session.price.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5, right: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: session.listMemberImage!
                        .map(
                          (item) => Container(
                            child: CircleAvatar(
                              radius: 13,
                              backgroundImage:
                                  NetworkImage(item),
                            ),
                          ),
                        )
                        .toList()),
              )
            ],
          )
        ],
      ),
    );
  }
}