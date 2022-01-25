part of 'betting_strategy_list_bloc.dart';

@immutable
abstract class BettingStrategyListEvent extends Equatable {
  const BettingStrategyListEvent();
}

class GetBettingStrategyAsList extends BettingStrategyListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

// class GetBettingStrategyAsDetails extends BettingStrategyListEvent {
//   final String idString;
//
//   GetBettingStrategyAsDetails(this.idString);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [idString];
//
// }

class AddBettingStrategyAsFavourite extends BettingStrategyListEvent {
  final String idString;

  AddBettingStrategyAsFavourite(this.idString);


  @override
  // TODO: implement props
  List<Object?> get props => [idString];
}


class RemoveBettingStrategyFromFavourite extends BettingStrategyListEvent {
  final String idString;

  RemoveBettingStrategyFromFavourite(this.idString);


  @override
  // TODO: implement props
  List<Object?> get props => [idString];
}


class GetBettingStrategyForFavourites extends BettingStrategyListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
