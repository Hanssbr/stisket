import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../home/pages/main_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _local = AuthLocalDatasource();

  @override
  void initState() {
    super.initState();
    _authCheck();
  }

  Future<void> _authCheck() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await _local.getToken();

    if (!mounted) return;
    if (token != null) {
      context.pushReplacement(const MainPage());
    } else {
      context.pushReplacement(const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     if (_token != null && _token!.isNotEmpty) {
    //       context.pushReplacement(const MainPage());
    //     } else {
    //       context.pushReplacement(const LoginPage());
    //     }
    //   },
    // );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(96.0),
        child: Center(
          child: Assets.images.logoBlue.image(),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.0,
        child: Align(
          alignment: Alignment.center,
          child: Assets.images.logoCwb.image(width: 96.0),
        ),
      ),
    );
  }
}
