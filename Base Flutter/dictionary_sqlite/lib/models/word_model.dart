class WordModel {
  int? word_id;
  String? word;
  String? pronounce;
  String? meaning;

  WordModel(
      {required this.word_id,
      required this.word,
      required this.pronounce,
      required this.meaning});

  // từ json
  WordModel.fromJson(Map<dynamic, dynamic> json)
      : this.word_id = json['word_id'],
        this.word = json['word'],
        this.pronounce = json['pronounce'],
        this.meaning = json['meaning'];

/*
 WordModel.fromJson(Map<dynamic, dynamic> json){
      return WordModel(
      word_id: json['word_id'],
      word : json['word'],
      pronounce : json['pronounce'],
      meaning : json['meaning']);
      }
}
 */

// to Json
  toJson() {
    return {
      "word_id": this.word_id,
      "word": this.word,
      "pronounce": this.pronounce,
      "meaning": this.meaning
    };
  }
}
