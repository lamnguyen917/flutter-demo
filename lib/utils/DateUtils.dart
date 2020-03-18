class DateUtils {
  static String fromTimestamp(String time) {
    int timeStamp = int.parse(time);
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return "${date.month}/${date.day}/${date.year}";
  }
}
