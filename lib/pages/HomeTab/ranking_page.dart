import 'package:flutter/material.dart';
import 'package:twe/components/ranking/meetup_ranking.dart';
import 'package:twe/components/ranking/mentor_ranking.dart';

class RankingPage extends StatefulWidget {
  @override
  _Detailranking createState() => _Detailranking();
}

class _Detailranking extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ranking"),
          backgroundColor: Color.fromARGB(255, 20, 109, 72),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Mentor",
              ),
              Tab(text: "Meetup"),
            ],
          ),
        ),
        body: TabBarView(
          children: [mentor_ranking(), meetup_ranking()],
        ),
      ),
    );
  }
}
