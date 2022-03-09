class SessionModel {
  final String? sessionId;
  final String? subject;
  final String? mentorName;
  final String? date;
  final int? slot;
  final double? price;
  final String? description;
  final String? image;
  final List? member;
  final String? cafeName;
  final String? cafeStreet;
  final String? cafeDistric;
  final bool? isJoin;
  final List? listMemberImage;

  SessionModel(
      {this.description,
      this.mentorName,
      this.subject,
      this.cafeDistric,
      this.cafeStreet,
      this.date,
      this.cafeName,
      this.slot,
      this.price,
      this.image,
      this.isJoin,
      this.listMemberImage,
      this.member,
      this.sessionId});

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      sessionId: json['sessionId'],
      mentorName: json['mentorName'],
      description: json['description'],
      subject: json['subjectName'],
      isJoin: json['isJoin'],
      listMemberImage: json['listMemberImage'],
      slot: json['slot'],
      date: json['date'],
      price: json['price'] == null ? 0.0 : json['price'].toDouble(),
      image: json['subjectImage'],
      cafeName: json['cafeName'],
      cafeStreet: json['cafeStreet'],
      cafeDistric: json['cafeDistric'],
    );
  }
}
