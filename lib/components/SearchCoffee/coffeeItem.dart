import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/coffee.dart';

class CoffeeItem extends StatelessWidget {
  CoffeeModel coffee;
  late final ValueChanged<int> onPush;
  late final ValueChanged<CoffeeModel> onSubmit;
  late final isButton;
  late final isStar;
  late double heightImg;
  late double widthImg;

  CoffeeItem(
      {Key? key,
      required this.coffee,
      required this.onPush,
      required this.isButton,
      required this.onSubmit,
      required this.isStar,
      required this.heightImg,
      required this.widthImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onClick() {
      onPush(coffee.id);
    }

    void onRedirect() {
      onSubmit(coffee);
    }

    var listRate = [for (var i = 1; i <= coffee.rate; i++) i];

    return Container(
        // height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
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
                    width: widthImg,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          topRight: isButton
                              ? Radius.circular(0)
                              : Radius.circular(12),
                          bottomRight: isButton
                              ? Radius.circular(0)
                              : Radius.circular(12),
                        ),

                        // padding: const EdgeInsets.only(right: 15, left: 0),
                        child: Image(
                          // color:70olors.red,
                          height: heightImg,
                          width: widthImg,
                          fit: BoxFit.cover,
                          image: NetworkImage(coffee.avatar),
                        )),
                  ),
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width - (widthImg + 30),
                    padding: EdgeInsets.only(
                        right: 10, left: 10, top: isStar == false ? 15 : 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            coffee.coffeeName,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        if (isStar) ...[
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
                                    (widthImg + 30 + 45),
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  coffee.address,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                        ),

                        Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            padding: EdgeInsets.only(left: 5),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "7:00 - 22:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      ],
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Visibility(
                                      visible: isButton,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: ElevatedButton(
                                          onPressed: () => onRedirect(),
                                          style: ElevatedButton.styleFrom(
                                            primary: MaterialColors.primary,
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            shadowColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: Text(
                                            "??????t ch????",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
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
            )));
  }
}
