import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/pages/HomeTab/padding.dart';
import 'package:twe/pages/HomeTab/meetup_json.dart';

import '../../common/constants.dart';
import '../../components/session_suggest/meetup_sugget_card.dart';

class SuggestSessionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuggestSessionPage();
}

class _SuggestSessionPage extends State<SuggestSessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          brightness: Brightness.light,
          backgroundColor: MaterialColors.primary,
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          primary: false,
          excludeHeaderSemantics: true,
          flexibleSpace: SafeArea(
              child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //margin: EdgeInsets.only(left: 150),
                          child: Row(children: [
                            Text(
                              "Meetup",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ))),
      body: Container(
        padding: EdgeInsets.only(top: 10, right: 15, left: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 241, 241, 241),
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sessionSuggestItem.length, (index) {
                    var mentor = sessionSuggestItem[index];
                    return Padding(
                      //child: SessionCard(session: mentor)
                      padding: const EdgeInsets.only(right: rightMainPadding),
                      child: Container(
                          child:
                              Session_Sugget_Card(session_sugget_card: mentor)),
                    );
                  }),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sessionSuggestItem1.length, (index) {
                    var mentor1 = sessionSuggestItem1[index];
                    return Padding(
                      //child: SessionCard(session: mentor)
                      padding: const EdgeInsets.only(right: rightMainPadding),
                      child: Container(
                          child: Session_Sugget_Card(
                              session_sugget_card: mentor1)),
                    );
                  }),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sessionSuggestItem2.length, (index) {
                    var mentor2 = sessionSuggestItem2[index];
                    return Padding(
                      //child: SessionCard(session: mentor)
                      padding: const EdgeInsets.only(right: rightMainPadding),
                      child: Container(
                          child: Session_Sugget_Card(
                              session_sugget_card: mentor2)),
                    );
                  }),
                ),
              ),
            ]),
      ),
    );
  }
}
