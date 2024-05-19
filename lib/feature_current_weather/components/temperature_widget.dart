import 'package:flutter/material.dart';
import 'package:weather_application/feature_current_weather/controllers/weather_store.dart';
import 'package:weather_application/feature_current_weather/models/temperature_model.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({required this.temperature, super.key});

  final TemperatureModel temperature;

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

Map<String, int> mapTemperature = {};

class _TemperatureWidgetState extends State<TemperatureWidget> {
  final controller = WeatherStore();
  Map<String, int> getTemperature() {
    mapTemperature.addAll({
      'temperature': widget.temperature.temp - 273,
      'temperature_min': widget.temperature.tempMin - 273,
      'temperature_max': widget.temperature.tempMax - 273,
      'humidity': widget.temperature.humidity,
    });
    return mapTemperature;
  }

  @override
  void initState() {
    getTemperature();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff3d254e),
            Color(0xff26404a),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${mapTemperature['temperature']} ºC',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/temp_max.png',
                  width: 20,
                ),
                Text(
                  'Max: ${mapTemperature['temperature_max']} ºC',
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/temp_min.png',
                  width: 20,
                ),
                Text(
                  'Min: ${mapTemperature['temperature_min']} ºC',
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/gota.png',
                  width: 20,
                ),
                Text(
                  'Umidade: ${mapTemperature['humidity']}%',
                  style: const TextStyle(
                    color: Colors.white54,
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
