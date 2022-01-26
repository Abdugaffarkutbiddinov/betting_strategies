import 'dart:convert';

import 'package:betting_starategies/core/error/exception.dart';
import 'package:betting_starategies/features/betting_strategies/data/models/betting_strategy_card_model.dart';

// TODO: Should be Future or not
abstract class BettingStrategyMockRemoteDataSource {
  Future<List<BettingStrategyCardModel>> getBettingStrategyCardList();
// Future<BettingStrategyCardModel> getBettingStrategyCardDetails(int id);
}

class BettingStrategyMockRemoteDataSourceImpl
    implements BettingStrategyMockRemoteDataSource {
  @override
  Future<List<BettingStrategyCardModel>> getBettingStrategyCardList() async {
    List<BettingStrategyCardModel> bettingStrategies =
        await BettingStrategyCardModel.ReadJsonData(
            'data_json/betting_strategy.json');
    return bettingStrategies;
  }
}
