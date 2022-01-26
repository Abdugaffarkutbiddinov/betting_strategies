
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/bloc/betting_strategy_list_bloc/betting_strategy_list_bloc.dart';
import 'package:betting_starategies/features/betting_strategies/presentation/widgets/add_button_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../../constants.dart';

class DetailsPageFavourite extends StatefulWidget {
  const DetailsPageFavourite({Key? key, required this.strategy}) : super(key: key);
  final BettingStrategyCard strategy;

  @override
  _DetailsPageFavouriteState createState() => _DetailsPageFavouriteState();
}

class _DetailsPageFavouriteState extends State<DetailsPageFavourite> {
  String _cartTag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: AddButtonDetails(
              onPressed: () {
                context
                    .read<BettingStrategyListBloc>()
                    .add(AddBettingStrategyAsFavourite(widget.strategy.id.toString()));
                setState(() {
                  _cartTag = '_carTag';
                });
                Navigator.pop(context);
              },
              text: 'Remove from Favourites', backgroundColor: Colors.red,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.strategy.name + _cartTag,
                    child: Image(
                      image: NetworkImage(widget.strategy.image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.strategy.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              widget.strategy.text,
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Strategies",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
