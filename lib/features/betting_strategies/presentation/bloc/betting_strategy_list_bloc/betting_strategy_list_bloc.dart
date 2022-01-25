import 'dart:async';

import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/core/usecase/usecase.dart';
import 'package:betting_starategies/core/util/input_converter.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:betting_starategies/features/betting_strategies/domain/usecases/add_to_favourites.dart'
    as add;
import 'package:betting_starategies/features/betting_strategies/domain/usecases/add_to_favourites.dart';
import 'package:betting_starategies/features/betting_strategies/domain/usecases/delete_from_favourites.dart'
    as delete;
import 'package:betting_starategies/features/betting_strategies/domain/usecases/delete_from_favourites.dart';
import 'package:betting_starategies/features/betting_strategies/domain/usecases/get_betting_strategy_card_list.dart';
import 'package:betting_starategies/features/betting_strategies/domain/usecases/get_betting_strategy_favourites.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'betting_strategy_list_event.dart';

part 'betting_strategy_list_state.dart';

class BettingStrategyListBloc
    extends Bloc<BettingStrategyListEvent, BettingStrategyListState> {
  final GetBettingStrategyCardList getBettingStrategyCardList;
  final GetBettingStrategyFavourites getBettingStrategyFavourites;
  final AddToFavourites addToFavourites;
  final DeleteFromFavourites deleteFromFavourites;
  final InputConverter inputConverter;

  BettingStrategyListBloc({
    required this.getBettingStrategyCardList,
    required this.getBettingStrategyFavourites,
    required this.addToFavourites,
    required this.deleteFromFavourites,
    required this.inputConverter,
  }) : super(BettingStrategyListInitial()) {
    on<GetBettingStrategyAsList>(_onBettingStrategyList);
    on<AddBettingStrategyAsFavourite>(_onAddToFavourite);
    on<RemoveBettingStrategyFromFavourite>(_onRemoveFromFavourite);
    on<GetBettingStrategyForFavourites>(_onBettingStrategyForFavourites);
  }

  Future<void> _onBettingStrategyList(
    GetBettingStrategyAsList event,
    Emitter<BettingStrategyListState> emit,
  ) async {
    emit(Loading());
    final failureOrBettingStrategyList =
        await getBettingStrategyCardList(NoParams());
    emit(_eitherLoadedOrErrorState(failureOrBettingStrategyList));
  }

  Future<void> _onBettingStrategyForFavourites(
    GetBettingStrategyForFavourites event,
    Emitter<BettingStrategyListState> emit,
  ) async {
    emit(Loading());
    final failureOrBettingStrategyList =
        await getBettingStrategyFavourites(NoParams());
    emit(_eitherLoadedOrErrorState(failureOrBettingStrategyList));
  }

  BettingStrategyListState _eitherLoadedOrErrorState(
      Either<Failure, List<BettingStrategyCard>>
          failureOrBettingStrategyCardList) {
    return failureOrBettingStrategyCardList.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (bettingStrategyCardList) =>
            Loaded(bettingStrategyCardList: bettingStrategyCardList));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Invalid type Failure';
    }
  }

  Future<void> _onAddToFavourite(
    AddBettingStrategyAsFavourite event,
    Emitter<BettingStrategyListState> emit,
  ) async {
    final inputEither = inputConverter.stringToUnsignedInteger(event.idString);
    inputEither.fold((failure) => Error(message: _mapFailureToMessage(failure)),
        (id) async => await addToFavourites(add.Params(id: id)));
  }

  Future<void> _onRemoveFromFavourite(
    RemoveBettingStrategyFromFavourite event,
    Emitter<BettingStrategyListState> emit,
  ) async {
    final inputEither = inputConverter.stringToUnsignedInteger(event.idString);
    inputEither.fold((failure) =>  Error(message: _mapFailureToMessage(failure)),
        (id) async => await deleteFromFavourites(delete.Params(id: id)));
  }
}
