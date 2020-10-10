import 'dart:async';

import 'package:test/test.dart';

/// expect the given future does not complete within the given timeout.
/// This is safer than expect(future, doesNotComplete) since this does not create an async expect.
///
/// Rubbish test.dart
Future<void> expectFutureNotComplete(
    Future future, Duration timeout) async {
  try {
    await future.timeout(timeout);
    expect(null, equals(0),
        reason:
        "asyncTransaction should not complete within ${timeout.toString()}");
  } catch (e) {
    expect(e, isA<TimeoutException>());
  }
}
