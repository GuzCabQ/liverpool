import 'package:liverpool/domain/entities/product.dart';
import 'package:liverpool/infrastructure/models/product_response.dart';

class ProductMapper {
  static Product toProductEntity(Record response) {
    return Product(
        name: response.productDisplayName,
        listPrice: response.listPrice,
        promoPrice: response.promoPrice,
        imageUrl: response.smImage ??
            'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
        colors: response.variantsColor == null
            ? null
            : response.variantsColor!.map((e) => e.colorHex).toList());
  }
}
