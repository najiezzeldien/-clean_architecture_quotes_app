import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/core/utils/app_strings.dart';

import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteStates> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({
    required this.getRandomQuoteUseCase,
  }) : super(RandomQuoteInitialState());
  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoadingState());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
        (failure) => RandomQuoteIsErrorState(msg: _mapFailureToMsg(failure)),
        (quote) => RandomQuoteIsLoadedState(quote: quote)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFaluire;
      case CacheFailure:
        return AppStrings.cacheFaluire;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
