class Exercise {
  final int id;
  final String name;
  final String description;
  final String? timeInMinutes;
  final String sets;
  final String? reps;
  final String? images;
  final String workoutTypeId;
  final String bodyPartId;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;
  final BodyPart getBodyPart;
  final WorkoutType getWorkoutType;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    this.timeInMinutes,
    required this.sets,
    this.reps,
    this.images,
    required this.workoutTypeId,
    required this.bodyPartId,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    required this.getBodyPart,
    required this.getWorkoutType,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    try {
      return Exercise(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        timeInMinutes: json['time_in_minutes']?.toString(),
        sets: json['sets']?.toString() ?? '0',
        reps: json['reps']?.toString(),
        images: json['images']?.toString(),
        workoutTypeId: json['workout_type_id']?.toString() ?? '0',
        bodyPartId: json['body_part_id']?.toString() ?? '0',
        isActive: json['is_active']?.toString() ?? '0',
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
        getBodyPart: json['get_body_part'] != null 
            ? BodyPart.fromJson(json['get_body_part']) 
            : BodyPart(id: 0, name: 'Unknown', isActive: '0'),
        getWorkoutType: json['get_workout_type'] != null 
            ? WorkoutType.fromJson(json['get_workout_type']) 
            : WorkoutType(id: 0, name: 'Unknown', ordinal: '0', isActive: '0'),
      );
    } catch (e) {
      throw Exception('Error parsing Exercise: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'time_in_minutes': timeInMinutes,
      'sets': sets,
      'reps': reps,
      'images': images,
      'workout_type_id': workoutTypeId,
      'body_part_id': bodyPartId,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'get_body_part': getBodyPart.toJson(),
      'get_workout_type': getWorkoutType.toJson(),
    };
  }
}

class BodyPart {
  final int id;
  final String name;
  final String? description;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;

  BodyPart({
    required this.id,
    required this.name,
    this.description,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory BodyPart.fromJson(Map<String, dynamic> json) {
    try {
      return BodyPart(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'Unknown',
        description: json['description']?.toString(),
        isActive: json['is_active']?.toString() ?? '0',
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );
    } catch (e) {
      throw Exception('Error parsing BodyPart: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class WorkoutType {
  final int id;
  final String name;
  final String? description;
  final String ordinal;
  final String isActive;
  final String? createdAt;
  final String? updatedAt;

  WorkoutType({
    required this.id,
    required this.name,
    this.description,
    required this.ordinal,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkoutType.fromJson(Map<String, dynamic> json) {
    try {
      return WorkoutType(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'Unknown',
        description: json['description']?.toString(),
        ordinal: json['ordinal']?.toString() ?? '0',
        isActive: json['is_active']?.toString() ?? '0',
        createdAt: json['created_at']?.toString(),
        updatedAt: json['updated_at']?.toString(),
      );
    } catch (e) {
      throw Exception('Error parsing WorkoutType: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ordinal': ordinal,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

