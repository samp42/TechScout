import 'package:scout/enums/charge_station_enum.dart';
import 'package:test/test.dart';

void main() {
  test('test fromValue when happy', () {
    for (var element in ChargeStationEnum.values) {
      // When / Then
      expect(
          ChargeStationEnumExtension.fromValue(element.value), equals(element));
    }
  });

  test('test fromValue when invalid value', () {
    // When / Then
    expect(() => ChargeStationEnumExtension.fromValue('Invalid value'),
        throwsA(isA<Exception>()));
  });
}
