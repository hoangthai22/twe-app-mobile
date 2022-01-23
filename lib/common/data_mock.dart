import 'package:flutter/material.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';

var MENTOR_DATA = [
  MentorModel(
      id: 1,
      mentorName: "Phạm Văn Dương",
      description:
          "Xin chào! Tôi có khoảng 5 năm kinh nghiệm dạy người lớn và trẻ em. Tôi kiên nhẫn, hiểu biết và thân thiện. Tôi thích giúp mọi người thực hành tiếng Anh của họ bằng cách trò chuyện thú vị về nhiều chủ đề. Tôi hy vọng sẽ nói chuyện với bạn sớm!!",
      avatar: "https://camblyavatars.s3.amazonaws.com/5e1652f28e140d1c194ba446s200?h=2905bf5571661770dcd05f9e812b1e50",
      rate: 4.5,
      skill: ["Giáo viên Tiếng Anh"]),
  MentorModel(
      id: 2,
      mentorName: "Võ Chí Công",
      description:
          "Xin chào, tôi là Cônng. Tôi có hơn bốn mươi năm kinh nghiệm giảng dạy.",
      avatar: "https://camblyavatars.s3.amazonaws.com/5e5e806038ba58cd17b86d3es200",
      rate: 4.2,
      skill: ["Giáo viên Toán"]),
  MentorModel(
      id: 3,
      mentorName: "Trấn Thành",
      description:
          "Xin chào, tôi là Thái. Tôi có hơn năm năm kinh nghiệm giảng dạy. Chuyên môn của tôi là lập trình",
      avatar: "https://camblyavatars.s3.amazonaws.com/5b1e3217aeaa4a00241c8f91s200?h=af8c3e4b50e327814ec80878a4641b56",
      rate: 4.2,
      skill: ["Giáo viên Toán"]),
  MentorModel(
      id: 4,
      mentorName: "Hoàng Thái",
      description:
          "Xin chào, tôi là Thái. Tôi có hơn năm năm kinh nghiệm giảng dạy. Chuyên môn của tôi là lập trình",
      avatar: "https://camblyavatars.s3.amazonaws.com/5b1e3217aeaa4a00241c8f91s200?h=af8c3e4b50e327814ec80878a4641b56",
      rate: 4.2,
      skill: ["Giáo viên Toán"]),
];

var SUBJECT_DATA = [
  SubjectModel(subjectId: 1, majorId: 1, subjectName: "Database"),
  SubjectModel(subjectId: 2, majorId: 1, subjectName: "Programing"),
  SubjectModel(subjectId: 3, majorId: 2, subjectName: "Nhật 1"),
  SubjectModel(subjectId: 4, majorId: 2, subjectName: "Nhật 2"),
  SubjectModel(subjectId: 5, majorId: 3, subjectName: "Anh 3"),
];
var MAJOR_DATA = [
  MajorModel(majorId: 1, majorName: "Kỹ thuật phầm mềm"),
  MajorModel(majorId: 2, majorName: "Tiếng Nhật"),
  MajorModel(majorId: 3, majorName: "Tiếng Anh"),
];
var COFFEE_DATA = [
  CoffeeModel(
    id: 1,
    coffeeName: "TocoToco",
    address: "45 đường Số 5 - Cứ xá Bình Thới, Quận 11, Hồ Chí Minh",
    description:
        "Xin chào, tôi là Cônng. Tôi có hơn bốn mươi năm kinh nghiệm giảng dạy.",
    avatar:
        "https://tea-3.lozi.vn/v1/images/resized/tocotoco-bubble-tea-bien-hoa-thanh-pho-bien-hoa-dong-nai-1615989552428021525-eatery-avatar-1625939657?w=640&type=s",
    rate: 5,
  ),
  CoffeeModel(
    id: 2,
    coffeeName: "Coffe House",
    address: "45 đường Số 5 - Cứ xá Bình Thới, Quận 11, Hồ Chí Minh",
    description:
        "Xin chào, tôi là Cônng. Tôi có hơn bốn mươi năm kinh nghiệm giảng dạy.",
    avatar: "https://bloganchoi.com/wp-content/uploads/2019/12/ha-dong.jpg",
    rate: 4,
  ),
  CoffeeModel(
    id: 3,
    coffeeName: "GongCha",
    address: "45 đường Số 5 - Cứ xá Bình Thới, Quận 11, Hồ Chí Minh",
    description:
        "Thương hiệu Gong Cha được công ty TNHH Golden Trust chính thức đưa vào hoạt động tại thị trường Việt Nam từ ngày 11/10/2014. Trải qua hơn năm năm hoạt động, công ty TNHH Golden Trust – đơn vị nhượng quyền độc quyền của Gong Cha tại Việt Nam, đã đưa thương hiệu phát triển nhanh chóng và trở thành một trong những điểm đến thân thuộc của các bạn trẻ yêu thích văn hóa trà sữa và mong muốn trải nghiệm sản phẩm trà uy tín chất lượng với nguồn gốc xuất xứ rõ ràng.",
    avatar:
        "https://gongcha.com.vn/wp-content/uploads/2018/03/Banner-Trang-Ch%E1%BB%A7-k%E1%BA%BF-%C4%91%E1%BB%8Ba-ch%E1%BB%89-CH-800x380-01.jpg",
    rate: 3,
  ),
  CoffeeModel(
    id: 4,
    coffeeName: "TocoToco",
    address: "45 đường Số 5 - Cứ xá Bình Thới",
    description:
        "Xin chào, tôi là Cônng. Tôi có hơn bốn mươi năm kinh nghiệm giảng dạy.",
    avatar:
        "https://tea-3.lozi.vn/v1/images/resized/tocotoco-bubble-tea-bien-hoa-thanh-pho-bien-hoa-dong-nai-1615989552428021525-eatery-avatar-1625939657?w=640&type=s",
    rate: 5,
  ),
];
