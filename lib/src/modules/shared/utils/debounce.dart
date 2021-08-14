import 'dart:async';

typedef DebounceCallback = void Function();

class Debounce {
  static Map<String, Timer> _timers = {};

  static void debounce(String tag, Duration duration, DebounceCallback onExecute) {
    if (duration == Duration.zero) {
      _timers[tag]?.cancel();
      _timers.remove(tag);
      onExecute();
    } else {
      _timers[tag]?.cancel();

      _timers[tag] = Timer(duration, () {
        _timers[tag]?.cancel();
        _timers.remove(tag);

        onExecute();
      });
    }
  }

  static void cancel(String tag) {
    _timers[tag]?.cancel();
    _timers.remove(tag);
  }

  static int count() {
    return _timers.length;
  }
}
