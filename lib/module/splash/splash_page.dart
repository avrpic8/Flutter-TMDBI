import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitCompleted;

  const SplashPage({Key? key, required this.onInitCompleted}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) => widget.onInitCompleted(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
