// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Flutter drive methods demo', () async {
      await driver.waitFor(find.byValueKey('buttonSearch'));
      await driver.tap(find.byValueKey('buttonSearch'));
      print('Search clicked');
      await driver.waitFor(find.byValueKey('search'));
      await driver.tap(find.byValueKey('search'));
      await driver.enterText('google');
      await driver.waitFor(find.text('google'));
      await driver.enterText('kotlin');
      await driver.waitForAbsent(find.text('google'));
      print('Test Search Done!');
    });

  });
}