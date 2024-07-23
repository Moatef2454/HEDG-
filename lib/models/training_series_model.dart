import 'dart:convert';

// Model for Training Series
class TrainingSeries {
  final List<Coach> coaches;
  final String seriesName;
  final String coverPhotoLink;
  final Overview overview;
  final List<Class> classes;
  final List<SocialPost> communitySocialFeed; // Changed to List<SocialPost>

  TrainingSeries({
    required this.coaches,
    required this.seriesName,
    required this.coverPhotoLink,
    required this.overview,
    required this.classes,
    required this.communitySocialFeed, // Changed to List<SocialPost>
  });

  factory TrainingSeries.fromJson(Map<String, dynamic> json) {
    return TrainingSeries(
      coaches: (json['coaches'] as List)
          .map((i) => Coach.fromJson(i))
          .toList(),
      seriesName: json['seriesName'],
      coverPhotoLink: json['coverPhotoLink'],
      overview: Overview.fromJson(json['overview']),
      classes: (json['classes'] as List)
          .map((i) => Class.fromJson(i))
          .toList(),
      communitySocialFeed: (json['communitySocialFeed'] as List) // Changed to List<SocialPost>
          .map((i) => SocialPost.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coaches': coaches.map((coach) => coach.toJson()).toList(),
      'seriesName': seriesName,
      'coverPhotoLink': coverPhotoLink,
      'overview': overview.toJson(),
      'classes': classes.map((classItem) => classItem.toJson()).toList(),
      'communitySocialFeed': communitySocialFeed.map((post) => post.toJson()).toList(), // Changed to List<SocialPost>
    };
  }
}

// Model for Coach
class Coach {
  final String name;
  final String overviewInfo;

  Coach({
    required this.name,
    required this.overviewInfo,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      name: json['name'],
      overviewInfo: json['overviewInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'overviewInfo': overviewInfo,
    };
  }
}

// Model for Class
class Class {
  final String videoLink;
  final String title;
  final String description;

  Class({
    required this.videoLink,
    required this.title,
    required this.description,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      videoLink: json['videoLink'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoLink': videoLink,
      'title': title,
      'description': description,
    };
  }
}

// Model for Overview
class Overview {
  final String description;
  final String overviewVideo;

  Overview({
    required this.description,
    required this.overviewVideo,
  });

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      description: json['description'],
      overviewVideo: json['overviewVideo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'overviewVideo': overviewVideo,
    };
  }
}

// Model for Social Post
class SocialPost {
  final String postedBy;
  final DateTime timeOfPost;
  final String text;

  SocialPost({
    required this.postedBy,
    required this.timeOfPost,
    required this.text,
  });

  factory SocialPost.fromJson(Map<String, dynamic> json) {
    return SocialPost(
      postedBy: json['postedBy'],
      timeOfPost: DateTime.parse(json['timeOfPost']),
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postedBy': postedBy,
      'timeOfPost': timeOfPost.toIso8601String(),
      'text': text,
    };
  }
}
