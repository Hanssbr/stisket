import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/model/products_model.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../dialogs/delete_ticket_dialog.dart';
import '../dialogs/edit_ticket_dialog.dart';

class TicketCard extends StatelessWidget {
  final Products item;
  const TicketCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  final confirm = await showDialog(
                    context: context,
                    builder: (context) => const DeleteTicketDialog(),
                  );
                  if (confirm == true) {
                    context.read<ProductsBloc>().add(
                          DeleteProductsEvent(item.id.toString()),
                        );
                  }
                },
                icon: Assets.icons.delete.svg(),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditTicketDialog(item: item),
                  );
                },
                icon: Assets.icons.edit.svg(),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          Text(
            item.price.currencyFormatRp,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
