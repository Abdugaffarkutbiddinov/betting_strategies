// import 'package:betting_starategies/core/error/failures.dart';
// import 'package:betting_starategies/core/usecase/usecase.dart';
// import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
// import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// class GetBettingStrategyDetails extends UseCase<BettingStrategyCard,Params> {
//   BettingStrategyRepository repository;
//   GetBettingStrategyDetails(this.repository);
//   @override
//   Future<Either<Failure, BettingStrategyCard>> call(Params params) {
//     // TODO: implement call
//     throw repository.getBettingCardDetails(params.id);
//   }
//
// }
//
// class Params extends Equatable {
//   final int id;
//   Params({required this.id});
//
//   @override
// // TODO: implement props
//   List<Object?> get props => [id];
// }
