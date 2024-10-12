import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/lifestylequestiner/model/lifestylequestionnairemodel.dart';
import 'package:my_app/utils/auth_exceptions.dart';
import 'package:my_app/utils/end_points.dart';

final response = {};

class  QuestionairRepo {
  final _dio =Dio();
  Future<Either<AppException, LifeStyleQustionair>> getQuestionair() async {
  try {
final response =await _dio.get(EndPoints.lifeStyleQuestionair,

options: Options(
  headers: {'Token':''}
));
    return  Right(LifeStyleQustionair.fromJson(response.data) );
  } catch (e) {
    return Left(ExceptionFilter.filterException(e));
  }
}


}

