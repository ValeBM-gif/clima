import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '2ce9bd7451505cbdc0eb489d3b984b38';
const weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

double latitude = 0;
double longitude = 0;

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherMapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherMapURL?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case in';
    }
  }
}
