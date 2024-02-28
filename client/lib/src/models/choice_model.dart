import 'dart:convert';
import 'dart:ui';

import 'package:omonie/src/constants/assets.dart';

class ChoiceModel {
  String? title;
  String? src;
  Color? color;
  ChoiceModel({
    this.title,
    this.src,
    this.color,
  });

  ChoiceModel copyWith({
    String? title,
    String? src,
    Color? color,
  }) {
    return ChoiceModel(
      title: title ?? this.title,
      src: src ?? this.src,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (src != null) {
      result.addAll({'src': src});
    }
    if (color != null) {
      result.addAll({'color': color!.value});
    }

    return result;
  }

  factory ChoiceModel.fromMap(Map<String, dynamic> map) {
    return ChoiceModel(
      title: map['title'],
      src: map['src'],
      color: map['color'] != null ? Color(map['color']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChoiceModel.fromJson(String source) =>
      ChoiceModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChoiceModel(title: $title, src: $src, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChoiceModel &&
        other.title == title &&
        other.src == src &&
        other.color == color;
  }

  @override
  int get hashCode => title.hashCode ^ src.hashCode ^ color.hashCode;
}

var choiceList = <ChoiceModel>[
  ChoiceModel(
      title: "Play Games",
      src: Assets.assetsImagesIntent1,
      color: const Color(0xFFE9BB38)),
  ChoiceModel(
      title: "Invest",
      src: Assets.assetsImagesIntent2,
      color: const Color(0xFFD9D9D9)),
  ChoiceModel(title: "Learn", src: "", color: const Color(0xFF071E5A)),
  ChoiceModel(title: "Don’t know yet", src: "", color: const Color(0xFF071E5A)),
];
