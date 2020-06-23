class Ranking {
  int id;
  int score;
  int userId;

  Ranking({this.score});

  Map toJson() => {
    'score': score,
  };

  Ranking.fromJson(Map json) {
    this.id = json['ID'];
    this.score = json['score'];
    this.userId = json['userId'];
  }
}
