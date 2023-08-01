import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double listPrice;
  final double? promoPrice;
  final String? imageUrl;
  final List<String>? colors;

  const Product({
    required this.name,
    required this.listPrice,
    this.promoPrice,
    this.imageUrl,
    this.colors,
  });

  @override
  List<Object?> get props => [];
}
