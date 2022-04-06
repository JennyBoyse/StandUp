// user entries in Firestore database
class User {
  String id;
  String interval;
  String lastProcessed;
  String lunchBreak;
  String lunchDuration;
  String startTime;
  String endTime;
  String tokenID;

  User(this.id, this.interval, this.lastProcessed, this.lunchBreak,
      this.lunchDuration, this.startTime, this.endTime, this.tokenID);

  // convert user data to Firestore JSON format
  Map toJson() => {
    'id': id,
    'interval': interval,
    'lastProcessed': lastProcessed,
    'lunchBreak': lunchBreak,
    'lunchDuration': lunchDuration,
    'startTime': startTime,
    'endTime': endTime,
    'tokenID': tokenID
  };

  // convert user data from Firestore JSON format
  factory User.fromJson(dynamic json) {
    return User(
        json['id'] as String,
        json['interval'] as String,
        json['lastProcessed'] as String,
        json['lunchBreak'] as String,
        json['lunchDuration'] as String,
        json['startTime'] as String,
        json['endTime'] as String,
        json['tokenID'] as String);
  }

  @override
  String toString() {
    return '{ ${this.id}, ${this.interval}, ${this.lastProcessed}, ${this.lunchBreak}, ${this.lunchDuration}, ${this.startTime}, ${this.endTime}, ${this.tokenID} }';
  }
}