import 'dart:convert';

import 'package:isar/isar.dart';

part 'csc.m.g.dart';

List<CSC> cscFromJson(String str) =>
    List<CSC>.from(json.decode(str).map((x) => CSC.fromJson(x)));

String cscToJson(List<CSC> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@collection
class CSC {
  CSC({
    this.dataID,
    this.name,
    this.iso3,
    this.iso2,
    this.numericCode,
    this.phoneCode,
    this.capital,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.tld,
    this.native,
    this.region,
    this.subregion,
    this.timezones,
    this.translations,
    this.latitude,
    this.longitude,
    this.emoji,
    this.emojiU,
    this.states,
  });

  Id? id;
  int? dataID;
  String? name;
  String? iso3;
  String? iso2;
  String? numericCode;
  String? phoneCode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? native;
  String? region;
  String? subregion;
  List<Timezone>? timezones;
  Translations? translations;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;
  List<State>? states;

  CSC copyWith({
    int? dataID,
    String? name,
    String? iso3,
    String? iso2,
    String? numericCode,
    String? phoneCode,
    String? capital,
    String? currency,
    String? currencyName,
    String? currencySymbol,
    String? tld,
    String? native,
    String? region,
    String? subregion,
    List<Timezone>? timezones,
    Translations? translations,
    String? latitude,
    String? longitude,
    String? emoji,
    String? emojiU,
    List<State>? states,
  }) =>
      CSC(
        dataID: dataID ?? this.dataID,
        name: name ?? this.name,
        iso3: iso3 ?? this.iso3,
        iso2: iso2 ?? this.iso2,
        numericCode: numericCode ?? this.numericCode,
        phoneCode: phoneCode ?? this.phoneCode,
        capital: capital ?? this.capital,
        currency: currency ?? this.currency,
        currencyName: currencyName ?? this.currencyName,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        tld: tld ?? this.tld,
        native: native ?? this.native,
        region: region ?? this.region,
        subregion: subregion ?? this.subregion,
        timezones: timezones ?? this.timezones,
        translations: translations ?? this.translations,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        emoji: emoji ?? this.emoji,
        emojiU: emojiU ?? this.emojiU,
        states: states ?? this.states,
      );

  factory CSC.fromRawJson(String str) => CSC.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CSC.fromJson(Map<String, dynamic> json) => CSC(
        dataID: json['id'],
        name: json['name'],
        iso3: json['iso3'],
        iso2: json['iso2'],
        numericCode: json['numeric_code'],
        phoneCode: json['phone_code'],
        capital: json['capital'],
        currency: json['currency'],
        currencyName: json['currency_name'],
        currencySymbol: json['currency_symbol'],
        tld: json['tld'],
        native: json['native'],
        region: json['region'],
        subregion: json['subregion'],
        timezones: json['timezones'] == null
            ? []
            : List<Timezone>.from(
                json['timezones']!.map((x) => Timezone.fromJson(x))),
        translations: json['translations'] == null
            ? null
            : Translations.fromJson(json['translations']),
        latitude: json['latitude'],
        longitude: json['longitude'],
        emoji: json['emoji'],
        emojiU: json['emojiU'],
        states: json['states'] == null
            ? []
            : List<State>.from(json['states']!.map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': dataID,
        'name': name,
        'iso3': iso3,
        'iso2': iso2,
        'numeric_code': numericCode,
        'phone_code': phoneCode,
        'capital': capital,
        'currency': currency,
        'currency_name': currencyName,
        'currency_symbol': currencySymbol,
        'tld': tld,
        'native': native,
        'region': region,
        'subregion': subregion,
        'timezones': timezones == null
            ? []
            : List<dynamic>.from(timezones!.map((x) => x.toJson())),
        'translations': translations?.toJson(),
        'latitude': latitude,
        'longitude': longitude,
        'emoji': emoji,
        'emojiU': emojiU,
        'states': states == null
            ? []
            : List<dynamic>.from(states!.map((x) => x.toJson())),
      };
}

@embedded
class State {
  State({
    this.dataID,
    this.name,
    this.stateCode,
    this.latitude,
    this.longitude,
    this.cities,
  });

  int? dataID;
  String? name;
  String? stateCode;
  String? latitude;
  String? longitude;
  List<City>? cities;

  State copyWith({
    int? dataID,
    String? name,
    String? stateCode,
    String? latitude,
    String? longitude,
    List<City>? cities,
  }) =>
      State(
        dataID: dataID ?? this.dataID,
        name: name ?? this.name,
        stateCode: stateCode ?? this.stateCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        cities: cities ?? this.cities,
      );

  factory State.fromRawJson(String str) => State.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory State.fromJson(Map<String, dynamic> json) => State(
        dataID: json['id'],
        name: json['name'],
        stateCode: json['state_code'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        cities: json['cities'] == null
            ? []
            : List<City>.from(json['cities']!.map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': dataID,
        'name': name,
        'state_code': stateCode,
        'latitude': latitude,
        'longitude': longitude,
        'cities': cities == null
            ? []
            : List<dynamic>.from(cities!.map((x) => x.toJson())),
      };
}

@embedded
class City {
  City({
    this.dataID,
    this.name,
    this.latitude,
    this.longitude,
  });

  int? dataID;
  String? name;
  String? latitude;
  String? longitude;

  City copyWith({
    int? dataID,
    String? name,
    String? latitude,
    String? longitude,
  }) =>
      City(
        dataID: dataID ?? this.dataID,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        dataID: json['id'],
        name: json['name'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'id': dataID,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
      };
}

@embedded
class Timezone {
  Timezone({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });

  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  Timezone copyWith({
    String? zoneName,
    int? gmtOffset,
    String? gmtOffsetName,
    String? abbreviation,
    String? tzName,
  }) =>
      Timezone(
        zoneName: zoneName ?? this.zoneName,
        gmtOffset: gmtOffset ?? this.gmtOffset,
        gmtOffsetName: gmtOffsetName ?? this.gmtOffsetName,
        abbreviation: abbreviation ?? this.abbreviation,
        tzName: tzName ?? this.tzName,
      );

  factory Timezone.fromRawJson(String str) =>
      Timezone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        zoneName: json['zoneName'],
        gmtOffset: json['gmtOffset'],
        gmtOffsetName: json['gmtOffsetName'],
        abbreviation: json['abbreviation'],
        tzName: json['tzName'],
      );

  Map<String, dynamic> toJson() => {
        'zoneName': zoneName,
        'gmtOffset': gmtOffset,
        'gmtOffsetName': gmtOffsetName,
        'abbreviation': abbreviation,
        'tzName': tzName,
      };
}

@embedded
class Translations {
  Translations({
    this.kr,
    this.ptBr,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.cn,
    this.tr,
  });

  String? kr;
  String? ptBr;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? cn;
  String? tr;

  Translations copyWith({
    String? kr,
    String? ptBr,
    String? pt,
    String? nl,
    String? hr,
    String? fa,
    String? de,
    String? es,
    String? fr,
    String? ja,
    String? it,
    String? cn,
    String? tr,
  }) =>
      Translations(
        kr: kr ?? this.kr,
        ptBr: ptBr ?? this.ptBr,
        pt: pt ?? this.pt,
        nl: nl ?? this.nl,
        hr: hr ?? this.hr,
        fa: fa ?? this.fa,
        de: de ?? this.de,
        es: es ?? this.es,
        fr: fr ?? this.fr,
        ja: ja ?? this.ja,
        it: it ?? this.it,
        cn: cn ?? this.cn,
        tr: tr ?? this.tr,
      );

  factory Translations.fromRawJson(String str) =>
      Translations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        kr: json['kr'],
        ptBr: json['pt-BR'],
        pt: json['pt'],
        nl: json['nl'],
        hr: json['hr'],
        fa: json['fa'],
        de: json['de'],
        es: json['es'],
        fr: json['fr'],
        ja: json['ja'],
        it: json['it'],
        cn: json['cn'],
        tr: json['tr'],
      );

  Map<String, dynamic> toJson() => {
        'kr': kr,
        'pt-BR': ptBr,
        'pt': pt,
        'nl': nl,
        'hr': hr,
        'fa': fa,
        'de': de,
        'es': es,
        'fr': fr,
        'ja': ja,
        'it': it,
        'cn': cn,
        'tr': tr,
      };
}
