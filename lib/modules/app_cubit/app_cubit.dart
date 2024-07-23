import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

// Define the states


class AppDataLoadedState extends AppStates {
  final TrainingSeries trainingSeries;

  AppDataLoadedState(this.trainingSeries);
}

// Define the TrainingSeries class and related classes
class TrainingSeries {
  final List<Coach> coaches;
  final String seriesName;
  final String coverPhotoLink;
  final Overview overview;
  final List<Class> classes;
  final List<SocialPost> communitySocialFeed;

  TrainingSeries({
    required this.coaches,
    required this.seriesName,
    required this.coverPhotoLink,
    required this.overview,
    required this.classes,
    required this.communitySocialFeed,
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
      communitySocialFeed: (json['communitySocialFeed'] as List)
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
      'communitySocialFeed': communitySocialFeed.map((post) => post.toJson()).toList(),
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

// Cubit class
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  TrainingSeries? trainingSeries;

  void initializeData() {
    const String jsonString = '''
    {
      "coaches": [
        {
          "name": "Josh Kramer",
          "overviewInfo": "Fitness expert with 10 years of experience."
        }
      ],
      "seriesName": "The Challenge",
      "coverPhotoLink": "https://th.bing.com/th/id/OIP.JtNqRJj-sSJtcZRQQKGotgHaHa?pid=ImgDet&w=182&h=182&c=7",
      "overview": {
        "description": "A comprehensive fitness program.",
        "overviewVideo": "https://example.com/overview.mp4"
      },
      "classes": [
        {
          "videoLink": "https://example.com/class1.mp4",
          "title": "Introduction to Strength Training",
          "description": "An introductory class on strength training."
        }
      ],
      "communitySocialFeed": [
        {
          "postedBy": "Alice",
          "timeOfPost": "2024-07-23T14:00:00Z",
          "text": "Loving the new series! Great content."
        },
        {
          "postedBy": "Bob",
          "timeOfPost": "2024-07-22T09:30:00Z",
          "text": "The class on cardio was intense but effective!"
        }
      ]
    }
    ''';

    try {
      // Parsing JSON string to a Map
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Creating a TrainingSeries instance from JSON
      trainingSeries = TrainingSeries.fromJson(jsonData);

      // Emitting a new state with the loaded data
      emit(AppDataLoadedState(trainingSeries!));
    } catch (e) {
      // Handle JSON parsing errors or data issues
      print("Error initializing data: $e");
      // Optionally emit a different state for errors
    }
  }
}
