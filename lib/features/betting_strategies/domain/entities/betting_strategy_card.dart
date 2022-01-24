import 'package:equatable/equatable.dart';

class BettingStrategyCard extends Equatable {
  final int id;
  final String name;
  final String image;
  final String text;

  BettingStrategyCard(
      { required this.id,
        required this.name,
        required this.image,
        required this.text});

  @override
  // TODO: implement props
  List<Object> get props => [id,name, image, text];
}
