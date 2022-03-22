import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class FeedBack extends StatefulWidget {
  final String avatar;
  final int userId;
  final String userName;
  final String feedbackContent;
  final String time;

  FeedBack(
      {Key? key,
      required this.avatar,
      required this.userId,
      required this.userName,
      required this.feedbackContent,
      required this.time})
      : super(key: key);

  @override
  _FeedBack createState() => _FeedBack();
}

class _FeedBack extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Colors.amber,
          border: Border(bottom: BorderSide(color: Colors.black26, width: 1)),
          // color: Colors.white
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: CircleAvatar(
                        radius: 30, // Image radius
                        backgroundImage: NetworkImage(widget.avatar),
                      )),
                  Container(
                    height: 70,
                    // color: Colors.blue,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 15,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              widget.userName,
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              widget.time,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 14,
                                  color: Colors.black54),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              const Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                              const Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: 16.0,
                              ),
                            ],
                          )
                        ]),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text(
                  widget.feedbackContent 
                    ,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 14),
                ),
              )
            ],
          ),
        ));
  }
}
