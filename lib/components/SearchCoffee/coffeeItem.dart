import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/coffee.dart';

class CoffeeItem extends StatelessWidget {
  CoffeeModel coffee;
  late final ValueChanged<int> onPush;
  late final ValueChanged<CoffeeModel> onSubmit;
  late final isButton;

  CoffeeItem(
      {Key? key,
      required this.coffee,
      required this.onPush,
      required this.isButton,
      required this.onSubmit})
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
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topRight:
                            isButton ? Radius.circular(0) : Radius.circular(12),
                        bottomRight:
                            isButton ? Radius.circular(0) : Radius.circular(12),
                      ),

                      // padding: const EdgeInsets.only(right: 15, left: 0),
                      child: Image(
                        // color:70olors.red,
                        height: isButton ? 140 : 110,

                        fit: BoxFit.cover,
                        image: NetworkImage(coffee.avatar),
                      ))),
              Expanded(
                  flex: 8,
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
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
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
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
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.location_on,
                                  color: MaterialColors.primary,
                                  size: 16,
                                ),
                              ),
                              Expanded(
                                flex: 14,
                                child: Container(
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
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.timer,
                                                size: 16,
                                                color: MaterialColors.primary,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 12,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "7:00 - 22:00",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
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
                                            "Đặt chổ",
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
                  ))
            ],
          ),
        ));
  }
}
