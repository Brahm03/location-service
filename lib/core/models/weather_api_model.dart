
import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
    Location location;
    Current current;
  
    WeatherModel({
        required this.location,
        required this.current,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    num lastUpdatedEpoch;
    String lastUpdated;
    num tempC;
    num tempF;
    num isDay;
    Condition condition;
    num windMph;
    num windKph;
    num windDegree;
    String windDir;
    num pressureMb;
    num pressureIn;
    num precipMm;
    num precipIn;
    num humidity;
    num cloud;
    num feelslikeC;
    num feelslikeF;
    num windchillC;
    num windchillF;
    num heatindexC;
    num heatindexF;
    num dewpointC;
    num dewpointF;
    num visKm;
    num visMiles;
    num uv;
    num gustMph;
    num gustKph;

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
        required this.windchillC,
        required this.windchillF,
        required this.heatindexC,
        required this.heatindexF,
        required this.dewpointC,
        required this.dewpointF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        windchillF: json["windchill_f"]?.toDouble(),
        heatindexC: json["heatindex_c"]?.toDouble(),
        heatindexF: json["heatindex_f"]?.toDouble(),
        dewpointC: json["dewpoint_c"]?.toDouble(),
        dewpointF: json["dewpoint_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"],
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    String text;
    String icon;
    num code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    String name;
    String region;
    String country;
    num lat;
    num lon;
    String tzId;
    num localtimeEpoch;
    String localtime;

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

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
