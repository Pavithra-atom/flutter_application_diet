
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meal Schedule'),
        ),
        body: const MealForm(),
      ),
    );
  }
}

class MealForm extends StatefulWidget {
  const MealForm({super.key});

  @override
  _MealFormState createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  TextEditingController morningController = TextEditingController();
  TextEditingController lunchController = TextEditingController();
  TextEditingController dinnerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: morningController,
              decoration: const InputDecoration(labelText: 'Morning'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: lunchController,
              decoration: const InputDecoration(labelText: 'Lunch'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: dinnerController,
              decoration: const InputDecoration(labelText: 'Dinner'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                print('Morning: ${morningController.text}');
                print('Lunch: ${lunchController.text}');
                print('Dinner: ${dinnerController.text}');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
