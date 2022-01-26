import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/core/usecase/usecase.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:dartz/dartz.dart';

class GetBettingStrategyFavourites extends UseCase<List<BettingStrategyCard>, NoParams> {
  final BettingStrategyRepository repository;

  GetBettingStrategyFavourites(this.repository);

  @override
  Future<Either<Failure, List<BettingStrategyCard>>> call(NoParams params) async {
    return await repository.getBettingStrategyCardListFavourites();
  }
}