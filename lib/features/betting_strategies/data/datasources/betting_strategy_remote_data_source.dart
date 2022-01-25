// import 'dart:convert';
//
//
// import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
// import 'package:http/http.dart' as http;
// abstract class BettingStrategyRemoteDataSource {
//   Future<List<BettingStrategyCard>> getBetStrategyCardList();
// }
//
// class RecipeCardRemoteDataSourceImpl implements BettingStrategyRemoteDataSource {
//   final http.Client client;
//   RecipeCardRemoteDataSourceImpl({required this.client});
//
//   static const _baseUrl = 'yummly2.p.rapidapi.com';
//   static const String _GET_RECIPE_CARD_LIST = '/feeds/list';
//   @override
//   Future<List<RecipeCardModel>> getBetStrategyCardList() async{
//     var uri = Uri.https(_baseUrl, _GET_RECIPE_CARD_LIST,{"limit": "18", "start": "0", "tag": "list.recipe.popular"});
//     final response = await client.get(
//         uri,headers: {
//       "x-rapidapi-host": "yummly2.p.rapidapi.com",
//       "x-rapidapi-key": "6d0dfac699mshddda70281f455dcp133bb7jsnea5daa885baf"
//     }
//     );
//     if (response.statusCode == 200) {
//       Map data = jsonDecode(response.body);
//       List _temp = [];
//       for(var i in data['feed'])  {
//         _temp.add(i['content']['details']);
//       }
//       return RecipeCardModel.recipesFromSnapshot(_temp);
//     } else {
//       throw ServerException();
//     }
//   }
//
// }