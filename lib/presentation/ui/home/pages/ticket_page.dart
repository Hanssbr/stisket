import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';
import '../dialogs/add_ticket_dialog.dart';
import '../widgets/ticket_card.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Tiket'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddTicketDialog(),
              );
            },
            icon: Assets.icons.plus.svg(),
          ),
          const SpaceWidth(8.0),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            final products = state.products;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: products.length,
              separatorBuilder: (context, index) => const SpaceHeight(20.0),
              itemBuilder: (context, index) => TicketCard(
                item: products[index],
              ),
            );
            //   return ListView.separated(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   itemCount: products.length,
            //   separatorBuilder: (context, index) => const SpaceHeight(20.0),
            //   itemBuilder: (context, index) => OrderCard(
            //     item: products[index],
            //   ),
            // );
          }
          return const Center(
            child: Text('tidak ada data'),
          );
        },
      ),
    );
  }
}
