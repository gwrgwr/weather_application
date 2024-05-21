import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/components/app_bar_widget.dart';
import 'package:weather_application/components/other_info.dart';
import 'package:weather_application/components/shimmer_widget.dart';
import 'package:weather_application/components/temperature_widget.dart';
import 'package:weather_application/controllers/weather_state.dart';
import 'package:weather_application/controllers/weather_store.dart';
import 'package:weather_application/data/data_to_file.dart';
import 'package:weather_application/data/forecast_weather.dart';
import 'package:weather_application/models/other_info_model.dart';
import 'package:weather_application/models/temperature_model.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/weather_description.dart';
import 'package:weather_application/utils/weather_icon.dart';
import 'package:weather_application/utils/weather_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = WeatherStore();
  late final Widget widgetTempo;
  late final String descriptionText;
  late final String mainText;
  Weather getWeather() {
    final weather =
        (controller.value as WeatherSuccessState).weatherInfo[0] as Weather;
    return weather;
  }

  OtherInfo getOtherInfo() {
    final otherInfo =
        (controller.value as WeatherSuccessState).weatherInfo[2] as OtherInfo;
    return otherInfo;
  }

  TemperatureModel getTemperature() {
    final temperature = (controller.value as WeatherSuccessState).weatherInfo[1]
        as TemperatureModel;
    return temperature;
  }

  void weatherTexts() {
    final weather = getWeather();
    String icon = weather.icon;
    widgetTempo = Lottie.asset(WeatherIcon.iconValues[icon] ?? '01d');
    String description = weather.description;
    descriptionText =
        WeatherDescription.mapDescription[description] ?? 'clear sky';
    String main = weather.main;
    mainText = WeatherTitle.mapTitle[main] ?? 'Clear';
  }

  final fileData = DataToFile();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller.getWeatherData();
      if (controller.value is WeatherSuccessState) {
        weatherTexts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff3D254E),
            Color(0xff360E4D),
            Color(0xff0F0E0E),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppBarWidget(
                  weatherStore: controller,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, state, child) {
                    if (state is WeatherLoadingState) {
                      return const ShimmerWidget();
                    }
              
                    if (state is WeatherSuccessState) {
                      List<Widget> list = [
                        TemperatureWidget(
                          temperature: getTemperature(),
                        ),
                        OtherInfoWidget(
                          otherInfo: getOtherInfo(),
                        )
                      ];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mainText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            descriptionText,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          widgetTempo,
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: list.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              return list[index];
                            },
                          )
                        ],
                      );
                    }
              
                    if (state is WeatherErrorState) {
                      return Text(state.message);
                    }
              
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
