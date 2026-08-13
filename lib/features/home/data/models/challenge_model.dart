class ChallengeModel {
  final int id;
  final String title;
  final String description;
  final String difficulty;
  final String category;
  final int maxTeamSize;
  final String status;
  final DateTime deadline;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.category,
    required this.maxTeamSize,
    required this.status,
    required this.deadline,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      category: json['category'],
      maxTeamSize: json['maxTeamSize'],
      status: json['status'],
      deadline: DateTime.parse(json['deadline']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'category': category,
      'maxTeamSize': maxTeamSize,
      'status': status,
      'deadline': deadline.toIso8601String(),
    };
  }
}

class ChallengeListResponse {
  final List<ChallengeModel> challenges;
  final int totalPages;
  final int totalElements;
  final int pageNumber;
  final bool isLast;

  ChallengeListResponse({
    required this.challenges,
    required this.totalPages,
    required this.totalElements,
    required this.pageNumber,
    required this.isLast,
  });

  factory ChallengeListResponse.fromJson(Map<String, dynamic> json) {
    return ChallengeListResponse(
      challenges: (json['content'] as List)
          .map((e) => ChallengeModel.fromJson(e))
          .toList(),
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      pageNumber: json['number'],
      isLast: json['last'],
    );
  }
}
