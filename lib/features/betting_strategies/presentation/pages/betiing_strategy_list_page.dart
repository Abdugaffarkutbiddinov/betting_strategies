import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/bloc/betting_strategy_list_bloc/betting_strategy_list_bloc.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/list_row.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/loading_custom.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/message_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BettingStrategyListPage extends StatefulWidget {
  const BettingStrategyListPage({Key? key}) : super(key: key);

  @override
  State<BettingStrategyListPage> createState() => _BettingStrategyListPageState();
}

class _BettingStrategyListPageState extends State<BettingStrategyListPage> {
  @override
  void initState() {
    // TODO: implement initState
    _loadAlbums();
  }

  _loadAlbums() async {
    context.read<BettingStrategyListBloc>().add(GetBettingStrategyAsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
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
    return Expanded(
      child: ListView.builder(itemBuilder: (_, index) {
        BettingStrategyCard recipeCards = albums[index];
        return ListRow(bettingStrategyCards: recipeCards);
      }),
    );
  }
}
