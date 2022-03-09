import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Setting/historyItem.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  onPush(context, historyId) {
    Navigator.of(context).pushNamed(
      '/history-detail',
      arguments: historyId,
    );
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
            children: HISTORY_DATA
                .map((history) => InkWell(
                    onTap: () => onPush(context, history.id),
                    child: HistoryItem(history: history)))
                .toList()),
      ),
    );
  }
}
