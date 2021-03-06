import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchCoffee/appbarSearchCoffee.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/main.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

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
    final args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            color: MaterialColors.primary,
            child: AppBarSearchCoffee(
              isTabPage: widget.isCoffeeTab,
              step: "Step 2 of 4",
              showListMentorInvite: () => {print("object")},
              title: "Chọn địa điểm",
              hintText: "Tìm một quán coffee",
              text: query,
              callback: (query) => searchBar(query),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
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
                        primary: MaterialColors.primary,
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
                  child: Consumer<AppProvider>(
                      builder: (context, provider, child) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: coffeeList.length,
                  itemBuilder: (context, index) {
                    return CoffeeItem(
                        coffee: coffeeList[index],
                        onPush: (coffeeId) {
                          Navigator.of(context).pushNamed(
                            '/coffee-detail',
                            arguments: coffeeId,
                          );
                        },
                        onSubmit: (coffee) {
                          Navigator.of(context).pushNamed(
                            '/list-mentor',
                            arguments: ScreenArguments(false),
                          );
                          provider.setBookingCoffee(coffee);
                        },
                        isButton: true,
                        isStar: true,
                        heightImg: 140,
                        widthImg: 120);
                  },
                );
              }))
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
  late final isCoffeeTab;

  ListCoffeePage({required this.isCoffeeTab});
  @override
  _ListCoffeePage createState() => _ListCoffeePage();
}
