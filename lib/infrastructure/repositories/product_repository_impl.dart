import 'package:liverpool/domain/datasource/product_datasource.dart';
import 'package:liverpool/domain/entities/product.dart';
import 'package:liverpool/domain/repositories/product_repository.dart';

class ProdcutRespositoryIMPL implements ProductRepository {
  final ProductDatasource datasource;

  ProdcutRespositoryIMPL(this.datasource);
  @override
  Future<List<Product>> getProductByName(String name) {
    return datasource.getProductByName(name);
  }
}
