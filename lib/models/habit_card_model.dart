import 'package:intl/intl.dart';

class HabitCardModel {
  final int id;
  final String customerId;
  final String trainerId;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  HabitCardModel({
    required this.id,
    required this.customerId,
    required this.trainerId,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HabitCardModel.fromJson(Map<String, dynamic> json) {
    DateTime parseDate(String? s) => s == null ? DateTime.now() : DateTime.parse(s);
    return HabitCardModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      customerId: json['customer_id']?.toString() ?? '',
      trainerId: json['trainer_id']?.toString() ?? '',
      name: json['name'] ?? 'Unnamed Habit',
      description: json['description'] ?? '',
      startDate: parseDate(json['start_date']),
      endDate: parseDate(json['end_date']),
      status: json['status'] == true || json['status'].toString() == '1',
      createdAt: parseDate(json['created_at']),
      updatedAt: parseDate(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "trainer_id": trainerId,
        "name": name,
        "description": description,
        "start_date": DateFormat('yyyy-MM-dd').format(startDate),
        "end_date": DateFormat('yyyy-MM-dd').format(endDate),
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
