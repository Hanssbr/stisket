import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class DeleteTicketDialog extends StatelessWidget {
  const DeleteTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Hapus Data',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          Text(
            'Apakah anda yakin untuk menghapus data ini ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.black.withOpacity(0.65),
            ),
          ),
          const SpaceHeight(20.0),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => context.pop(false),
                  label: 'Batalkan',
                  borderRadius: 8.0,
                  color: AppColors.buttonCancel,
                  textColor: AppColors.grey,
                  height: 44.0,
                  fontSize: 14.0,
                ),
              ),
              const SpaceWidth(12.0),
              Flexible(
                child: Button.filled(
                  onPressed: () => context.pop(true),
                  label: 'Hapus',
                  borderRadius: 8.0,
                  height: 44.0,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
