import 'package:flutter/material.dart';

const stylistData = [
  {
    'Họ tên': 'Lại Đức Hùng ',
    'chuyên ngành': 'Mentor Lập trình',
    'rating': '5',
    'imgUrl': 'oop.png',
    'bgColor': Color.fromARGB(255, 235, 147, 147),
  },
  {
    'Họ tên': 'Lâm Hữu Khánh Phương',
    'chuyên ngành': 'Mentor Lập Trình',
    'rating': '4.9',
    'imgUrl': 'oop.png',
    'bgColor': Color.fromARGB(255, 113, 109, 155),
  },
  {
    'Họ tên': 'Lê Vũ Bảo Trinh',
    'chuyên ngành': 'Mentor Tiếng Nhật',
    'rating': '4.8',
    'imgUrl': 'oop.png',
    'bgColor': Color.fromARGB(255, 200, 240, 90),
  },
  {
    'Họ tên': 'Nguyễn Thế Hoàng',
    'chuyên ngành': 'Mentor Lập Trình',
    'rating': '4.9',
    'imgUrl': 'oop.png',
    'bgColor': Color.fromARGB(255, 106, 180, 245),
  },
];

class mentor_ranking extends StatelessWidget {
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
          //Positioned(
          //top: 20,
          //right: -60,
          //child: Image.asset(
          //stylist['imgUrl'],
          //width: MediaQuery.of(context).size.width * 0.48,
//),
          //),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stylist['Họ tên'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  stylist['chuyên ngành'],
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
                      stylist['rating'],
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
