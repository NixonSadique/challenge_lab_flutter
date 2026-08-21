class StatsModel {
  final int totalUsers;
  final int totalChallenges;
  final int activeChallenges;
  final int totalSubmissions;
  final int totalRatings;

  StatsModel({
    required this.totalUsers,
    required this.totalChallenges,
    required this.activeChallenges,
    required this.totalSubmissions,
    required this.totalRatings,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      totalUsers: json['totalUsers'],
      totalChallenges: json['totalChallenges'],
      activeChallenges: json['activeChallenges'],
      totalSubmissions: json['totalSubmissions'],
      totalRatings: json['totalRatings'],
    );
  }
}
