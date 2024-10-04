import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
}

class HealthProvider with ChangeNotifier {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;

  List<HealthDataPoint> get healthDataList => _healthDataList;
  AppState get state => _state;

  static final List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.TOTAL_CALORIES_BURNED,
    HealthDataType.WORKOUT,
  ];

  List<HealthDataAccess> get permissions =>
      types.map((e) => HealthDataAccess.READ_WRITE).toList();

  /// Install Google Health Connect on Android.
  Future<void> installHealthConnect() async {
    await Health().installHealthConnect();
  }

  /// Request authorization to access health data.
  Future<void> authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions =
        await Health().hasPermissions(types, permissions: permissions);
    hasPermissions = false;
    bool authorized = false;

    if (!hasPermissions) {
      try {
        authorized = await Health()
            .requestAuthorization(types, permissions: permissions);
      } catch (error) {
        debugPrint("Exception in authorize: $error");
      }
    }

    _state = authorized ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED;
    notifyListeners();
  }

  /// Fetch health data from the last 24 hours.
  Future<void> fetchData() async {
    _state = AppState.FETCHING_DATA;
    notifyListeners();

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
        types: [
          HealthDataType.STEPS,
          HealthDataType.TOTAL_CALORIES_BURNED,
          HealthDataType.WORKOUT,
        ],
        startTime: yesterday,
        endTime: now,
      );
      _healthDataList = Health().removeDuplicates(healthData);
      _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    } catch (error) {
      _state = AppState.NO_DATA;
      debugPrint("Error fetching health data: $error");
    }

    // _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    notifyListeners();
  }

  /// Extract the numeric value from HealthDataPoint based on its type
  num extractNumericValue(HealthDataPoint dataPoint) {
    if (dataPoint.value is NumericHealthValue) {
      return (dataPoint.value as NumericHealthValue).numericValue;
    } else if (dataPoint.value is WorkoutHealthValue) {
      return (dataPoint.value as WorkoutHealthValue).totalEnergyBurned ?? 0.0;
    }
    return 0;
  }

  /// Get the total steps count
  int get totalSteps => _healthDataList
      .where((point) => point.type == HealthDataType.STEPS)
      .fold(0, (prev, element) => prev + extractNumericValue(element).toInt());

  /// Get the total calories burned
  double get totalCaloriesBurned => _healthDataList
      .where((point) => point.type == HealthDataType.TOTAL_CALORIES_BURNED)
      .fold(0.0, (prev, element) => prev + extractNumericValue(element));

  /// Get the total energy burned in workouts
  double get totalWorkoutCalories => _healthDataList
      .where((point) => point.type == HealthDataType.WORKOUT)
      .fold(0.0, (prev, element) => prev + extractNumericValue(element));
}
