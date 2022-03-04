import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchCoffee/coffeeItem.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

class _ListCoffeePage extends State<ListCoffeePage> {
  String query = '';
  List<CoffeeModel> coffeeList = [];
  final _controller = TextEditingController();
  String inputText = "";
  bool isSearch = false;
  bool _isLoading = true;
  bool isListFull = false;

  int page = 1;

  @override
  void initState() {
    super.initState();
    coffeeList = COFFEE_DATA;
    // _fetch();
  }

  _fetch() async {
    setState(() {
      _isLoading = true;
    });
    List<CoffeeModel> coffees = [];
    List<CoffeeModel> newList = [];
    ApiServices.getListCoffeePagination(page, 4).then((item) => {
      print(item),
          if (item != null)
            {
              coffees = item,
              if (coffees.isEmpty)
                {
                  setState(() {
                    isListFull = true;
                    _isLoading = false;
                  })
                }
              else
                {
                  newList = [...coffeeList, ...coffees],
                  setState(() {
                    _isLoading = false;
                    coffeeList = newList;
                    page++;
                  })
                }
            }
          else
            {
              setState(() {
                _isLoading = false;
                isListFull = true;
                coffeeList = [];
              })
            }
        });
  }

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Tìm một địa điểm...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      onSubmitted: (value) {
        searchBar(value);
      },
      onChanged: (text) {
        setState(() {
          inputText = text;
        });
      },
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  Widget _buildTitleAppbar() {
    if (widget.isCoffeeTab) {
      return Text("Chọn một địa điểm");
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5, left: 1),
            child: Text(
              "Step 3 of 4",
              style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Text(
              "Chọn địa điểm",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          centerTitle: widget.isCoffeeTab,
          title: isSearch ? _buildSearchField() : _buildTitleAppbar(),
          backgroundColor: MaterialColors.primary,
          actions: <Widget>[
            if (isSearch) ...[
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  // do something
                  setState(() {
                    isSearch = false;
                  });
                },
              ),
            ] else ...[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  // do something
                  setState(() {
                    isSearch = true;
                  });
                },
              ),
            ]
          ],
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
                        isTabPage: !widget.isCoffeeTab,
                        isStar: true,
                        heightImg: 150,
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
