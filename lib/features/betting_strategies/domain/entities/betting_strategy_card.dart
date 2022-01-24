import 'package:equatable/equatable.dart';

class BettingStrategyCard extends Equatable {
  final String name;
  final String image;
  final String text;

  BettingStrategyCard(
      {required this.name,
        required this.image,
        required this.text});

  @override
  // TODO: implement props
  List<Object> get props => [name, image, text];
}
