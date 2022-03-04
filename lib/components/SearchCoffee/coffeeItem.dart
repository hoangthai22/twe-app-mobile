import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/coffee.dart';

class CoffeeItem extends StatefulWidget {
  CoffeeModel coffee;
  late final ValueChanged<String> onPush;
  late final ValueChanged<CoffeeModel> onSubmit;
  late final isTabPage;
  late final isButton;
  late final isStar;
  late double heightImg;
  late double widthImg;

  CoffeeItem(
      {Key? key,
      required this.coffee,
      required this.onPush,
      required this.isTabPage,
      required this.onSubmit,
      required this.isStar,
      required this.heightImg,
      required this.widthImg,
      required this.isButton})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CoffeeItem();
}

class _CoffeeItem extends State<CoffeeItem> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    void onClick() {
      widget.onPush(widget.coffee.id!);
    }

    void onRedirect() {
      widget.onSubmit(widget.coffee);
    }

    var listRate = [for (var i = 1; i <= 5; i++) i];

    return Stack(
      children: [
        Container(
            // height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            // padding: EdgeInsets.all(10),
            child: InkWell(
                onTap: () => onClick(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: widget.widthImg,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: widget.isTabPage
                                  ? Radius.circular(0)
                                  : Radius.circular(12),
                              bottomRight: widget.isTabPage
                                  ? Radius.circular(0)
                                  : Radius.circular(12),
                            ),

                            // padding: const EdgeInsets.only(right: 15, left: 0),
                            child: Image(
                              // color:70olors.red,
                              height: widget.heightImg,
                              width: widget.widthImg,
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.coffee.image!),
                            )),
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width -
                            (widget.widthImg + 30),
                        padding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            top: widget.isStar == false ? 15 : 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.coffee.name!,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            if (widget.isStar) ...[
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                      children: listRate
                                          .map(
                                            (e) => Icon(
                                              Icons.star,
                                              size: 14,
                                              color: Colors.amber,
                                            ),
                                          )
                                          .toList())),
                            ],
                            Expanded(
                              flex: 4,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: MaterialColors.primary,
                                    size: 16,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        (widget.widthImg + 30 + 45),
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      widget.coffee.street!,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Expanded(
                                flex: 4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 7,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Icon(
                                                  Icons.timer,
                                                  size: 16,
                                                  color: MaterialColors.primary,
                                                )),
                                            Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "7:00 - 22:00",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                          ],
                                        )),
                                  ],
                                ))
                            // Text(
                            //   coffee.description,
                            //   maxLines: 1,
                            //   style: TextStyle(
                            //       fontSize: 11, overflow: TextOverflow.ellipsis),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
        if (widget.isTabPage && widget.isButton) ...[
          Positioned(
              right: 30,
              bottom: 20,
              child: Container(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => onRedirect(),
                  style: ElevatedButton.styleFrom(
                    primary: MaterialColors.primary,
                    textStyle: TextStyle(color: Colors.white),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    "Đặt chổ",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ))
        ] else if (!widget.isTabPage && widget.isButton) ...[
          Positioned(
              right: 25,
              bottom: 20,
              child: Container(
                width: 120,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLike = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(color: Colors.white),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(
                              color: isLike
                                  ? MaterialColors.primary
                                  : Colors.black38,
                              width: 1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            isLike ? Icons.favorite : Icons.favorite_outline,
                            size: 24,
                            color:
                                isLike ? MaterialColors.primary : Colors.black,
                          ),
                        ),
                        Text(
                          "Yêu thích",
                          style: TextStyle(
                              fontSize: 14,
                              color: isLike
                                  ? MaterialColors.primary
                                  : Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
              ))
        ]
      ],
    );
  }
}
