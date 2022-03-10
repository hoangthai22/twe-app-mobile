import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Setting/historyItem.dart';
import 'package:twe/models/history.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPage();
  const HistoryPage({Key? key}) : super(key: key);
}

class _HistoryPage extends State<HistoryPage> {
  onPush(context, historyId) {
    Navigator.of(context).pushNamed(
      '/history-detail',
      arguments: historyId,
    );
  }

  List<HistoryModel> listHistory = [];

  getListHistory() {
    ApiServices.getListHistory("I8WUeMVF3KTDcChKbCwyyUqw6g72", 1, 3)
        .then((value) => {
              if (value != null) print(value),
              {
                setState(() {
                  listHistory = value;
                })
              }
            });
  }

  @override
  void initState() {
    super.initState();
    getListHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        toolbarHeight: 65,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lịch sử",
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
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              if (listHistory.isNotEmpty)
                ...listHistory
                    .map((history) => InkWell(
                        onTap: () => onPush(context, history.id),
                        child: HistoryItem(history: history)))
                    .toList()
            ]),
      ),
    );
  }
}
