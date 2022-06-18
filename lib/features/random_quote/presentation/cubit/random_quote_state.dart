part of 'random_quote_cubit.dart';

abstract class RandomQuoteStates extends Equatable {
  const RandomQuoteStates();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitialState extends RandomQuoteStates {}

class RandomQuoteIsLoadingState extends RandomQuoteStates {}

class RandomQuoteIsLoadedState extends RandomQuoteStates {
  final Quote quote;
  const RandomQuoteIsLoadedState({
    required this.quote,
  });
  @override
  List<Object> get props => [quote];
}

class RandomQuoteIsErrorState extends RandomQuoteStates {
  final String msg;
  const RandomQuoteIsErrorState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
