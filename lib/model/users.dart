// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.questions,
  });

  List<Question> questions;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.id,
    this.turkish,
    this.wrongOptionsEn,
    this.wrongOptionsTr,
    this.english,
  });

  int id;
  String turkish;
  List<WrongOptionsEn> wrongOptionsEn;
  List<WrongOptionsTr> wrongOptionsTr;
  String english;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        turkish: json["turkish"],
        wrongOptionsEn: List<WrongOptionsEn>.from(
            json["wrong_options_en"].map((x) => wrongOptionsEnValues.map[x])),
        wrongOptionsTr: List<WrongOptionsTr>.from(
            json["wrong_options_tr"].map((x) => wrongOptionsTrValues.map[x])),
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "turkish": turkish,
        "wrong_options_en": List<dynamic>.from(
            wrongOptionsEn.map((x) => wrongOptionsEnValues.reverse[x])),
        "wrong_options_tr": List<dynamic>.from(
            wrongOptionsTr.map((x) => wrongOptionsTrValues.reverse[x])),
        "english": english,
      };
}

enum WrongOptionsEn { TEST_TR, TEST_TR1, TEST_TR2 }

final wrongOptionsEnValues = EnumValues({
  "test_tr": WrongOptionsEn.TEST_TR,
  "test_tr1": WrongOptionsEn.TEST_TR1,
  "test_tr2": WrongOptionsEn.TEST_TR2
});

enum WrongOptionsTr { TEST_EN, TEST_EN1, TEST_EN2 }

final wrongOptionsTrValues = EnumValues({
  "test_en": WrongOptionsTr.TEST_EN,
  "test_en1": WrongOptionsTr.TEST_EN1,
  "test_en2": WrongOptionsTr.TEST_EN2
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
