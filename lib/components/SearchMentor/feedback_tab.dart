import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Feedback/feedback.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/mentor.dart';

class FeedbackTab extends StatelessWidget {
  List<FeedbackModel> listFeedback;
  double rate;
  FeedbackTab({required this.listFeedback, required this.rate});
  List<int> listRate = [];
  List<int> listRateEmpty = [];

  @override
  Widget build(BuildContext context) {
    listRate = [for (var i = 1; i <= rate; i++) i];
    listRateEmpty = [for (var i = 1; i <= 5 - rate; i++) i];
    return Container(
        margin: EdgeInsets.only(top: 0),
        // color: Colors.white,
        // height: MediaQuery.of(context).size.height -310,
        width: MediaQuery.of(context).size.width,
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Đánh giá của học viên",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (listRate.length > 0)
                          ...listRate.map((e) {
                            return Icon(
                              Icons.star,
                              size: 22,
                              color: Colors.amber,
                            );
                          }).toList(),
                        if (listRateEmpty.length > 0)
                          ...listRateEmpty.map((e) {
                            return Icon(
                              Icons.star_border,
                              size: 22,
                              color: Colors.amber,
                            );
                          }).toList(),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 5),
                          child: Text(
                            "${rate}/5",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: MaterialColors.primary,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Text(
                          " (${listFeedback.length} đánh giá)",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (listFeedback.length > 0)
                ...listFeedback
                    .map(
                      (feedback) => FeedBack(
                        avatar: feedback.memberImage!,
                        userId: 1,
                        userName: feedback.memberName!,
                        feedbackContent: feedback.feedbackOfMentor!,
                        time: feedback.dateMentorFeedback!,
                      ),
                    )
                    .toList()
              else ...[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only( left: 20),
                  color: Colors.white,
                  height: 50,
                  child: Text(
                    "Chưa có đánh giá nào",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )
              ]
            ]));
  }
}
