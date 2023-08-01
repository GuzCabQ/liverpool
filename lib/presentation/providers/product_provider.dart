import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liverpool/domain/entities/product.dart';
import 'package:liverpool/presentation/providers/product_repository_provider.dart';

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  final fetchMoreMovies = ref.watch(productRepositoryProvider).getProductByName;
  return ProductNotifier(fetchMoreMovies: fetchMoreMovies);
});

final loadingProvider = StateProvider<bool>((ref) => false);
typedef MovieCallback = Future<List<Product>> Function(String name);

class ProductNotifier extends StateNotifier<List<Product>> {
  bool isLoading = false;
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  ProductNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadProducts(String name) async {
    if (isLoading) return;
    isLoading = true;
    final List<Product> movies = await fetchMoreMovies(name);
    state = [...state, ...movies];
    // await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
