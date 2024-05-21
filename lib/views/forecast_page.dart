import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/controllers/forecast_states.dart';
import 'package:weather_application/controllers/forecast_store.dart';
import 'package:weather_application/data/forecast_weather.dart';
import 'package:weather_application/models/weather_model.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final forecastStore = ForecastStore();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await forecastStore.getForecastWeather();
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
            Color(0xffdba225),
            Color(0xff5867bd),
            Color(0xff321c34),
          ],
        ),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: forecastStore,
              builder: (context, state, child) {
                if (state is ForecastSuccessState) {
                  final list = state.forecastModel.list;
                  final List<String> listeste = [];
                  for (var dt in state.forecastModel.dateTime) {
                    listeste.add(
                      DateFormat("HH:mm:ss").format(
                        DateTime.parse(dt),
                      ),
                    );
                  }
                  final List<int> teste = [];
                  print(listeste.length);
                  for (var element in listeste) {
                    if(element.contains('12')) {
                      teste.add(listeste.indexWhere((element) => element.contains('12')));
                      listeste.indexWhere((element) => element.contains('12'));
                    }
                  }
                  print(listeste.indexWhere((element) => element.contains('12')));
                  print(teste);
                  return Expanded(
                    child: ListView.separated(
                      itemCount: list.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = list[index];
                        final string = state.forecastModel.dateTime[index];
                        return Container(
                          child: Column(
                            children: [Text(item.main), Text(string)],
                          ),
                        );
                      },
                    ),
                  );
                }

                if (state is ForecastLoadingState) {
                  return CircularProgressIndicator();
                }

                if (state is ForecastErrorState) {
                  return Text(state.message);
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
