class SessionModel {
  final String? sessionId;
  final String? subject;
  final String? mentorName;
  final String? date;
  final int? slot;
  final String? description;
  final String? image;
  final List? member;

  SessionModel(
      {this.description,
      this.mentorName,
      this.subject,
      this.date,
      this.slot,
      this.image,
      this.member,
      this.sessionId});
}
