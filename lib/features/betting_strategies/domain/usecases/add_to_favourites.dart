import 'dart:ffi';

import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/core/usecase/usecase.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddToFavourites  {
  BettingStrategyRepository repository;
  AddToFavourites(this.repository);
  @override
  Future<void> call(Params params) async{
    return await repository.addToFavourites(params.id);
  }

}

class Params extends Equatable {
  final int id;
  Params({required this.id});

  @override
// TODO: implement props
  List<Object?> get props => [id];
}
