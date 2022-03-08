import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/mentorItemInvite.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/subject.dart';
import 'package:twe/provider/appProvider.dart';

class ListMentorInvite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Center(
                // decoration: BoxDecoration(),

                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Danh sách Mentor",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              Consumer<AppProvider>(builder: (context, provider, child) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: provider.getListMentorInvite
                      .map(
                        (mentor) => MentorItemInvite(
                            avatar: mentor.image!,
                            mentorName: mentor.fullname!,
                            major: MAJOR_DATA[0].majorName,
                            isButtonCancel: true,
                            onPush: () => provider.removeMentor(mentor)),
                      )
                      .toList(),
                );
              })
            ]));
  }
}
