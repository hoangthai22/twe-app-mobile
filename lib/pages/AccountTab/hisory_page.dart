import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Setting/historyItem.dart';
import 'package:twe/models/history.dart';

class HistoryPage extends StatefulWidget {
  String userId;
  @override
  State<StatefulWidget> createState() => _HistoryPage();
  HistoryPage({Key? key, required this.userId}) : super(key: key);
}

class _HistoryPage extends State<HistoryPage> {
  onPush(context, historyId) {
    Navigator.of(context).pushNamed(
      '/history-detail',
      arguments: historyId,
    );
  }

  List<HistoryModel> listHistory = [];
  bool isLoading = true;

  getListHistory() {
    ApiServices.getListHistory(widget.userId, 1, 3).then((value) => {
          if (value != null) print(value),
          {
            setState(() {
              listHistory = value;
              isLoading = false;
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
      body: isLoading
          ? Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    color: MaterialColors.primary,
                  )))
          : Container(
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
                    else ...[
                      Container(
                        height: MediaQuery.of(context).size.height - 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          "Chưa có meeting nào!",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 18,
                          ),
                        )),
                      )
                    ]
                  ]),
            ),
    );
  }
}
