import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';

class MentorItemInvite extends StatelessWidget {
  final String avatar;
  final String mentorName;
  final String major;
  final bool isButtonCancel;
  final bool isRate;
  final double rate;
  final onPush;
  MentorItemInvite(
      {required this.avatar,
      required this.mentorName,
      required this.major,
      required this.rate,
      required this.isRate,
      required this.isButtonCancel,
      this.onPush});

  @override
  Widget build(BuildContext context) {
    var listRate = [for (var i = 1; i <= rate; i++) i];
    var listRateEmpty = [for (var i = 1; i <= 5 - rate; i++) i];

    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: 120,
      // width: 120,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              // padding: const EdgeInsets.only(right: 15, left: 0),
              child: Image(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                image: NetworkImage(avatar),
              )),
          Container(
            height: 55,
            // width: MediaQuery.of(context).size.width * 0.55,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      mentorName,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!isRate) ...[
                            const Icon(
                              Icons.subject_outlined,
                              color: MaterialColors.primary,
                              size: 24,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                major,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ] else ...[
                          
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
                          ]
                        ],
                      ),
                    )),
              ],
            ),

            // flex: 5,
          ),
          if (isButtonCancel) ...[
            Container(
                width: 90,
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
                    "Hủy",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontFamily: "Roboto"),
                  ),
                  onPressed: () => onPush(),
                ))
          ]
        ],
      ),
    );
  }
}
