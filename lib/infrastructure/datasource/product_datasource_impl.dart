import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:liverpool/domain/datasource/product_datasource.dart';
import 'package:liverpool/domain/entities/product.dart';
import 'package:liverpool/infrastructure/mappers/product_mapper.dart';
import 'package:liverpool/infrastructure/models/product_response.dart';

class ProductDatasourceIMPL implements ProductDatasource {
  final _dio = Dio();
  @override
  Future<List<Product>> getProductByName(String name) async {
    List<Product> products = [];
    try {
      final response = await _dio.get(
        'https://shopappst.liverpool.com.mx/appclienteservices/services/v6/plp/sf?pagenumber=1&search-string=$name&force-plp=false&number-of-items-perpage=40&cleanProductName=false',
      );
      if (response.statusCode == 200) {
        final data = ProductReponse.fromJson(response.data);
        for (var record in data.plpResults.records) {
          products.add(ProductMapper.toProductEntity(record));
        }
      }
    } catch (e, s) {
      debugPrint('Error: $e, Stack: $s');
      throw Exception(e.toString());
    }
    return products;
  }
}
