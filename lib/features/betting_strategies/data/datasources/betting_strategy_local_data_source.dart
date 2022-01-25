import 'dart:convert';

import 'package:betting_starategies/core/error/exception.dart';
import 'package:betting_starategies/features/betting_strategies/data/models/betting_strategy_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BettingStrategyLocalDataSource {
  Future<List<BettingStrategyCardModel>> getFavourites();

  Future<void> addToFavourites(BettingStrategyCardModel favourite);

  Future<void> deleteFavourites(BettingStrategyCardModel favourite);
}

const FAVOURITE_LIST = 'FAVOURITE_LIST';

class BettingStrategyLocalDataSourceImpl
    implements BettingStrategyLocalDataSource {
  SharedPreferences sharedPreferences;
  final List<BettingStrategyCardModel> favourites = [];

  BettingStrategyLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> addToFavourites(BettingStrategyCardModel favourite) {
    favourites.add(favourite);
    sharedPreferences.remove(FAVOURITE_LIST);
    return sharedPreferences.setString(
        FAVOURITE_LIST, json.encode(bettingStrategyCardListToJson(favourites)));
  }

  @override
  Future<List<BettingStrategyCardModel>> getFavourites() {
    final jsonString = sharedPreferences.getString(FAVOURITE_LIST);
    if (jsonString != null) {
      return Future.value(
          bettingStrategyCardListModelFromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteFavourites(BettingStrategyCardModel favourite) {
    favourites.remove(favourite);
    sharedPreferences.remove(FAVOURITE_LIST);
    return sharedPreferences.setString(
        FAVOURITE_LIST, json.encode(bettingStrategyCardListToJson(favourites)));
  }
}
