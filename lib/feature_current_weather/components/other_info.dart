import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unixtime/unixtime.dart';
import 'package:weather_application/feature_current_weather/controllers/weather_store.dart';
import 'package:weather_application/feature_current_weather/models/other_info_model.dart';

class OtherInfoWidget extends StatefulWidget {
  const OtherInfoWidget({required this.otherInfo, super.key});

  final OtherInfo otherInfo;

  @override
  State<OtherInfoWidget> createState() => _OtherInfoWidgetState();
}

Map<String, dynamic> mapOtherInfo = {};

class _OtherInfoWidgetState extends State<OtherInfoWidget> {
  final controller = WeatherStore();
  Map<String, dynamic> getOtherInfo() {
    mapOtherInfo.addAll({
      'sunrise': DateFormat("HH:mm:ss")
          .format(widget.otherInfo.sunrise.toUnixTime(isUtc: false)),
      'sunset': DateFormat("HH:mm:ss").format(
        widget.otherInfo.sunset.toUnixTime(isUtc: false),
      ),
      'windSpeed': widget.otherInfo.windSpeed,
      'pressure': widget.otherInfo.pressure,
    });
    return mapOtherInfo;
  }

  @override
  void initState() {
    super.initState();
    getOtherInfo();
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
            const SizedBox(
              height: 8,
            ),
            Text(
              'Outros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/image/sol.png',
                  width: 20,
                ),
                Text(
                  'Nascer: ${mapOtherInfo['sunrise']}',
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
                  'assets/image/sol.png',
                  width: 20,
                ),
                Text(
                  'Por: ${mapOtherInfo['sunset']}',
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
                  'assets/image/wind.png',
                  width: 20,
                ),
                Text(
                  'Corrente: ${mapOtherInfo['windSpeed']} m/s',
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
