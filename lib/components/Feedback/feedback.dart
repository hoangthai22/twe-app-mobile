import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        width: 300,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black26, width: 1),
          // color: Colors.white
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.only(left: 15, right: 5),
                          child: CircleAvatar(
                            radius: 30, // Image radius
                            backgroundImage: NetworkImage(widget.avatar),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text(
                                  widget.userName,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                widget.time,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black54),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Text(
                      widget.feedbackContent,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, fontFamily: "Roboto"),
                    ),
                  ))
            ],
          ),
        ));
  }
}
