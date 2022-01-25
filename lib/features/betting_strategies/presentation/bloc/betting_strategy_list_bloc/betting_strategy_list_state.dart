part of 'betting_strategy_list_bloc.dart';

@immutable
abstract class BettingStrategyListState extends Equatable{
  const BettingStrategyListState();
}

class BettingStrategyListInitial extends BettingStrategyListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends BettingStrategyListState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends BettingStrategyListState {
  final List<BettingStrategyCard> bettingStrategyCardList;
  Loaded({required this.bettingStrategyCardList});

  @override
  // TODO: implement props
  List<Object?> get props => [bettingStrategyCardList];
}

class Error extends BettingStrategyListState {
  final String message;
  Error({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}