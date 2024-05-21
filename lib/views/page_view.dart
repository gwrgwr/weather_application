import 'package:flutter/material.dart';
import 'package:weather_application/views/forecast_page.dart';
import 'package:weather_application/views/home_page.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        HomePage(),
        ForecastPage(),
      ],
    );
  }
}
