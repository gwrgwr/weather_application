import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/feature_current_weather/components/app_bar_shimmer.dart';
import 'package:weather_application/feature_current_weather/controllers/city_placemarks_store.dart';
import 'package:weather_application/feature_current_weather/controllers/city_placemarks_states.dart';
import 'package:weather_application/feature_current_weather/controllers/weather_store.dart';
import 'package:weather_application/feature_current_weather/data/data_to_file.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({required this.weatherStore, super.key});

  final WeatherStore weatherStore;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String getDateTime() {
    final dateTime = DateTime.now();
    return DateFormat.MMMMd('pt_BR').format(dateTime);
  }

  final cityController = PlacemarkStore();
  final file = DataToFile();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await cityController.getUserCity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = getDateTime();
    return ValueListenableBuilder(
      valueListenable: cityController,
      builder: (context, state, child) {
        if (state is CityPlaceMarkLoadingState) {
          return const AppBarShimmer();
        }

        if (state is CityPlaceMarkErrorState) {
          return Text(state.message);
        }

        if (state is CityPlaceMarkSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.placemarkModel.city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Hoje, $dateFormatted',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    file.writeData([]);
                    Future.wait([
                      widget.weatherStore.getWeatherData(),
                      cityController.getUserCity(),
                    ]);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
