import 'package:flutter/material.dart';
import 'package:food_app/views/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _toHomePage();
  }

  _toHomePage() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green[300],
        image: const DecorationImage(
          image: AssetImage('assets/images/icon2.png'),
        ),
      ),
    );
  }
}
