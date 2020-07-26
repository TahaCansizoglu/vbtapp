class Questions {
  int id;
  String turkish;
  List<String> wrongOptionsEn;
  List<String> wrongOptionsTr;
  String english;

  Questions(
      {this.id,
      this.turkish,
      this.wrongOptionsEn,
      this.wrongOptionsTr,
      this.english});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    turkish = json['turkish'];
    wrongOptionsEn = json['wrong_options_en'].cast<String>();
    wrongOptionsTr = json['wrong_options_tr'].cast<String>();
    english = json['english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['turkish'] = this.turkish;
    data['wrong_options_en'] = this.wrongOptionsEn;
    data['wrong_options_tr'] = this.wrongOptionsTr;
    data['english'] = this.english;
    return data;
  }
}
