class ForecastModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  ForecastModel({this.location, this.current, this.forecast});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    current =
        json["current"] == null ? null : Current.fromJson(json["current"]);
    forecast =
        json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data["location"] = location?.toJson();
    }
    if (current != null) {
      data["current"] = current?.toJson();
    }
    if (forecast != null) {
      data["forecast"] = forecast?.toJson();
    }
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = json["forecastday"] == null
        ? null
        : (json["forecastday"] as List)
            .map((e) => Forecastday.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data["forecastday"] = forecastday?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  num? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    dateEpoch = json["date_epoch"];
    day = json["day"] == null ? null : Day.fromJson(json["day"]);
    astro = json["astro"] == null ? null : Astro.fromJson(json["astro"]);
    hour = json["hour"] == null
        ? null
        : (json["hour"] as List).map((e) => Hour.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["date_epoch"] = dateEpoch;
    if (day != null) {
      data["day"] = day?.toJson();
    }
    if (astro != null) {
      data["astro"] = astro?.toJson();
    }
    if (hour != null) {
      data["hour"] = hour?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Hour {
  num? timeEpoch;
  String? time;
  num? tempC;
  num? tempF;
  num? isDay;
  Condition2? condition;
  num? windMph;
  num? windKph;
  num? windDegree;
  String? windDir;
  num? pressureMb;
  num? pressureIn;
  num? precipMm;
  num? precipIn;
  num? snowCm;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? feelslikeF;
  num? windchillC;
  num? windchillF;
  num? heatindexC;
  num? heatindexF;
  num? dewpointC;
  num? dewpointF;
  num? willItRain;
  num? chanceOfRain;
  num? willItSnow;
  num? chanceOfSnow;
  num? visKm;
  num? visMiles;
  num? gustMph;
  num? gustKph;
  num? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.snowCm,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json["time_epoch"];
    time = json["time"];
    tempC = json["temp_c"];
    tempF = json["temp_f"];
    isDay = json["is_day"];
    condition = json["condition"] == null
        ? null
        : Condition2.fromJson(json["condition"]);
    windMph = json["wind_mph"];
    windKph = json["wind_kph"];
    windDegree = json["wind_degree"];
    windDir = json["wind_dir"];
    pressureMb = json["pressure_mb"];
    pressureIn = json["pressure_in"];
    precipMm = json["precip_mm"];
    precipIn = json["precip_in"];
    snowCm = json["snow_cm"];
    humidity = json["humidity"];
    cloud = json["cloud"];
    feelslikeC = json["feelslike_c"];
    feelslikeF = json["feelslike_f"];
    windchillC = json["windchill_c"];
    windchillF = json["windchill_f"];
    heatindexC = json["heatindex_c"];
    heatindexF = json["heatindex_f"];
    dewpointC = json["dewpoint_c"];
    dewpointF = json["dewpoint_f"];
    willItRain = json["will_it_rain"];
    chanceOfRain = json["chance_of_rain"];
    willItSnow = json["will_it_snow"];
    chanceOfSnow = json["chance_of_snow"];
    visKm = json["vis_km"];
    visMiles = json["vis_miles"];
    gustMph = json["gust_mph"];
    gustKph = json["gust_kph"];
    uv = json["uv"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["time_epoch"] = timeEpoch;
    data["time"] = time;
    data["temp_c"] = tempC;
    data["temp_f"] = tempF;
    data["is_day"] = isDay;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["wind_mph"] = windMph;
    data["wind_kph"] = windKph;
    data["wind_degree"] = windDegree;
    data["wind_dir"] = windDir;
    data["pressure_mb"] = pressureMb;
    data["pressure_in"] = pressureIn;
    data["precip_mm"] = precipMm;
    data["precip_in"] = precipIn;
    data["snow_cm"] = snowCm;
    data["humidity"] = humidity;
    data["cloud"] = cloud;
    data["feelslike_c"] = feelslikeC;
    data["feelslike_f"] = feelslikeF;
    data["windchill_c"] = windchillC;
    data["windchill_f"] = windchillF;
    data["heatindex_c"] = heatindexC;
    data["heatindex_f"] = heatindexF;
    data["dewpoint_c"] = dewpointC;
    data["dewpoint_f"] = dewpointF;
    data["will_it_rain"] = willItRain;
    data["chance_of_rain"] = chanceOfRain;
    data["will_it_snow"] = willItSnow;
    data["chance_of_snow"] = chanceOfSnow;
    data["vis_km"] = visKm;
    data["vis_miles"] = visMiles;
    data["gust_mph"] = gustMph;
    data["gust_kph"] = gustKph;
    data["uv"] = uv;
    return data;
  }
}

class Condition2 {
  String? text;
  String? icon;
  num? code;

  Condition2({this.text, this.icon, this.code});

  Condition2.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    icon = json["icon"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  num? moonIllumination;
  num? isMoonUp;
  num? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json["sunrise"];
    sunset = json["sunset"];
    moonrise = json["moonrise"];
    moonset = json["moonset"];
    moonPhase = json["moon_phase"];
    moonIllumination = json["moon_illumination"];
    isMoonUp = json["is_moon_up"];
    isSunUp = json["is_sun_up"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    data["moonrise"] = moonrise;
    data["moonset"] = moonset;
    data["moon_phase"] = moonPhase;
    data["moon_illumination"] = moonIllumination;
    data["is_moon_up"] = isMoonUp;
    data["is_sun_up"] = isSunUp;
    return data;
  }
}

class Day {
  num? maxtempC;
  num? maxtempF;
  num? mintempC;
  num? mintempF;
  num? avgtempC;
  num? avgtempF;
  num? maxwindMph;
  num? maxwindKph;
  num? totalprecipMm;
  num? totalprecipIn;
  num? totalsnowCm;
  num? avgvisKm;
  num? avgvisMiles;
  num? avghumidity;
  num? dailyWillItRain;
  num? dailyChanceOfRain;
  num? dailyWillItSnow;
  num? dailyChanceOfSnow;
  Condition1? condition;
  num? uv;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.totalsnowCm,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json["maxtemp_c"];
    maxtempF = json["maxtemp_f"];
    mintempC = json["mintemp_c"];
    mintempF = json["mintemp_f"];
    avgtempC = json["avgtemp_c"];
    avgtempF = json["avgtemp_f"];
    maxwindMph = json["maxwind_mph"];
    maxwindKph = json["maxwind_kph"];
    totalprecipMm = json["totalprecip_mm"];
    totalprecipIn = json["totalprecip_in"];
    totalsnowCm = json["totalsnow_cm"];
    avgvisKm = json["avgvis_km"];
    avgvisMiles = json["avgvis_miles"];
    avghumidity = json["avghumidity"];
    dailyWillItRain = json["daily_will_it_rain"];
    dailyChanceOfRain = json["daily_chance_of_rain"];
    dailyWillItSnow = json["daily_will_it_snow"];
    dailyChanceOfSnow = json["daily_chance_of_snow"];
    condition = json["condition"] == null
        ? null
        : Condition1.fromJson(json["condition"]);
    uv = json["uv"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["maxtemp_c"] = maxtempC;
    data["maxtemp_f"] = maxtempF;
    data["mintemp_c"] = mintempC;
    data["mintemp_f"] = mintempF;
    data["avgtemp_c"] = avgtempC;
    data["avgtemp_f"] = avgtempF;
    data["maxwind_mph"] = maxwindMph;
    data["maxwind_kph"] = maxwindKph;
    data["totalprecip_mm"] = totalprecipMm;
    data["totalprecip_in"] = totalprecipIn;
    data["totalsnow_cm"] = totalsnowCm;
    data["avgvis_km"] = avgvisKm;
    data["avgvis_miles"] = avgvisMiles;
    data["avghumidity"] = avghumidity;
    data["daily_will_it_rain"] = dailyWillItRain;
    data["daily_chance_of_rain"] = dailyChanceOfRain;
    data["daily_will_it_snow"] = dailyWillItSnow;
    data["daily_chance_of_snow"] = dailyChanceOfSnow;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["uv"] = uv;
    return data;
  }
}

class Condition1 {
  String? text;
  String? icon;
  num? code;

  Condition1({this.text, this.icon, this.code});

  Condition1.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    icon = json["icon"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Current {
  num? lastUpdatedEpoch;
  String? lastUpdated;
  num? tempC;
  num? tempF;
  num? isDay;
  Condition? condition;
  num? windMph;
  num? windKph;
  num? windDegree;
  String? windDir;
  num? pressureMb;
  num? pressureIn;
  num? precipMm;
  num? precipIn;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? feelslikeF;
  num? windchillC;
  num? windchillF;
  num? heatindexC;
  num? heatindexF;
  num? dewpointC;
  num? dewpointF;
  num? visKm;
  num? visMiles;
  num? uv;
  num? gustMph;
  num? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json["last_updated_epoch"];
    lastUpdated = json["last_updated"];
    tempC = json["temp_c"];
    tempF = json["temp_f"];
    isDay = json["is_day"];
    condition = json["condition"] == null
        ? null
        : Condition.fromJson(json["condition"]);
    windMph = json["wind_mph"];
    windKph = json["wind_kph"];
    windDegree = json["wind_degree"];
    windDir = json["wind_dir"];
    pressureMb = json["pressure_mb"];
    pressureIn = json["pressure_in"];
    precipMm = json["precip_mm"];
    precipIn = json["precip_in"];
    humidity = json["humidity"];
    cloud = json["cloud"];
    feelslikeC = json["feelslike_c"];
    feelslikeF = json["feelslike_f"];
    windchillC = json["windchill_c"];
    windchillF = json["windchill_f"];
    heatindexC = json["heatindex_c"];
    heatindexF = json["heatindex_f"];
    dewpointC = json["dewpoint_c"];
    dewpointF = json["dewpoint_f"];
    visKm = json["vis_km"];
    visMiles = json["vis_miles"];
    uv = json["uv"];
    gustMph = json["gust_mph"];
    gustKph = json["gust_kph"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["last_updated_epoch"] = lastUpdatedEpoch;
    data["last_updated"] = lastUpdated;
    data["temp_c"] = tempC;
    data["temp_f"] = tempF;
    data["is_day"] = isDay;
    if (condition != null) {
      data["condition"] = condition?.toJson();
    }
    data["wind_mph"] = windMph;
    data["wind_kph"] = windKph;
    data["wind_degree"] = windDegree;
    data["wind_dir"] = windDir;
    data["pressure_mb"] = pressureMb;
    data["pressure_in"] = pressureIn;
    data["precip_mm"] = precipMm;
    data["precip_in"] = precipIn;
    data["humidity"] = humidity;
    data["cloud"] = cloud;
    data["feelslike_c"] = feelslikeC;
    data["feelslike_f"] = feelslikeF;
    data["windchill_c"] = windchillC;
    data["windchill_f"] = windchillF;
    data["heatindex_c"] = heatindexC;
    data["heatindex_f"] = heatindexF;
    data["dewpoint_c"] = dewpointC;
    data["dewpoint_f"] = dewpointF;
    data["vis_km"] = visKm;
    data["vis_miles"] = visMiles;
    data["uv"] = uv;
    data["gust_mph"] = gustMph;
    data["gust_kph"] = gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  num? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    icon = json["icon"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    data["icon"] = icon;
    data["code"] = code;
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  num? lat;
  num? lon;
  String? tzId;
  num? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    region = json["region"];
    country = json["country"];
    lat = json["lat"];
    lon = json["lon"];
    tzId = json["tz_id"];
    localtimeEpoch = json["localtime_epoch"];
    localtime = json["localtime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["region"] = region;
    data["country"] = country;
    data["lat"] = lat;
    data["lon"] = lon;
    data["tz_id"] = tzId;
    data["localtime_epoch"] = localtimeEpoch;
    data["localtime"] = localtime;
    return data;
  }
}
