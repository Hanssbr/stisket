import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
// import '../models/product_model.dart';
import '../models/product_model.dart';
import '../widgets/order_card.dart';
import 'order_detail_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan'),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        // print('Current state: $state');
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsLoaded) {
          final products = state.products;
          // const Center(
          //   child: Text('Ada data'),
          // );
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SpaceHeight(20.0),
            itemBuilder: (context, index) => OrderCard(
              item: products[index],
            ),
          );
        }
        if (state is ProductsError) {
          print('errornya: ${state.message}');
        }
        return const Center(
          child: Text('tidak ada data'),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Order Summary'),
                  Text(
                    40000.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Button.filled(
                onPressed: () {
                  context.push(OrderDetailPage(
                    products: [products[0], products[1]],
                  ));
                },
                label: 'Process',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
