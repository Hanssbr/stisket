import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../bloc/auth_bloc.dart';
import '../../../bloc/auth_event.dart';
import '../../../bloc/auth_state.dart';
import '../../intro/login_page.dart';

class LogoutTicketDialog extends StatelessWidget {
  const LogoutTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogout) {
          context.pushAndRemoveUntil(const LoginPage(), (route) => false);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Logout',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SpaceHeight(12.0),
            Text(
              'Apakah anda yakin untuk keluar dari aplikasi QuicTix?',
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
                    onPressed: () => context.pop(),
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
                    onPressed: () {
                      // final local = AuthLocalDatasource();
                      // await local.removeToken();
                      // context.pushAndRemoveUntil(
                      //     const LoginPage(), (route) => false);
                      context.read<AuthBloc>().add(LogoutEvent());
                    },
                    label: 'Logout',
                    borderRadius: 8.0,
                    height: 44.0,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
