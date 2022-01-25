

import 'package:betting_starategies/features/betting_strategies/data/datasources/betting_strategy_local_data_source.dart';
import 'package:betting_starategies/features/betting_strategies/data/datasources/betting_strategy_mock_remote_data_source.dart';
import 'package:betting_starategies/features/betting_strategies/data/repositories/betting_strategy_repository_impl.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:betting_starategies/features/betting_strategies/domain/usecases/get_betting_strategy_card_list.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/bloc/betting_strategy_list_bloc/betting_strategy_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Features
  // Bloc
  sl.registerFactory(() => BettingStrategyListBloc(bettingStrategyRepository: sl()));
// Use Case
sl.registerLazySingleton(() => GetBettingStrategyCardList(sl()));
// Repository

sl.registerLazySingleton<BettingStrategyRepository>(() => BettingStrategyRepositoryImpl(mockRemoteDataSource: sl(), localDataSource: sl()));
// Data Source
  sl.registerLazySingleton<BettingStrategyMockRemoteDataSource>(() => BettingStrategyMockRemoteDataSourceImpl());
  sl.registerLazySingleton<BettingStrategyLocalDataSource>(() => BettingStrategyLocalDataSourceImpl(sharedPreferences: sl()));
// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
