class WeatherIcon {
  // static String arivan = 'assets/image/clear.json';
  
  static final iconValues = {
    '01d': 'assets/image/clear.json',
    '01n': 'assets/image/night.json',
    '02d': 'assets/image/cloud_sun.json',
    '02n': 'assets/image/cloud_night.json',
    '03d': 'assets/image/cloud.json',
    '03n': 'assets/image/cloud.json',
    '04d': 'assets/image/broken_cloud_sun.json',
    '04n': 'assets/image/broken_cloud_night.json',
    '09d': 'assets/image/rainy.json',
    '09n': 'assets/image/rainy.json',
    '10d': 'assets/image/sun_rainy.json',
    '10n': 'assets/image/night_rainy.json',
    '11d': 'assets/image/sun_stormy.json',
    '11n': 'assets/image/night_stormy.json',
    '13d': 'assets/image/sun_snow.json',
    '13n': 'assets/image/night_snow.json',
    '50d': 'assets/image/mist.json',
    '50n': 'assets/image/mist.json',
  };
}

// const sun = 'sol';
// const cloudy = 'nublado';
// const rain = 'chuva';
// const snow = 'neve';
// const storm = 'tempestade';
// const thunder = 'trovão';

// mixin InformationWeatherHelper {
//   String getImagePath(String weather) => switch (weather.toLowerCase()) {
//         sun => 'assets/images/sun.png',
//         cloudy => 'assets/images/cloudy.png',
//         rain => 'assets/images/rain.png',
//         snow => 'assets/images/snow.png',
//         storm => 'assets/images/storm.png',
//         thunder => 'assets/images/thunder.png',
//         _ => 'assets/images/sun.png',
//       };

// }


// final statusColor = {
//   'A': const Color.fromRGBO(156, 39, 176, 1),
//   'CA': Colors.yellow.shade800,
//   'CM': Colors.yellow.shade800,
//   'FA': Colors.red,
// }; 
