import 'package:flutter/material.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchCoffee/appbarSearchCoffee.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/models/coffee.dart';

class _ListCoffeePage extends State<ListCoffeePage> {
  String query = '';
  late List<CoffeeModel> coffeeList;

  @override
  void initState() {
    super.initState();
    coffeeList = COFFEE_DATA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            color: Colors.white,
            child:  AppBarSearchCoffee(
                  text: query,
                  callback: (query) => searchBar(query),
                ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:
           ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff107163),
                        textStyle: TextStyle(color: Colors.white),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        // _ModalBottom(context);
                      },
                      child: Text(
                        "Bộ lọc",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  // (checkedInit == 0
                  //     ? Text("")
                  //     : Container(
                  //         padding: EdgeInsets.only(left: 15),
                  //         child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               primary: Colors.white70,
                  //               textStyle: TextStyle(color: Colors.blue),
                  //               shadowColor: Colors.white,
                  //               side: BorderSide(color: Colors.blue, width: 1),
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(18),
                  //               ),
                  //             ),
                  //             onPressed: () {},
                  //             child: Row(
                  //               children: [
                  //                 Container(
                  //                   margin: EdgeInsets.only(right: 5),
                  //                   child: Text(
                  //                     "${subList.where((element) => element.subjectId == checkedInit).toList()[0].subjectName}",
                  //                     style: TextStyle(color: Colors.blue),
                  //                   ),
                  //                 ),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     setState(() {

                  //                     });
                  //                   },
                  //                   child: const Icon(
                  //                     Icons.highlight_remove_rounded,
                  //                     color: Colors.blue,
                  //                     size: 24,
                  //                   ),
                  //                 )
                  //               ],
                  //             )),
                  //       )),
                ],
              ),
              Container(
                // height: 900,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: coffeeList.length,
                  itemBuilder: (context, index) {
                    return CoffeeItem(
                      coffee: coffeeList[index],
                      onPush: widget.onPush,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  void searchBar(String query) {
    final coffees = COFFEE_DATA.where((coffee) {
      final nameLower = coffee.id.toString();
      final searchLower = query.toLowerCase();
      return nameLower == searchLower;
    }).toList();
    setState(() {
      this.query = query;
      coffeeList = coffees;
    });
  }
}

class ListCoffeePage extends StatefulWidget {
  late final ValueChanged<int> onPush;
  final int mentorId;
  ListCoffeePage({required this.mentorId, required this.onPush});
  @override
  _ListCoffeePage createState() => _ListCoffeePage();
}
