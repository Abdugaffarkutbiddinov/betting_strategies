import 'dart:convert';

import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:flutter/services.dart' as rootBundle;

List<BettingStrategyCardModel> bettingStrategyCardListModelFromJson(
        String str) =>
    List<BettingStrategyCardModel>.from(
        json.decode(str).map((x) => BettingStrategyCardModel.fromJson(x)));

String bettingStrategyCardListToJson(List<BettingStrategyCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// TODO Convert images to json
class BettingStrategyCardModel extends BettingStrategyCard {
  BettingStrategyCardModel(
      {required id, required name, required image, required text})
      : super(id: id, image: image, name: name, text: text);

  factory BettingStrategyCardModel.fromJson(Map<String, dynamic> json) {
    return BettingStrategyCardModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "text": text,
      };

  static Future<List<BettingStrategyCardModel>> ReadJsonData(String filePath) async {
    final jsonData = await rootBundle.rootBundle.loadString(filePath);
    final list = json.decode(jsonData) as List;
    return list.map((e) => BettingStrategyCardModel.fromJson(e)).toList();
  }

  static List<BettingStrategyCardModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return BettingStrategyCardModel.fromJson(data);
    }).toList();
  }
}
