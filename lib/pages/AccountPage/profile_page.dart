import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
  const ProfilePage({Key? key}) : super(key: key);
}

class _ProfilePage extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String name = "Hoàng Thái";
  String phone = "0983828139";
  String date = '2000-02-02';
  String address = 'Quận 9';
  bool valid = false;
  TextEditingController _controller = TextEditingController();

  handleSubmit() {
    print("name: $name");
    print("phone: $phone");
    print("date: $date");
    print("address: $address");
  }

  @override
  Widget build(BuildContext context) {
    // DateTime parseDate = DateTime.parse(date);
    _controller.text = date;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MaterialColors.primary,
          leading: BackButton(color: Colors.white),
          automaticallyImplyLeading: false,
          title: Container(
            child: Text(
              "Tài khoản",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height * 1,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 60, // Image radius
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4j5EsloB48DnxRWOYQKJxT01dGj6cVFEDPQ&usqp=CAU"),
                        )),
                    Positioned(
                        left: MediaQuery.of(context).size.width * 0.5 + 10,
                        top: 80,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: MaterialColors.primary,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 3)
                                
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
                TextFormField(
                  initialValue: "HoangThai22",
                  readOnly: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaterialColors.primary),
                    ),
                    icon: const Icon(Icons.mail, color: MaterialColors.primary),
                    labelText: 'Tên đăng nhập',
                    focusColor: MaterialColors.primary,
                    labelStyle: TextStyle(color: MaterialColors.primary),
                  ),
                ),
                TextFormField(
                  initialValue: "Hoang Thai",
                  onChanged: (text) {
                    setState(() {
                      name = text;
                      if (name.isEmpty || name.length == 0) {
                        valid = false;
                      } else {
                        valid = true;
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaterialColors.primary),
                    ),
                    icon:
                        const Icon(Icons.person, color: MaterialColors.primary),
                    hintText: 'Nhập tên của bạn',
                    labelText: 'Họ và tên',
                    labelStyle: TextStyle(color: MaterialColors.primary),
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    setState(() {
                      phone = text;
                      if (phone.isEmpty || phone.length == 0) {
                        valid = false;
                      } else {
                        valid = true;
                      }
                    });
                  },
                  initialValue: phone,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaterialColors.primary),
                    ),
                    icon:
                        const Icon(Icons.phone, color: MaterialColors.primary),
                    hintText: 'Nhập số điện thoại của bạn',
                    labelText: 'Số điện thoại',
                    labelStyle: TextStyle(color: MaterialColors.primary),
                  ),
                ),
                TextFormField(
                  initialValue: address,
                  onChanged: (text) {
                    setState(() {
                      address = text;
                      if (address.isEmpty || address.length == 0) {
                        valid = false;
                      } else {
                        valid = true;
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaterialColors.primary),
                    ),
                    icon: const Icon(Icons.location_on,
                        color: MaterialColors.primary),
                    hintText: 'Nhập địa chỉ của bạn',
                    labelText: 'Địa chỉ',
                    labelStyle: TextStyle(color: MaterialColors.primary),
                  ),
                ),
                TextFormField(
                  controller: _controller,
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.parse("2000-02-02"),
                        firstDate: DateTime(1950, 1),
                        lastDate: DateTime(2023, 12),
                        builder: (context, picker) {
                          return Theme(
                            //TODO: change colors
                            data: ThemeData.dark().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: MaterialColors.primary,
                                onPrimary: Colors.white,
                                surface: MaterialColors.primary,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                            child: picker!,
                          );
                        }).then((selectedDate) {
                      if (selectedDate != null) {
                        _controller.text =
                            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                        setState(() {
                          date = _controller.text;
                          if (date.isEmpty || date.length == 0) {
                            valid = false;
                          } else {
                            valid = true;
                          }
                        });
                      }
                    });
                  },
                  // initialValue: "2000-02-02",
                  readOnly: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaterialColors.primary),
                    ),
                    icon: const Icon(Icons.calendar_today,
                        color: MaterialColors.primary),
                    hintText: 'Chọn ngày sinh của bạn',
                    labelText: 'Ngày sinh',
                    labelStyle: TextStyle(color: MaterialColors.primary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (valid) {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Cập nhật thành công')),
                          );
                          handleSubmit();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: valid
                          ? MaterialColors.primary
                          : MaterialColors.primary.withOpacity(0.5),
                      textStyle: TextStyle(color: Colors.white),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      "Cập nhật",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
