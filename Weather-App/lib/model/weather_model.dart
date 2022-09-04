/// coord : {"lon":-122.08,"lat":37.39}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]
/// base : "stations"
/// main : {"temp":282.55,"feels_like":281.86,"temp_min":280.37,"temp_max":284.26,"pressure":1023,"humidity":100}
/// visibility : 10000
/// wind : {"speed":1.5,"deg":350}
/// clouds : {"all":1}
/// dt : 1560350645
/// sys : {"type":1,"id":5122,"message":0.0139,"country":"US","sunrise":1560343627,"sunset":1560396563}
/// timezone : -25200
/// id : 420006353
/// name : "Mountain View"
/// cod : 200

class CurrentResponseModel {
  CurrentResponseModel({
      this.coord, 
      this.weather, 
      this.base, 
      this.main, 
      this.visibility, 
      this.wind, 
      this.clouds, 
      this.dt, 
      this.sys, 
      this.timezone, 
      this.id, 
      this.name, 
      this.cod,});

  CurrentResponseModel.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;
CurrentResponseModel copyWith({  Coord? coord,
  List<Weather>? weather,
  String? base,
  Main? main,
  num? visibility,
  Wind? wind,
  Clouds? clouds,
  num? dt,
  Sys? sys,
  num? timezone,
  num? id,
  String? name,
  num? cod,
}) => CurrentResponseModel(  coord: coord ?? this.coord,
  weather: weather ?? this.weather,
  base: base ?? this.base,
  main: main ?? this.main,
  visibility: visibility ?? this.visibility,
  wind: wind ?? this.wind,
  clouds: clouds ?? this.clouds,
  dt: dt ?? this.dt,
  sys: sys ?? this.sys,
  timezone: timezone ?? this.timezone,
  id: id ?? this.id,
  name: name ?? this.name,
  cod: cod ?? this.cod,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['timezone'] = timezone;
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }

}

/// type : 1
/// id : 5122
/// message : 0.0139
/// country : "US"
/// sunrise : 1560343627
/// sunset : 1560396563

class Sys {
  Sys({
      this.type, 
      this.id, 
      this.message, 
      this.country, 
      this.sunrise, 
      this.sunset,});

  Sys.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  num? type;
  num? id;
  num? message;
  String? country;
  num? sunrise;
  num? sunset;
Sys copyWith({  num? type,
  num? id,
  num? message,
  String? country,
  num? sunrise,
  num? sunset,
}) => Sys(  type: type ?? this.type,
  id: id ?? this.id,
  message: message ?? this.message,
  country: country ?? this.country,
  sunrise: sunrise ?? this.sunrise,
  sunset: sunset ?? this.sunset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['message'] = message;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}

/// all : 1

class Clouds {
  Clouds({
      this.all,});

  Clouds.fromJson(dynamic json) {
    all = json['all'];
  }
  num? all;
Clouds copyWith({  num? all,
}) => Clouds(  all: all ?? this.all,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }

}

/// speed : 1.5
/// deg : 350

class Wind {
  Wind({
      this.speed, 
      this.deg,});

  Wind.fromJson(dynamic json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  num? speed;
  num? deg;
Wind copyWith({  num? speed,
  num? deg,
}) => Wind(  speed: speed ?? this.speed,
  deg: deg ?? this.deg,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }

}

/// temp : 282.55
/// feels_like : 281.86
/// temp_min : 280.37
/// temp_max : 284.26
/// pressure : 1023
/// humidity : 100

class Main {
  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.humidity,});

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
Main copyWith({  num? temp,
  num? feelsLike,
  num? tempMin,
  num? tempMax,
  num? pressure,
  num? humidity,
}) => Main(  temp: temp ?? this.temp,
  feelsLike: feelsLike ?? this.feelsLike,
  tempMin: tempMin ?? this.tempMin,
  tempMax: tempMax ?? this.tempMax,
  pressure: pressure ?? this.pressure,
  humidity: humidity ?? this.humidity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    return map;
  }

}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

class Weather {
  Weather({
      this.id, 
      this.main, 
      this.description, 
      this.icon,});

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  num? id;
  String? main;
  String? description;
  String? icon;
Weather copyWith({  num? id,
  String? main,
  String? description,
  String? icon,
}) => Weather(  id: id ?? this.id,
  main: main ?? this.main,
  description: description ?? this.description,
  icon: icon ?? this.icon,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}

/// lon : -122.08
/// lat : 37.39

class Coord {
  Coord({
      this.lon, 
      this.lat,});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  num? lon;
  num? lat;
Coord copyWith({  num? lon,
  num? lat,
}) => Coord(  lon: lon ?? this.lon,
  lat: lat ?? this.lat,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}