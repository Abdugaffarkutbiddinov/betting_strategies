
import 'package:betting_starategies/features/betting_strategies/domain/entities/betting_strategy_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  final BettingStrategyCard bettingStrategyCards;

  const ListRow({Key? key, required this.bettingStrategyCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bettingStrategyCards.name,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),),
          Text(bettingStrategyCards.text,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),),
        ],
      ),
    );
  }
}
