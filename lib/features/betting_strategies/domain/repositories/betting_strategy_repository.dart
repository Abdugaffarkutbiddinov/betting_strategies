import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:dartz/dartz.dart';

abstract class BettingStrategyRepository {
  Future<Either<Failure, List<BettingStrategyCard>>>
      getBettingStrategyCardList();

  Future<Either<Failure, BettingStrategyCard>> getBettingCardDetails(int id);

  Future<Either<Failure, void>> addToFavourites(int id);

  Future<Either<Failure, void>> removeFromFavourites(int id);

  Future<Either<Failure, List<BettingStrategyCard>>>
      getBettingStrategyCardListFavourites();
}
