class FeedbackModel {
  String? memberName;
  String? memberImage;
  int? mentorVoting;
  String? dateMentorFeedback;
  String? feedbackOfMentor;
  
  FeedbackModel(
      {this.dateMentorFeedback,
      this.feedbackOfMentor,
      this.memberImage,
      this.memberName,
      this.mentorVoting});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      memberName: json['memberName'],
      memberImage: json['memberImage'],
      mentorVoting: json['mentorVoting'],
      dateMentorFeedback: json['dateMentorFeedback'],
      feedbackOfMentor: json['feedbackOfMentor'],
    );
  }
}
