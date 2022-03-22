import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
  const ProfilePage({Key? key}) : super(key: key);
}

class _ProfilePage extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  // String name = "";
  // String phone = "0983828139";
  // String date = '2000-02-02';
  // String address = 'Quận 9';
  bool valid = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _sexx = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _date = TextEditingController();
  String _sex = "";
  String _major = '';
  String image = '';
  List<String> listSex = ["Nam", "Nữ", "Khác"];
  List<MajorModel> listMajor = [];
  late UserModel user;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = true;
  handleSubmit() {
    print("name: ${_name.text}");
    print("name: ${_phone.text}");
    print("name: ${_sex}");
    print("name: ${_major}");
    print("name: ${_address.text}");
    print("name: ${_date.text}");
    var email = auth.currentUser!.uid;
    ApiServices.putUpdateProfileByUserId(UserModel(
            id: email,
            fullname: _name.text,
            sex: _sex,
            phone: _phone.text,
            image: "",
            majorName: _major,
            address: _address.text,
            birthday: _date.text))
        .then((value) => {
              if (value != null)
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cập nhật thành công')),
                  )
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã xảy ra lỗi')),
                  )
                }
            });
  }

  getListMajor() {
    ApiServices.getMajors().then((value) => {
          if (value != null)
            {
              setState(() {
                listMajor = value;
              })
            }
        });
  }

  getProfileByUsername(String username) {
    UserModel user;
    var email = auth.currentUser!.email;
    ApiServices.getProfileByUsername(username).then((value) => {
          user = value,
          print(user.fullname),
          if (value != null)
            {
              setState(() {
                user = value;
                _name.text = user.fullname.toString();
                _phone.text = user.phone != null ? user.phone.toString() : "";
                _address.text =
                    user.address != null ? user.address.toString() : "";
                _date.text = user.birthday != null
                    ? user.birthday.toString()
                    : DateTime.now().toString();
                _major =
                    user.majorName != null ? user.majorName.toString() : "";
                _sex = user.sex != null ? user.sex.toString() : "";
                _email.text = email!.toString();
                image = user.image != null ? user.image! : "";
                isLoading = false;
              })
            }
          else
            {
              setState(() {
                isLoading = false;
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    getListMajor();
    var uid = auth.currentUser!.uid;
    getProfileByUsername(uid);
  }

  @override
  Widget build(BuildContext context) {
    // DateTime parseDate = DateTime.parse(date);
    print("object");
    // _date.text = date;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.only(
                        right: 15, left: 15, top: 15, bottom: 15),
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
                              if (image.isNotEmpty) ...[
                                Container(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 60, // Image radius
                                      backgroundImage: NetworkImage(image),
                                    )),
                              ] else ...[
                                Container(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 70, // Image radius
                                      backgroundImage: NetworkImage(
                                          "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/member%2Fistockphoto-1212812078-170667a.jpg?alt=media&token=675b6dba-bb3f-4547-8b76-024e399dec11"),
                                    )),
                              ],
                              Positioned(
                                  left:
                                      MediaQuery.of(context).size.width * 0.5 +
                                          10,
                                  top: 80,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: MaterialColors.primary,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Colors.white, width: 3)),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                          TextFormField(
                            controller: _email,
                            readOnly: true,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MaterialColors.primary),
                              ),
                              icon: const Icon(Icons.mail,
                                  color: MaterialColors.primary),
                              labelText: 'Tên đăng nhập',
                              focusColor: MaterialColors.primary,
                              labelStyle:
                                  TextStyle(color: MaterialColors.primary),
                            ),
                          ),
                          TextFormField(
                            onChanged: (text) {
                              setState(() {
                                // _phone.text = text;
                                if (text.isEmpty) {
                                  valid = false;
                                } else {
                                  valid = true;
                                }
                              });
                            },
                            controller: _name,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MaterialColors.primary),
                              ),
                              icon: const Icon(Icons.person,
                                  color: MaterialColors.primary),
                              hintText: 'Nhập tên của bạn',
                              labelText: 'Họ và tên',
                              labelStyle:
                                  TextStyle(color: MaterialColors.primary),
                            ),
                          ),
                          TextFormField(
                            onChanged: (text) {
                              setState(() {
                                // _phone.text = text;
                                if (text.isEmpty) {
                                  valid = false;
                                } else {
                                  valid = true;
                                }
                              });
                            },
                            controller: _phone,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MaterialColors.primary),
                              ),
                              icon: const Icon(Icons.phone,
                                  color: MaterialColors.primary),
                              hintText: 'Nhập số điện thoại của bạn',
                              labelText: 'Số điện thoại',
                              labelStyle:
                                  TextStyle(color: MaterialColors.primary),
                            ),
                          ),
                          TextFormField(
                            controller: _address,
                            onChanged: (text) {
                              setState(() {
                                if (text.isEmpty) {
                                  valid = false;
                                } else {
                                  valid = true;
                                }
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MaterialColors.primary),
                              ),
                              icon: const Icon(Icons.location_on,
                                  color: MaterialColors.primary),
                              hintText: 'Nhập địa chỉ của bạn',
                              labelText: 'Địa chỉ',
                              labelStyle:
                                  TextStyle(color: MaterialColors.primary),
                            ),
                          ),
                          FormField<String>(
                              builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: 'Giới tính',
                                  errorStyle:
                                      TextStyle(fontSize: 14.0, height: 0.1),
                                  icon: Icon(
                                    Icons.female,
                                    size: 28,
                                    color: MaterialColors.primary,
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _sex == '' ? null : _sex,
                                  isDense: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _sex = value!;
                                      if (value.isEmpty) {
                                        valid = false;
                                      } else {
                                        valid = true;
                                      }
                                    });
                                  },
                                  items: listSex.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                          FormField<String>(
                              builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: 'Chuyên ngành',
                                  errorStyle:
                                      TextStyle(fontSize: 14.0, height: 0.1),
                                  icon: Icon(
                                    Icons.school,
                                    size: 28,
                                    color: MaterialColors.primary,
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _major == '' ? null : _major,
                                  isDense: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _major = value!;
                                      if (value.isEmpty) {
                                        valid = false;
                                      } else {
                                        valid = true;
                                      }
                                    });
                                  },
                                  items: listMajor.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.majorName,
                                      child: Text(value.majorName),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }),
                          TextFormField(
                            controller: _date,
                            onTap: () {
                              print(_date.text);
                              showDatePicker(
                                  context: context,
                                  initialDate: _date.text != ""
                                      ? DateTime.parse(_date.text)
                                      : DateTime.now(),
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
                                  var month = selectedDate.month < 10
                                      ? ("0${selectedDate.month}")
                                      : selectedDate.month;
                                  var day = selectedDate.day < 10
                                      ? ("0${selectedDate.day}")
                                      : selectedDate.day;
                                  _date.text =
                                      "${selectedDate.year}-${month}-${day}";
                                  setState(() {
                                    String date = _date.text;
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
                                borderSide:
                                    BorderSide(color: MaterialColors.primary),
                              ),
                              icon: const Icon(Icons.calendar_today,
                                  color: MaterialColors.primary),
                              hintText: 'Chọn ngày sinh của bạn',
                              labelText: 'Ngày sinh',
                              labelStyle:
                                  TextStyle(color: MaterialColors.primary),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (valid) {
                                      if (_formKey.currentState!.validate()) {
                                        handleSubmit();
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: valid
                                        ? MaterialColors.primary
                                        : MaterialColors.primary
                                            .withOpacity(0.5),
                                    textStyle: TextStyle(color: Colors.white),
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
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
                              )),
                        ],
                      ),
                    ),
                  )));
  }
}
