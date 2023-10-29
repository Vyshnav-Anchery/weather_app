// // To parse this JSON data, do
// //
// //     final foreCastWeatherModel = foreCastWeatherModelFromJson(jsonString);

// import 'dart:convert';

// ForeCastWeatherModel foreCastWeatherModelFromJson(String str) => ForeCastWeatherModel.fromJson(json.decode(str));

// String foreCastWeatherModelToJson(ForeCastWeatherModel data) => json.encode(data.toJson());

// class ForeCastWeatherModel {
//     final Location? location;
//     final Current? current;
//     final Forecast? forecast;

//     ForeCastWeatherModel({
//         this.location,
//         this.current,
//         this.forecast,
//     });

//     factory ForeCastWeatherModel.fromJson(Map<String, dynamic> json) => ForeCastWeatherModel(
//         location: json["location"] == null ? null : Location.fromJson(json["location"]),
//         current: json["current"] == null ? null : Current.fromJson(json["current"]),
//         forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "location": location?.toJson(),
//         "current": current?.toJson(),
//         "forecast": forecast?.toJson(),
//     };
// }

// class Current {
//     final int? lastUpdatedEpoch;
//     final String? lastUpdated;
//     final double? tempC;
//     final double? tempF;
//     final int? isDay;
//     final Condition? condition;
//     final double? windMph;
//     final double? windKph;
//     final int? windDegree;
//     final String? windDir;
//     final double? pressureMb;
//     final double? pressureIn;
//     final double? precipMm;
//     final double? precipIn;
//     final int? humidity;
//     final int? cloud;
//     final double? feelslikeC;
//     final double? feelslikeF;
//     final double? visKm;
//     final double? visMiles;
//     final double? uv;
//     final double? gustMph;
//     final double? gustKph;

//     Current({
//         this.lastUpdatedEpoch,
//         this.lastUpdated,
//         this.tempC,
//         this.tempF,
//         this.isDay,
//         this.condition,
//         this.windMph,
//         this.windKph,
//         this.windDegree,
//         this.windDir,
//         this.pressureMb,
//         this.pressureIn,
//         this.precipMm,
//         this.precipIn,
//         this.humidity,
//         this.cloud,
//         this.feelslikeC,
//         this.feelslikeF,
//         this.visKm,
//         this.visMiles,
//         this.uv,
//         this.gustMph,
//         this.gustKph,
//     });

//     factory Current.fromJson(Map<String, dynamic> json) => Current(
//         lastUpdatedEpoch: json["last_updated_epoch"],
//         lastUpdated: json["last_updated"],
//         tempC: json["temp_c"],
//         tempF: json["temp_f"]?.toDouble(),
//         isDay: json["is_day"],
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"],
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"],
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         visKm: json["vis_km"],
//         visMiles: json["vis_miles"],
//         uv: json["uv"],
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "last_updated_epoch": lastUpdatedEpoch,
//         "last_updated": lastUpdated,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "uv": uv,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//     };
// }

// class Condition {
//     final Text? text;
//     final String? icon;
//     final int? code;

//     Condition({
//         this.text,
//         this.icon,
//         this.code,
//     });

//     factory Condition.fromJson(Map<String, dynamic> json) => Condition(
//         text: textValues.map[json["text"]]!,
//         icon: json["icon"],
//         code: json["code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "text": textValues.reverse[text],
//         "icon": icon,
//         "code": code,
//     };
// }

// enum Text {
//     CLEAR,
//     MIST,
//     PARTLY_CLOUDY,
//     PATCHY_RAIN_POSSIBLE,
//     SUNNY
// }

// final textValues = EnumValues({
//     "Clear": Text.CLEAR,
//     "Mist": Text.MIST,
//     "Partly cloudy": Text.PARTLY_CLOUDY,
//     "Patchy rain possible": Text.PATCHY_RAIN_POSSIBLE,
//     "Sunny": Text.SUNNY
// });

// class Forecast {
//     final List<Forecastday>? forecastday;

//     Forecast({
//         this.forecastday,
//     });

//     factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
//         forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "forecastday": forecastday == null ? [] : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
//     };
// }

// class Forecastday {
//     final DateTime? date;
//     final int? dateEpoch;
//     final Day? day;
//     final Astro? astro;
//     final List<Hour>? hour;

//     Forecastday({
//         this.date,
//         this.dateEpoch,
//         this.day,
//         this.astro,
//         this.hour,
//     });

//     factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         dateEpoch: json["date_epoch"],
//         day: json["day"] == null ? null : Day.fromJson(json["day"]),
//         astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
//         hour: json["hour"] == null ? [] : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "date_epoch": dateEpoch,
//         "day": day?.toJson(),
//         "astro": astro?.toJson(),
//         "hour": hour == null ? [] : List<dynamic>.from(hour!.map((x) => x.toJson())),
//     };
// }

// class Astro {
//     final String? sunrise;
//     final String? sunset;
//     final String? moonrise;
//     final String? moonset;
//     final String? moonPhase;
//     final int? moonIllumination;
//     final int? isMoonUp;
//     final int? isSunUp;

//     Astro({
//         this.sunrise,
//         this.sunset,
//         this.moonrise,
//         this.moonset,
//         this.moonPhase,
//         this.moonIllumination,
//         this.isMoonUp,
//         this.isSunUp,
//     });

//     factory Astro.fromJson(Map<String, dynamic> json) => Astro(
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//         moonrise: json["moonrise"],
//         moonset: json["moonset"],
//         moonPhase: json["moon_phase"],
//         moonIllumination: json["moon_illumination"],
//         isMoonUp: json["is_moon_up"],
//         isSunUp: json["is_sun_up"],
//     );

//     Map<String, dynamic> toJson() => {
//         "sunrise": sunrise,
//         "sunset": sunset,
//         "moonrise": moonrise,
//         "moonset": moonset,
//         "moon_phase": moonPhase,
//         "moon_illumination": moonIllumination,
//         "is_moon_up": isMoonUp,
//         "is_sun_up": isSunUp,
//     };
// }

// class Day {
//     final double? maxtempC;
//     final double? maxtempF;
//     final double? mintempC;
//     final double? mintempF;
//     final int? avgtempC;
//     final double? avgtempF;
//     final double? maxwindMph;
//     final double? maxwindKph;
//     final double? totalprecipMm;
//     final double? totalprecipIn;
//     final int? totalsnowCm;
//     final double? avgvisKm;
//     final int? avgvisMiles;
//     final int? avghumidity;
//     final int? dailyWillItRain;
//     final int? dailyChanceOfRain;
//     final int? dailyWillItSnow;
//     final int? dailyChanceOfSnow;
//     final Condition? condition;
//     final int? uv;

//     Day({
//         this.maxtempC,
//         this.maxtempF,
//         this.mintempC,
//         this.mintempF,
//         this.avgtempC,
//         this.avgtempF,
//         this.maxwindMph,
//         this.maxwindKph,
//         this.totalprecipMm,
//         this.totalprecipIn,
//         this.totalsnowCm,
//         this.avgvisKm,
//         this.avgvisMiles,
//         this.avghumidity,
//         this.dailyWillItRain,
//         this.dailyChanceOfRain,
//         this.dailyWillItSnow,
//         this.dailyChanceOfSnow,
//         this.condition,
//         this.uv,
//     });

//     factory Day.fromJson(Map<String, dynamic> json) => Day(
//         maxtempC: json["maxtemp_c"]?.toDouble(),
//         maxtempF: json["maxtemp_f"]?.toDouble(),
//         mintempC: json["mintemp_c"]?.toDouble(),
//         mintempF: json["mintemp_f"]?.toDouble(),
//         avgtempC: json["avgtemp_c"],
//         avgtempF: json["avgtemp_f"]?.toDouble(),
//         maxwindMph: json["maxwind_mph"]?.toDouble(),
//         maxwindKph: json["maxwind_kph"]?.toDouble(),
//         totalprecipMm: json["totalprecip_mm"]?.toDouble(),
//         totalprecipIn: json["totalprecip_in"]?.toDouble(),
//         totalsnowCm: json["totalsnow_cm"],
//         avgvisKm: json["avgvis_km"]?.toDouble(),
//         avgvisMiles: json["avgvis_miles"],
//         avghumidity: json["avghumidity"],
//         dailyWillItRain: json["daily_will_it_rain"],
//         dailyChanceOfRain: json["daily_chance_of_rain"],
//         dailyWillItSnow: json["daily_will_it_snow"],
//         dailyChanceOfSnow: json["daily_chance_of_snow"],
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         uv: json["uv"],
//     );

//     Map<String, dynamic> toJson() => {
//         "maxtemp_c": maxtempC,
//         "maxtemp_f": maxtempF,
//         "mintemp_c": mintempC,
//         "mintemp_f": mintempF,
//         "avgtemp_c": avgtempC,
//         "avgtemp_f": avgtempF,
//         "maxwind_mph": maxwindMph,
//         "maxwind_kph": maxwindKph,
//         "totalprecip_mm": totalprecipMm,
//         "totalprecip_in": totalprecipIn,
//         "totalsnow_cm": totalsnowCm,
//         "avgvis_km": avgvisKm,
//         "avgvis_miles": avgvisMiles,
//         "avghumidity": avghumidity,
//         "daily_will_it_rain": dailyWillItRain,
//         "daily_chance_of_rain": dailyChanceOfRain,
//         "daily_will_it_snow": dailyWillItSnow,
//         "daily_chance_of_snow": dailyChanceOfSnow,
//         "condition": condition?.toJson(),
//         "uv": uv,
//     };
// }

// class Hour {
//     final int? timeEpoch;
//     final String? time;
//     final double? tempC;
//     final double? tempF;
//     final int? isDay;
//     final Condition? condition;
//     final double? windMph;
//     final double? windKph;
//     final int? windDegree;
//     final String? windDir;
//     final int? pressureMb;
//     final double? pressureIn;
//     final double? precipMm;
//     final double? precipIn;
//     final int? humidity;
//     final int? cloud;
//     final double? feelslikeC;
//     final double? feelslikeF;
//     final double? windchillC;
//     final double? windchillF;
//     final double? heatindexC;
//     final double? heatindexF;
//     final double? dewpointC;
//     final double? dewpointF;
//     final int? willItRain;
//     final int? chanceOfRain;
//     final int? willItSnow;
//     final int? chanceOfSnow;
//     final int? visKm;
//     final int? visMiles;
//     final double? gustMph;
//     final double? gustKph;
//     final int? uv;

//     Hour({
//         this.timeEpoch,
//         this.time,
//         this.tempC,
//         this.tempF,
//         this.isDay,
//         this.condition,
//         this.windMph,
//         this.windKph,
//         this.windDegree,
//         this.windDir,
//         this.pressureMb,
//         this.pressureIn,
//         this.precipMm,
//         this.precipIn,
//         this.humidity,
//         this.cloud,
//         this.feelslikeC,
//         this.feelslikeF,
//         this.windchillC,
//         this.windchillF,
//         this.heatindexC,
//         this.heatindexF,
//         this.dewpointC,
//         this.dewpointF,
//         this.willItRain,
//         this.chanceOfRain,
//         this.willItSnow,
//         this.chanceOfSnow,
//         this.visKm,
//         this.visMiles,
//         this.gustMph,
//         this.gustKph,
//         this.uv,
//     });

//     factory Hour.fromJson(Map<String, dynamic> json) => Hour(
//         timeEpoch: json["time_epoch"],
//         time: json["time"],
//         tempC: json["temp_c"]?.toDouble(),
//         tempF: json["temp_f"]?.toDouble(),
//         isDay: json["is_day"],
//         condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"]?.toDouble(),
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"]?.toDouble(),
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         windchillC: json["windchill_c"]?.toDouble(),
//         windchillF: json["windchill_f"]?.toDouble(),
//         heatindexC: json["heatindex_c"]?.toDouble(),
//         heatindexF: json["heatindex_f"]?.toDouble(),
//         dewpointC: json["dewpoint_c"]?.toDouble(),
//         dewpointF: json["dewpoint_f"]?.toDouble(),
//         willItRain: json["will_it_rain"],
//         chanceOfRain: json["chance_of_rain"],
//         willItSnow: json["will_it_snow"],
//         chanceOfSnow: json["chance_of_snow"],
//         visKm: json["vis_km"],
//         visMiles: json["vis_miles"],
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//         uv: json["uv"],
//     );

//     Map<String, dynamic> toJson() => {
//         "time_epoch": timeEpoch,
//         "time": time,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition?.toJson(),
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "windchill_c": windchillC,
//         "windchill_f": windchillF,
//         "heatindex_c": heatindexC,
//         "heatindex_f": heatindexF,
//         "dewpoint_c": dewpointC,
//         "dewpoint_f": dewpointF,
//         "will_it_rain": willItRain,
//         "chance_of_rain": chanceOfRain,
//         "will_it_snow": willItSnow,
//         "chance_of_snow": chanceOfSnow,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//         "uv": uv,
//     };
// }

// class Location {
//     final String? name;
//     final String? region;
//     final String? country;
//     final double? lat;
//     final double? lon;
//     final String? tzId;
//     final int? localtimeEpoch;
//     final String? localtime;

//     Location({
//         this.name,
//         this.region,
//         this.country,
//         this.lat,
//         this.lon,
//         this.tzId,
//         this.localtimeEpoch,
//         this.localtime,
//     });

//     factory Location.fromJson(Map<String, dynamic> json) => Location(
//         name: json["name"],
//         region: json["region"],
//         country: json["country"],
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//         tzId: json["tz_id"],
//         localtimeEpoch: json["localtime_epoch"],
//         localtime: json["localtime"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "region": region,
//         "country": country,
//         "lat": lat,
//         "lon": lon,
//         "tz_id": tzId,
//         "localtime_epoch": localtimeEpoch,
//         "localtime": localtime,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }

class ForeCastWeatherModel {
  ForeCastWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final Location location;
  late final Current current;
  late final Forecast forecast;

  ForeCastWeatherModel.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    data['forecast'] = forecast.toJson();
    return data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });
  late final int lastUpdatedEpoch;
  late final String lastUpdated;
  late final double tempC;
  late final double tempF;
  late final int isDay;
  late final Condition condition;
  late final double windMph;
  late final double windKph;
  late final int windDegree;
  late final String windDir;
  late final double pressureMb;
  late final double pressureIn;
  late final double precipMm;
  late final double precipIn;
  late final int humidity;
  late final int cloud;
  late final double feelslikeC;
  late final double feelslikeF;
  late final double visKm;
  late final double visMiles;
  late final double uv;
  late final double gustMph;
  late final double gustKph;

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final int code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  Forecast({
    required this.forecastday,
  });
  late final List<Forecastday> forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = List.from(json['forecastday'])
        .map((e) => Forecastday.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['forecastday'] = forecastday.map((e) => e.toJson()).toList();
    return data;
  }
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final String date;
  late final int dateEpoch;
  late final Day day;
  late final Astro astro;
  late final List<Hour> hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e) => Hour.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    data['day'] = day.toJson();
    data['astro'] = astro.toJson();
    data['hour'] = hour.map((e) => e.toJson()).toList();
    return data;
  }
}

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });
  late final double maxtempC;
  late final double maxtempF;
  late final double mintempC;
  late final double mintempF;
  late final double avgtempC;
  late final double avgtempF;
  late final double maxwindMph;
  late final double maxwindKph;
  late final double totalprecipMm;
  late final double totalprecipIn;
  late final double totalsnowCm;
  late final double avgvisKm;
  late final double avgvisMiles;
  late final double avghumidity;
  late final int dailyWillItRain;
  late final int dailyChanceOfRain;
  late final int dailyWillItSnow;
  late final int dailyChanceOfSnow;
  late final Condition condition;
  late final double uv;

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['totalsnow_cm'] = totalsnowCm;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    data['condition'] = condition.toJson();
    data['uv'] = uv;
    return data;
  }
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });
  late final String sunrise;
  late final String sunset;
  late final String moonrise;
  late final String moonset;
  late final String moonPhase;
  late final int moonIllumination;
  late final int isMoonUp;
  late final int isSunUp;

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    data['is_moon_up'] = isMoonUp;
    data['is_sun_up'] = isSunUp;
    return data;
  }
}

class Hour {
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });
  late final int timeEpoch;
  late final String time;
  late final double? tempC;
  late final double? tempF;
  late final int isDay;
  late final Condition condition;
  late final double? windMph;
  late final double? windKph;
  late final int windDegree;
  late final String windDir;
  late final double? pressureMb;
  late final double pressureIn;
  late final double? precipMm;
  late final double? precipIn;
  late final int humidity;
  late final int cloud;
  late final double? feelslikeC;
  late final double? feelslikeF;
  late final double? windchillC;
  late final double? windchillF;
  late final double? heatindexC;
  late final double? heatindexF;
  late final double? dewpointC;
  late final double? dewpointF;
  late final int willItRain;
  late final int chanceOfRain;
  late final int willItSnow;
  late final int chanceOfSnow;
  late final double visKm;
  late final double visMiles;
  late final double? gustMph;
  late final double? gustKph;
  late final double? uv;

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}
