import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchCoffee/locationItem.dart';
import 'package:twe/components/SearchCoffee/modalFilter.dart';
import 'package:twe/components/SearchCoffee/modalFilterLocation.dart';
import 'package:twe/models/location.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

class _ListCoffeePage extends State<ListCoffeePage> {
  String query = '';
  List<CoffeeModel> coffeeList = [];
  final _controller = TextEditingController();
  String inputText = "";
  bool isSearchTab = false;
  bool isSearchKey = false;
  bool _isLoadingCircle = true;
  bool _isLoadingCoffee = true;
  bool isListFull = false;

  final ScrollController scrollController = ScrollController();
  int page = 1;
  int checkedInit = 0;
  String dictricFilter = "";
  @override
  void initState() {
    super.initState();

    _fetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !_isLoadingCircle &&
          !isSearchKey &&
          !isListFull) {
        _fetch();
      }
    });
  }

  getListCoffeeByDistric(String distric) {
    setState(() {
      _isLoadingCircle= false;
      _isLoadingCoffee = true;
    });
    ApiServices.getListCoffeeByDistric(distric).then((value) => {
          print(value),
          if (value != null)
            {
              setState(() {
                _isLoadingCoffee = false;
                coffeeList = value;
              })
            }
        });
  }

  _fetch() async {
    setState(() {
      _isLoadingCircle = true;
    });
    List<CoffeeModel> coffees = [];
    List<CoffeeModel> newList = [];

    ApiServices.getListCoffeePagination(page, 5).then((item) => {
          print(item),
          if (item != null)
            {
              coffees = item,
              if (coffees.isEmpty)
                {
                  setState(() {
                    isListFull = true;
                    _isLoadingCircle = false;
                    _isLoadingCoffee = false;
                  })
                }
              else
                {
                  newList = [...coffeeList, ...coffees],
                  setState(() {
                    _isLoadingCircle = false;
                    _isLoadingCoffee = false;
                    coffeeList = newList;
                    page++;
                  })
                }
            }
          else
            {
              setState(() {
                _isLoadingCircle = false;
                _isLoadingCoffee = false;
                isListFull = true;
                coffeeList = [];
              })
            }
        });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: widget.isCoffeeTab,
          title: isSearchTab ? _buildSearchField() : _buildTitleAppbar(),
          backgroundColor: MaterialColors.primary,
          actions: <Widget>[
            if (isSearchTab) ...[
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  // do something
                  setState(() {
                    isSearchTab = false;
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
                    isSearchTab = true;
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
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: 110,
                    height: 40,
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
                          _Modal(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bộ lọc",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          ],
                        )),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  //   width: 110,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         primary: Colors.white,
                  //         textStyle: TextStyle(color: MaterialColors.primary),
                  //         shadowColor: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(18),
                  //             side: BorderSide(
                  //                 color: MaterialColors.primary, width: 1)),
                  //       ),
                  //       onPressed: () {},
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             "Sắp xếp",
                  //             style: TextStyle(
                  //                 fontSize: 14,
                  //                 color: MaterialColors.primary,
                  //                 fontFamily: "Roboto",
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //           Container(
                  //             margin: EdgeInsets.only(left: 5),
                  //             child: Icon(
                  //               Icons.sort_by_alpha,
                  //               color: MaterialColors.primary,
                  //               size: 20,
                  //             ),
                  //           )
                  //         ],
                  //       )),
                  // ),
                  (dictricFilter == ""
                      ? Text("")
                      : Container(
                          padding: EdgeInsets.only(left: 15),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white70,
                                textStyle: TextStyle(color: Colors.blue),
                                shadowColor: Colors.white,
                                side: BorderSide(
                                    color: MaterialColors.primary, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Text(
                                      dictricFilter,
                                      style: TextStyle(
                                          color: MaterialColors.primary),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        dictricFilter = "";
                                      });
                                    },
                                    child: const Icon(
                                      Icons.highlight_remove_rounded,
                                      color: MaterialColors.primary,
                                      size: 24,
                                    ),
                                  )
                                ],
                              )),
                        )),
                ],
              ),
              Skeleton(
                  isLoading: _isLoadingCoffee,
                  skeleton: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          children: [1, 2, 3]
                              .map(
                                (e) => Container(
                                    margin: EdgeInsets.only(
                                        right: 15, bottom: 20, left: 15),
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    child: SkeletonItem(
                                      child: SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          width: double.infinity,
                                          minHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                        ),
                                      ),
                                    )),
                              )
                              .toList())),
                  child: Container(
                      // height: 900,
                      child: Consumer<AppProvider>(
                          builder: (context, provider, child) {
                    return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          if (coffeeList.isNotEmpty)
                            ...coffeeList
                                .map((item) => CoffeeItem(
                                    coffee: item,
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
                                    widthImg: 120))
                                .toList()
                          else ...[
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height - 200,
                              padding: EdgeInsets.only(top: 50),
                              child: Text(
                                "Không tìm thấy địa điểm nào phù hợp!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black54,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                          if (_isLoadingCircle) ...[
                            Center(
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.0,
                                      color: MaterialColors.primary,
                                    )))
                          ]
                        ]);
                  }))),
            ],
          ),
        ));
  }

  void _Modal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ModalFilterLocation(
            onSeletedMajor: (dictric) => {
              print("ok"),
              getListCoffeeByDistric(dictric),
              // setState(() {
              //   dictricFilter = dictric;
              // })
            },
          );
        });
  }

  void searchBar(String query) {
    setState(() {
      _isLoadingCoffee = true;
    });
    ApiServices.getListCoffeeByKeySearch(query).then((value) => {
          if (value != null)
            {
              setState(() {
                coffeeList = value;
                isSearchKey = true;
                isListFull = true;
                _isLoadingCoffee = false;
              })
            }
          else
            {
              setState(() {
                coffeeList = [];
                isListFull = true;
                _isLoadingCoffee = false;
              })
            }
        });
  }
}

class ListCoffeePage extends StatefulWidget {
  late final isCoffeeTab;

  ListCoffeePage({required this.isCoffeeTab});
  @override
  _ListCoffeePage createState() => _ListCoffeePage();
}
