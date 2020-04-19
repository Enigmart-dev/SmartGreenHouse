import 'package:flutter/material.dart';

class GreenHouseMeasurement {
  Temperature temperature;
  Humidity humidity;
  WaterLevel waterLevel;
  Brightness brightness;

  GreenHouseMeasurement({
    this.temperature,
    this.humidity,
    this.waterLevel,
    this.brightness
  });

  factory GreenHouseMeasurement.fromJson(Map<String, dynamic> json) {
    return GreenHouseMeasurement(
      temperature: Temperature(temp: double.parse(json["temperature"])),
      humidity: Humidity(hum: double.parse(json["humidity_D"])),
      waterLevel: WaterLevel(level: double.parse(json["waterlevel"])),
      brightness: Brightness(brightness: double.parse(json["light"])),
    );
  }
}

class Temperature {
  double temp;
  String unit = "°C";
  Temperature({@required this.temp}) : assert(temp > 0 && temp < 55);
}

class Humidity {
  double hum;
  String unit = "%";
  Humidity({@required this.hum}) : assert(hum > 0 && hum < 100);
}

class WaterLevel {
  double level;
  String unit = "%";
  WaterLevel({@required this.level}) : assert(level > 0 && level < 100);
}

class Brightness {
  double brightness;
  String unit = "lm";
  Brightness({@required this.brightness}) : assert(brightness > 0 && brightness < 100);
}

