import '../../models/health_assessment_models.dart';

abstract class LifestyleState {}

class LifestyleInitial extends LifestyleState {}

class LifestyleLoading extends LifestyleState {}

class LifestyleLoaded extends LifestyleState {
  final List<Category> categories;
  LifestyleLoaded(this.categories);
}

class LifestyleError extends LifestyleState {
  final String message;
  LifestyleError(this.message);
}
