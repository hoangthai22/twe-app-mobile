import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/mentorItemInvite.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';

class FeedbackSessionPage extends StatefulWidget {
  final int historyId;

  FeedbackSessionPage({Key? key, required this.historyId}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FeedbackSessionPage();
}

class _FeedbackSessionPage extends State<FeedbackSessionPage> {
  double ratingMentor = 5;
  double ratingCoffee = 5;
  String textInputMentor = '';
  String textInputCoffee = '';
  bool isEmptyMentor = true;
  bool isEmptyCoffee = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        toolbarHeight: 65,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Đánh giá buổi học",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                // fontSize: 18,
              ),
            ),
          ],
        ),
        backgroundColor: MaterialColors.primary,
      ),
      body: Container(
          // margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
            Container(
              // margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12),
                    top: BorderSide(width: 1, color: Colors.black12),
                  )),
              child: MentorItemInvite(
                mentorName: MENTOR_DATA[0].fullname!,
                avatar: MENTOR_DATA[0].image!,
                major: MAJOR_DATA[0].majorName,
                isButtonCancel: false,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              alignment: Alignment.center,
              child: SmoothStarRating(
                rating: ratingMentor,
                size: 34,
                starCount: 5,
                color: Colors.amber,
                borderColor: Colors.amber,
                allowHalfRating: false,
                onRated: (value) {
                  setState(() {
                    ratingMentor = value;
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Card(
                      color: Colors.white60,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 8,
                          onChanged: (value) {
                            setState(() {
                              textInputMentor = value;
                              isEmptyMentor =
                                  textInputMentor.isNotEmpty ? false : true;
                            });
                          },
                          decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.4)),
                              hintText:
                                  "Hãy phản hồi về những điều bạn thích về buổi học này nhé."),
                        ),
                      ))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12),
                      top: BorderSide(width: 1, color: Colors.black12),
                    )),
                child: CoffeeItem(
                  coffee: COFFEE_DATA[0],
                  onPush: (i) {},
                  onSubmit: (coffee) {},
                  isButton: false,
                  isStar: false,
                  heightImg: 80,
                  widthImg: 80,
                )),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              alignment: Alignment.center,
              child: SmoothStarRating(
                rating: ratingCoffee,
                size: 34,
                starCount: 5,
                color: Colors.amber,
                borderColor: Colors.amber,
                allowHalfRating: false,
                onRated: (value) {
                  setState(() {
                    ratingCoffee = value;
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Card(
                      color: Colors.white60,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              textInputCoffee = value;
                              isEmptyCoffee =
                                  textInputCoffee.isNotEmpty ? false : true;
                            });
                          },
                          maxLines: 8,
                          decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.4)),
                              hintText:
                                  "Hãy phản hồi về những điều bạn thích về quán coffee này nhé."),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: !isEmptyMentor && !isEmptyCoffee
                      ? MaterialColors.primary
                      : MaterialColors.primary.withOpacity(0.5),
                  textStyle: TextStyle(color: Colors.white),
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  "Xác nhận",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: "Roboto"),
                ),
                onPressed: () => {
                  if (!isEmptyMentor && !isEmptyCoffee)
                    {
                      print("coffe: ${textInputCoffee}"),
                      print("mentor: ${textInputMentor}"),
                    }
                },
              ),
            )
          ])),
    );
  }
}
