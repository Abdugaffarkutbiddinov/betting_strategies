import 'dart:async';

import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'betting_strategy_list_event.dart';

part 'betting_strategy_list_state.dart';

class BettingStrategyListBloc
    extends Bloc<BettingStrategyListEvent, BettingStrategyListState> {
  final BettingStrategyRepository _repository;

  BettingStrategyListBloc(
      {required BettingStrategyRepository bettingStrategyRepository})
      : _repository = bettingStrategyRepository,
        super(BettingStrategyListInitial()) {
    on<GetBettingStrategyAsList>(_onBettingStrategyList);
    // on<GetBettingStrategyAsDetails>(_onBettingStrategyDetails);
    // on<AddBettingStrategyAsFavourite>(_onAddToFavourite);
    // on<RemoveBettingStrategyFromFavourite>(_onRemoveFromFavourite);
    // on<GetBettingStrategyForFavourites>(_onBettingStrategyForFavourites);
  }

  Future<void> _onBettingStrategyList(GetBettingStrategyAsList event,
      Emitter<BettingStrategyListState> emit,) async {
    emit(Loading());
    final failureOrBettingStrategyList =
    await _repository.getBettingStrategyCardList();
    emit(_eitherLoadedOrErrorState(failureOrBettingStrategyList));
  }

  BettingStrategyListState _eitherLoadedOrErrorState(Either<Failure,
      List<BettingStrategyCard>> failureOrBettingStrategyCardList) {
    return failureOrBettingStrategyCardList.fold((failure) =>
        Error(message: _mapFailureToMessage(failure)), (
        bettingStrategyCardList) =>
        Loaded(bettingStrategyCardList: bettingStrategyCardList));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'HEYOOOOOOOOOO';
    }
  }

  // Future<void> _onBettingStrategyDetails(GetBettingStrategyAsDetails event,
  //     Emitter<BettingStrategyListState> emit,) async {
  //     await _repository.getBettingCardDetails(event.idString);
  // }
}
