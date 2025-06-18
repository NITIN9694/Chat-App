



class ProfileEmploymentGoalsModel{
  final String title;
  final String summary;
  final String achievementDate;
  final bool isExpand;

  ProfileEmploymentGoalsModel({
    required this.title,
    required this.summary,
    required this.achievementDate,
    this.isExpand = false,
  });

  ProfileEmploymentGoalsModel copyWith({bool? isExpand}) {
    return ProfileEmploymentGoalsModel(
      title: title,
      summary: summary,
      achievementDate: achievementDate,
      isExpand: isExpand ?? this.isExpand,
    );
  }
}