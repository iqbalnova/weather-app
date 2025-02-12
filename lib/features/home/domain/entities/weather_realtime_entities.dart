class WeatherRealtimeEntity {
  final DateTime time;
  final double cloudBase;
  final double cloudCeiling;
  final int cloudCover;
  final double dewPoint;
  final double freezingRainIntensity;
  final double hailProbability;
  final double hailSize;
  final int humidity;
  final int precipitationProbability;
  final int pressureSeaLevel;
  final int pressureSurfaceLevel;
  final double rainIntensity;
  final double sleetIntensity;
  final double snowIntensity;
  final double temperature;
  final double temperatureApparent;
  final int uvHealthConcern;
  final int uvIndex;
  final int visibility;
  final int weatherCode;
  final int windDirection;
  final double windGust;
  final double windSpeed;
  final double latitude;
  final double longitude;

  WeatherRealtimeEntity({
    required this.time,
    required this.cloudBase,
    required this.cloudCeiling,
    required this.cloudCover,
    required this.dewPoint,
    required this.freezingRainIntensity,
    required this.hailProbability,
    required this.hailSize,
    required this.humidity,
    required this.precipitationProbability,
    required this.pressureSeaLevel,
    required this.pressureSurfaceLevel,
    required this.rainIntensity,
    required this.sleetIntensity,
    required this.snowIntensity,
    required this.temperature,
    required this.temperatureApparent,
    required this.uvHealthConcern,
    required this.uvIndex,
    required this.visibility,
    required this.weatherCode,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
    required this.latitude,
    required this.longitude,
  });
}
