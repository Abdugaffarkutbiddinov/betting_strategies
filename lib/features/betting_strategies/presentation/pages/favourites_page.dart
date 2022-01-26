import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/bloc/betting_strategy_list_bloc/betting_strategy_list_bloc.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/list_row.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/loading_custom.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/message_display.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'betting_strategy_page_details.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() =>
      _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    // TODO: implement initState
    _loadAlbums();
  }

  _loadAlbums() async {
    context.read<BettingStrategyListBloc>().add(GetBettingStrategyForFavourites());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<BettingStrategyListBloc, BettingStrategyListState>(
            builder: (BuildContext context, BettingStrategyListState state) {
              if (state is Error) {
                return MessageDisplay(message: state.message);
              }
              if (state is Loaded) {
                List<BettingStrategyCard> albums = state.bettingStrategyCardList;
                return _list(albums);
              }
              return LoadingCustom();
            }),
      ],
    );
  }

  Widget _list(List<BettingStrategyCard> albums) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Expanded(
      child: ListView.builder(
          itemCount: albums == null ? 0 : albums.length,
          itemBuilder: (context, index) {
            // BettingStrategyCard data = albums[index];
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DetailsPage(strategy: albums[index]))
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                    const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FadeTransition(
                          opacity: animation,
                          child: DetailsPage(
                            strategy: albums[index],
                          ),
                        ),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: NetworkImage(albums[index].image),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            albums[index].name,
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: width,
                            child: Text(albums[index].text),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
