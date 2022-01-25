import 'package:betting_starategies/core/error/failures.dart';
import 'package:betting_starategies/features/betting_strategies/data/datasources/betting_strategy_local_data_source.dart';
import 'package:betting_starategies/features/betting_strategies/data/datasources/betting_strategy_mock_remote_data_source.dart';
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/domain/repositories/betting_strategy_repository.dart';
import 'package:dartz/dartz.dart';

class BettingStrategyRepositoryImpl implements BettingStrategyRepository {
  final BettingStrategyMockRemoteDataSource mockRemoteDataSource;
  final BettingStrategyLocalDataSource localDataSource;

  BettingStrategyRepositoryImpl(
      {required this.mockRemoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, BettingStrategyCard>> getBettingCardDetails(int id) async{
    final mockRemoteBettingStrategyDetails = await mockRemoteDataSource.getBettingStrategyCardDetails(id);
    return Right(mockRemoteBettingStrategyDetails);
  }

  @override
  Future<Either<Failure, List<BettingStrategyCard>>> getBettingStrategyCardList() async{
    final mockRemoteBettingStrategyList = await mockRemoteDataSource.getBettingStrategyCardList();
    return Right(mockRemoteBettingStrategyList);
  }

  @override
  Future<Either<Failure, void>> addToFavourites(int id) async{
    final bettingStrategyCard = await mockRemoteDataSource.getBettingStrategyCardDetails(id);
    return Right(localDataSource.addToFavourites(bettingStrategyCard));

  }

  @override
  Future<Either<Failure, void>> removeFromFavourites(int id) async{
    final bettingStrategyCard = await mockRemoteDataSource.getBettingStrategyCardDetails(id);
    return Right(localDataSource.deleteFavourites(bettingStrategyCard));

  }

  @override
  Future<Either<Failure, List<BettingStrategyCard>>> getBettingStrategyCardListFavourites() async{
    final localFavouritesList = await localDataSource.getFavourites();
    return Right(localFavouritesList);
  }


}