import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class FitPage extends StatefulWidget {
  const FitPage({Key? key}) : super(key: key);

  @override
  State<FitPage> createState() => _FitPageState();
}

class _FitPageState extends State<FitPage> {
  int getSteps = 0;
  final Health health = Health();

  @override
  void initState() {
    super.initState();
    fetchStepsData();
  }

  Future<void> fetchStepsData() async {
    int? steps;
    var types = [HealthDataType.STEPS];
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    var permission = [HealthDataAccess.READ];

    // Request permissions
    bool requested =
        await health.requestAuthorization(types, permissions: permission);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
        log('Total number of steps: $steps');
      } catch (e) {
        log("Caught exception in getTotalStepsInInterval: $e");
      }
      setState(() {
        getSteps = (steps == null) ? 0 : steps;
      });
    } else {
      log('Authorization not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Fitness Data')),
      body: Center(
        child: Text("Total Steps: $getSteps"),
      ),
    );
  }
}
