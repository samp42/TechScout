import 'dart:convert';
import 'dart:io';

import 'package:scout/enums/card_color_enum.dart';
import 'package:scout/enums/charge_station_enum.dart';
import 'package:scout/enums/charge_station_auto_enum.dart';
import 'package:scout/enums/charge_station_order_enum.dart';
import 'package:scout/enums/teleop_action_enum.dart';
import 'package:scout/models/cycle_timestamp.dart';
import 'package:scout/models/team_scouting.dart';
import 'package:test/test.dart';

void main() {
  final TeamScouting teamScouting = TeamScouting.allArgs(
    practice: false,
    scoutName: 'John Doe',
    teamNumber: 3990,
    matchNumber: 1,
    mobility: true,
    chargeStationAuto: ChargeStationAutoEnum.engage,
    conesAuto: 1,
    cubesAuto: 0,
    cycles: [
      const CycleTimestamp(timestamp: 1, action: TeleopActionEnum.intakeCone),
      const CycleTimestamp(timestamp: 5, action: TeleopActionEnum.placeTop),
      const CycleTimestamp(timestamp: 6, action: TeleopActionEnum.intakeCube),
      const CycleTimestamp(timestamp: 11, action: TeleopActionEnum.placeMiddle),
      const CycleTimestamp(timestamp: 12, action: TeleopActionEnum.tippedOver),
    ],
    chargeStationEndgame: ChargeStationEnum.park,
    chargeStationOrder: ChargeStationOrderEnum.none,
    card: CardColorEnum.red,
  );

  test('Test fromMap', () {
    // Given / When
    TeamScouting teamScoutingActual = TeamScouting.fromMap({
      'practice': false,
      'matchNumber': 1,
      'teamNumber': 3990,
      'scoutName': 'John Doe',
      'mobility': true,
      'chargeStationAuto': 'engage',
      'conesAuto': 1,
      'cubesAuto': 0,
      'cycles': [
        {'timestamp': 1, 'action': 'intakeCone'},
        {'timestamp': 5, 'action': 'placeTop'},
        {'timestamp': 6, 'action': 'intakeCube'},
        {'timestamp': 11, 'action': 'placeMiddle'},
        {'timestamp': 12, 'action': 'tippedOver'},
      ],
      'chargeStationEndgame': 'park',
      'chargeStationOrder': 'none',
      'card': 'red',
    });

    //Then
    expect(teamScoutingActual.practice, equals(teamScouting.practice));
    expect(teamScoutingActual.matchNumber, equals(teamScouting.matchNumber));
    expect(teamScoutingActual.teamNumber, equals(teamScouting.teamNumber));
    expect(teamScoutingActual.scoutName, equals(teamScouting.scoutName));
    expect(teamScoutingActual.mobility, equals(teamScouting.mobility));
    expect(teamScoutingActual.chargeStationAuto,
        equals(teamScouting.chargeStationAuto));
    expect(teamScoutingActual.conesAuto, equals(teamScouting.conesAuto));
    expect(teamScoutingActual.cubesAuto, equals(teamScouting.cubesAuto));
    expect(
        teamScoutingActual.cycles.length, equals(teamScouting.cycles.length));
    for (int i = 0; i < teamScoutingActual.cycles.length; i++) {
      expect(teamScoutingActual.cycles[i].equals(teamScouting.cycles[i]), true);
    }
    expect(teamScoutingActual.chargeStationEndgame,
        equals(teamScouting.chargeStationEndgame));
    expect(teamScoutingActual.chargeStationOrder,
        equals(teamScouting.chargeStationOrder));
    expect(teamScoutingActual.card, equals(teamScouting.card));
  });

  test('test fromMap from json file', () {
    // Given
    File teamScoutingFile = File('test_resources/team_scouting.json');
    String teamScoutingJson = teamScoutingFile.readAsStringSync();
    Map<String, dynamic> teamScoutingMap = jsonDecode(teamScoutingJson);

    // When
    TeamScouting teamScoutingActual = TeamScouting.fromMap(teamScoutingMap);

    // Then
    expect(teamScoutingActual.practice, equals(teamScouting.practice));
    expect(teamScoutingActual.matchNumber, equals(teamScouting.matchNumber));
    expect(teamScoutingActual.teamNumber, equals(teamScouting.teamNumber));
    expect(teamScoutingActual.scoutName, equals(teamScouting.scoutName));
    expect(teamScoutingActual.mobility, equals(teamScouting.mobility));
    expect(teamScoutingActual.chargeStationAuto,
        equals(teamScouting.chargeStationAuto));
    expect(teamScoutingActual.conesAuto, equals(teamScouting.conesAuto));
    expect(teamScoutingActual.cubesAuto, equals(teamScouting.cubesAuto));
    expect(
        teamScoutingActual.cycles.length, equals(teamScouting.cycles.length));
    for (int i = 0; i < teamScoutingActual.cycles.length; i++) {
      expect(teamScoutingActual.cycles[i].equals(teamScouting.cycles[i]), true);
    }
    expect(teamScoutingActual.chargeStationEndgame,
        equals(teamScouting.chargeStationEndgame));
    expect(teamScoutingActual.chargeStationOrder,
        equals(teamScouting.chargeStationOrder));
    expect(teamScoutingActual.card, equals(teamScouting.card));
  });

  test('Test toJson', () {
    // Given
    File teamJsonFile = File('test_resources/team_scouting.json');
    String expectedTeamJsonString = teamJsonFile.readAsStringSync();
    Map<String, dynamic> expectedTeamJson = jsonDecode(expectedTeamJsonString);

    // When
    Map<String, dynamic> actualTeamJson = jsonDecode(teamScouting.toJson());

    // Then
    expect(actualTeamJson['practice'], equals(expectedTeamJson['practice']));
    expect(
        actualTeamJson['matchNumber'], equals(expectedTeamJson['matchNumber']));
    expect(
        actualTeamJson['teamNumber'], equals(expectedTeamJson['teamNumber']));
    expect(actualTeamJson['scoutName'], equals(expectedTeamJson['scoutName']));
    expect(actualTeamJson['mobility'], equals(expectedTeamJson['mobility']));
    expect(actualTeamJson['chargeStation'],
        equals(expectedTeamJson['chargeStation']));
    expect(actualTeamJson['scoringGridCones'],
        equals(expectedTeamJson['scoringGridCones']));
    expect(actualTeamJson['scoringGridCubes'],
        equals(expectedTeamJson['scoringGridCubes']));
    expect(actualTeamJson['robotCycleTimer'],
        equals(expectedTeamJson['robotCycleTimer']));
    expect(
        actualTeamJson['robotSpeed'], equals(expectedTeamJson['robotSpeed']));
    expect(actualTeamJson['placementSpeedCones'],
        equals(expectedTeamJson['placementSpeedCones']));
    expect(actualTeamJson['placementSpeedCubes'],
        equals(expectedTeamJson['placementSpeedCubes']));
    expect(actualTeamJson['pickupSpeedCones'],
        equals(expectedTeamJson['pickupSpeedCones']));
    expect(actualTeamJson['pickupSpeedCubes'],
        equals(expectedTeamJson['pickupSpeedCubes']));
    expect(actualTeamJson['canDropCones'],
        equals(expectedTeamJson['canDropCones']));
    expect(actualTeamJson['canDropCubes'],
        equals(expectedTeamJson['canDropCubes']));

    expect(actualTeamJson['scoringGridTeleopCones'],
        equals(expectedTeamJson['scoringGridTeleopCones']));
    expect(actualTeamJson['scoringGridTeleopCubes'],
        equals(expectedTeamJson['scoringGridTeleopCubes']));
    expect(actualTeamJson['penaltiesTeleop'],
        equals(expectedTeamJson['penaltiesTeleop']));
    expect(actualTeamJson['chargedStationEndgame'],
        equals(expectedTeamJson['chargedStationEndgame']));
    expect(
        actualTeamJson['engageOrder'], equals(expectedTeamJson['engageOrder']));

    expect(actualTeamJson['card'], equals(expectedTeamJson['card']));
  });
}
