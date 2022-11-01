class WorldCup {
  final int id;
  final String team;
  final String group;
  final String flagImageion;
  final int voteCount;

  WorldCup({
    required this.id,
    required this.team,
    required this.group,
    required this.flagImageion,
    required this.voteCount,
  });

  /*factory WorldCup.fromJson(Map<String, dynamic> json) {
    return WorldCup(
      id: json['id'],
      team: json['team'],
      group: json['group'],
      flagImageion: json['flagImageion'],
      vote
  }*/
}
