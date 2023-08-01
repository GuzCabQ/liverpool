import 'package:liverpool/domain/entities/product.dart';

abstract class ProductDatasource {
  Future<List<Product>> getProductByName(String name);
}
