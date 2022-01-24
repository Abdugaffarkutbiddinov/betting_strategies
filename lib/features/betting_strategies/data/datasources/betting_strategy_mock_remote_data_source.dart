
import 'dart:convert';

import 'package:betting_starategies/core/constants/data/data_reader.dart';
import 'package:betting_starategies/core/error/exception.dart';
import 'package:betting_starategies/features/betting_strategies/data/models/betting_strategy_card_model.dart';

// TODO: Should be Future or not
abstract class BettingStrategyMockRemoteDataSource {
  Future<List<BettingStrategyCardModel>> getBettingStrategyCardList();
  Future<BettingStrategyCardModel> getBettingStrategyCardDetails(int id);
}

class BettingStrategyMockRemoteDataSourceImpl implements BettingStrategyMockRemoteDataSource {
  @override
  Future<BettingStrategyCardModel> getBettingStrategyCardDetails(int id) {
    final body = json.decode(fixture('data_reader.json'));
    List<BettingStrategyCardModel> bettingStrategies = bettingStrategyCardListModelFromJson(body);
    for(final strategy in bettingStrategies) {
      if(id == strategy.id) {
        return Future.value(strategy);
      }
    }
    throw ElementNotFoundException();
  }

  @override
  Future<List<BettingStrategyCardModel>> getBettingStrategyCardList() {
    final body = json.decode(fixture('data_reader.json'));
    List<BettingStrategyCardModel> bettingStrategies = bettingStrategyCardListModelFromJson(body);
    return Future.value(bettingStrategies) ;
  }

}