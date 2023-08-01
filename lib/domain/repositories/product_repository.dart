import 'package:liverpool/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductByName(String name);
}
