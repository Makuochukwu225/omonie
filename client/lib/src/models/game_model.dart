import 'dart:convert';

import 'package:omonie/src/constants/assets.dart';

class GameModel {
  String? title;
  String? subtitle;
  String? src;
  GameModel({
    this.title,
    this.subtitle,
    this.src,
  });

  GameModel copyWith({
    String? title,
    String? subtitle,
    String? src,
  }) {
    return GameModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (subtitle != null) {
      result.addAll({'subtitle': subtitle});
    }
    if (src != null) {
      result.addAll({'src': src});
    }

    return result;
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      title: map['title'],
      subtitle: map['subtitle'],
      src: map['src'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'GameModel(title: $title, subtitle: $subtitle, src: $src)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameModel &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.src == src;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ src.hashCode;
}

var soloGames = <GameModel>[
  GameModel(
      title: "Ancient Rings",
      subtitle: "Compete with friends to save the Princes from evil.",
      src: Assets.assetsImagesAncientRings),
  GameModel(
      title: "Castle of Cards",
      subtitle: "Compete with friends to save the Princes from evil.",
      src: Assets.assetsImagesCastleOfCards),
];

var pvpGames = <GameModel>[
  GameModel(
      title: "Castle of Cards PvP",
      subtitle: "Compete with friends to save the Princes from evil.",
      src: Assets.assetsImagesCastleOfCardsPvp),
];
