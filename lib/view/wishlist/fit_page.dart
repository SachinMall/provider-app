import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_provider/view_model/health_services.dart';

class FitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data Overview'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const FitPageBody(),
    );
  }
}

class FitPageBody extends StatefulWidget {
  const FitPageBody({Key? key}) : super(key: key);

  @override
  _FitPageBodyState createState() => _FitPageBodyState();
}

class _FitPageBodyState extends State<FitPageBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestPermissions();
    });
  }

  Future<void> _requestPermissions() async {
    final healthProvider = Provider.of<HealthProvider>(context, listen: false);
    await healthProvider.authorize();
    if (healthProvider.state == AppState.AUTHORIZED) {
      await healthProvider.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final healthProvider = Provider.of<HealthProvider>(context);

    switch (healthProvider.state) {
      case AppState.AUTH_NOT_GRANTED:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Health data access not granted'),
              ElevatedButton(
                onPressed: _requestPermissions,
                child: const Text('Request Permissions'),
              ),
            ],
          ),
        );
      case AppState.FETCHING_DATA:
        return const Center(child: CircularProgressIndicator());
      case AppState.NO_DATA:
        return const Center(child: Text('No Data Available'));
      case AppState.DATA_READY:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildStepsCard(healthProvider),
              const SizedBox(height: 20),
              _buildCaloriesBurnedCard(healthProvider),
              const SizedBox(height: 20),
              _buildWorkoutCard(healthProvider),
            ],
          ),
        );
      default:
        return const Center(child: Text('Initializing...'));
    }
  }

  Widget _buildStepsCard(HealthProvider provider) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.directions_walk,
                size: 40, color: Color.fromARGB(255, 33, 72, 243)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Steps Taken',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${provider.totalSteps}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaloriesBurnedCard(HealthProvider provider) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.local_fire_department,
                size: 40, color: Colors.redAccent),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Calories Burned',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${provider.totalCaloriesBurned.toStringAsFixed(0)} kcal',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(HealthProvider provider) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.fitness_center, size: 40, color: Colors.orange),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Workout Calories Burned',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${provider.totalWorkoutCalories.toStringAsFixed(0)} kcal',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
