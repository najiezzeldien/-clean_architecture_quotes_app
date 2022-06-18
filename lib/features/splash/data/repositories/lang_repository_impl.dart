import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/exceptions.dart';

import 'package:quotes/core/error/failures.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

class LangRepositoryImpl extends LangRepository {
  final LangLocalDataSource langLocalDataSource;
  LangRepositoryImpl({
    required this.langLocalDataSource,
  });
  @override
  Future<Either<Failure, bool>> changeLange({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLange(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode!);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
