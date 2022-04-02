class FormData {
  late String email;
  late String startTime;
  late String endTime;
  late String lunchBreak;
  late String lunchDuration;
  late String breakInterval;
  late DateTime date;

  FormData(this.email, this.startTime, this.endTime, this.lunchBreak, this.lunchDuration, this.breakInterval, this.date);

  FormData.fromJson(Map<dynamic, dynamic> json)
      : email = json['emailAddress'] as String,
        startTime = json['startTime'] as String,
        endTime = json['endTime'] as String,
        lunchBreak = json['lunchBreak'] as String,
        lunchDuration = json['lunchDuration'] as String,
        breakInterval = json['interval'] as String,
        date = DateTime.parse(json['lastProcessed'] as String);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'lastProcessed': date.toString(),
    'emailAddress': email,
    'startTime': startTime,
    'endTime': endTime,
    'lunchBreak': lunchBreak,
    'lunchDuration': lunchDuration,
    'interval': breakInterval,
  };
}