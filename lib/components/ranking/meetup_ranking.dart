import 'package:flutter/material.dart';

const stylistData = [
  {
    'Môn học': 'database ',
    'Giảng viên': 'Nguyễn Trọng Tài ',
    'lượt book': 'lượt book: 100',
    'bgColor': Color.fromARGB(255, 240, 198, 135),
  },
  {
    'Môn học': 'JAVA OOP',
    'Giảng viên': 'Nguyễn Thế Hoàng',
    'lượt book': 'lượt book: 100',
    'bgColor': Color.fromARGB(255, 215, 230, 136),
  },
  {
    'Môn học': 'Tiếng Nhật',
    'Giảng viên': 'Lê Vũ Bảo Trinh',
    'lượt book': 'lượt book: 100',
    'bgColor': Color.fromARGB(255, 216, 171, 203),
  },
  {
    'Môn học': 'Jave web',
    'Giảng viên': 'Doan Nguyen Thanh Hoa',
    'lượt book': 'lượt book: 100',
    'bgColor': Color.fromARGB(255, 177, 173, 219),
  },
];

class meetup_ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      StylistCard(stylistData[0]),
                      StylistCard(stylistData[1]),
                      StylistCard(stylistData[2]),
                      StylistCard(stylistData[3]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: stylist['bgColor'],
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stylist['Môn học'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  stylist['Giảng viên'],
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color(0xff4E295B),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      stylist['lượt book'],
                      style: TextStyle(
                        color: Color(0xff4E295B),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
