import 'package:timeago/timeago.dart' as timeago;

class TimeUtils {
  static String ago(DateTime time) {
    return timeago.format(
      time,
      locale: 'en_short',
      allowFromNow: true,
    );
  }
}
