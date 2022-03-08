import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/widget_span.dart';

class InfoClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*      TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        indicatorWeight: 2,
        labelStyle: TextStyle(
            fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w400),
        indicatorColor: Color(0xff107162),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            text: ("Đề xuất"),
          ),
          Tab(
            text: ("Mentor yêu thích"),
          ),
        ],
      ),
*/
        body: Container(
      child: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Title(
                    color: Colors.black,
                    child: Text(
                      'Chuyên ngành',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  child: Text(
                    'Môn học',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Kĩ thuật phần mềm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'JAVA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nội Dung',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Clean Code',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.menu_book_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Thời Gian',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('01/03/2022, 07:00 - 09:00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Mentor',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Lâm Hữu Khánh Phương',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Kĩ thuật phần mềm',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.format_align_justify,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Địa điểm',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 130, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Moda Coffee',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(150, 10, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                      '45 đường số 5 - Cứ Xá Bình Thới, Quận 11, Hồ Chí Minh',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('7:00 - 22:00',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: Container(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('7:00 - 22:00',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  // subtitle: Text(''),
                  leading: Icon(
                    Icons.attach_money_rounded,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ))),
      ]),
    ));
  }
}
