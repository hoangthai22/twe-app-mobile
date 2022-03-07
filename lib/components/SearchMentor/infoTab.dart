import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/mentor.dart';

class InfoTab extends StatelessWidget {
  MentorModel mentor;

  InfoTab({required this.mentor});

  @override
  Widget build(BuildContext context) {
    print(mentor.listCertificate);
    return Container(
        margin: EdgeInsets.only(top: 0),
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: const Icon(
                      Icons.school,
                      color: MaterialColors.primary,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Text(
                            "Chuyên ngành",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            // height: 50,
                            child: Wrap(
                                // scrollDirection: Axis.horizontal,
                                spacing: 7,
                                children: mentor.listMajor!
                                    .map(
                                      (item) => Container(
                                        margin: EdgeInsets.only(
                                          // right: 5,
                                          top: 10,
                                        ),
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: MaterialColors.primary,
                                          border: Border.all(
                                              color: MaterialColors.primary,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: const Icon(
                      Icons.shield_outlined,
                      color: MaterialColors.primary,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Text(
                            "Chứng chỉ giảng dạy",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            // height: 50,
                            child: Wrap(
                                // scrollDirection: Axis.horizontal,
                                spacing: 7,
                                children: mentor.listCertificate!
                                    .map(
                                      (item) => Container(
                                        margin: EdgeInsets.only(top: 7),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: MaterialColors.primary,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          item.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: MaterialColors.primary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.subject,
                      color: MaterialColors.primary,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          const Text(
                            "Kỹ năng",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                getMajorString(mentor.listSkill!),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.phone,
                      color: MaterialColors.primary,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Text(
                            "Liên lạc",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              mentor.phone!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.cast_for_education,
                      color: MaterialColors.primary,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          const Text(
                            "Mô tả bản thân",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              mentor.description!,
                              style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto',
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
