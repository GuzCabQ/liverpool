import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liverpool/config/helpers/helpers.dart';
import 'package:liverpool/config/theme/colors_app.dart';
import 'package:liverpool/domain/entities/product.dart';
import 'package:liverpool/presentation/providers/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final laoding = ref.watch(loadingProvider);
    final ctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tu búsqueda'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: ctrl,
              onChanged: (value) {},
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                onPressed: () async {
                  ref.read(loadingProvider.notifier).update((state) => true);
                  await ref
                      .read(productsProvider.notifier)
                      .loadProducts(ctrl.text)
                      .then((value) {
                    ref.read(loadingProvider.notifier).update((state) => false);
                  });

                  ctrl.clear();
                },
                icon: const Icon(Icons.search),
              )),
            ),
            Expanded(
                child: ProductsList(products: products, isLoading: laoding)),
          ],
        ),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  final List<Product> products;
  final bool isLoading;
  const ProductsList({
    super.key,
    required this.products,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return isLoading
        ? const Center(
            child: SizedBox(
                height: 50,
                width: 50,
                child:
                    CircularProgressIndicator(color: ColorsApp.primaryColor)),
          )
        : ListView.separated(
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Row(
                children: [
                  SizedBox(
                      width: size.width * 0.5,
                      height: 250,
                      child: Image(
                        image: NetworkImage(product.imageUrl!),
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text(
                            Formatters().cifraConComas(product.listPrice),
                            textScaleFactor: 1,
                            style: product.promoPrice != null
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null,
                          ),
                          if (product.promoPrice != null)
                            Text(Formatters()
                                .cifraConComas(product.promoPrice!)),
                          if (product.colors != null)
                            Wrap(
                                children: product.colors!
                                    .map(
                                      (e) => const CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.red,
                                      ),
                                    )
                                    .toList())
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
  }
}
