import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLange({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}
