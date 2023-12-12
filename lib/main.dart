
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
          title: Text('Meal Schedule'),
        ),
        body: MealForm(),
      ),
    );
  }
}

class MealForm extends StatefulWidget {
  @override
  _MealFormState createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  TextEditingController morningQtyController = TextEditingController();
  TextEditingController lunchQtyController = TextEditingController();
  TextEditingController dinnerQtyController = TextEditingController();

  String? selectedMorning;
  String? selectedLunch;
  String? selectedDinner;

  List<String> mealOptions = ['Select', 'Toast', 'Omelette', 'Sandwich', 'Salad', 'Pasta', 'Pizza', 'Chicken', 'Fish', 'Vegetables'];

  Map<String, int> calorieMap = {
    'Toast': 100,
    'Omelette': 200,
    'Sandwich': 300,
    'Salad': 150,
    'Pasta': 400,
    'Pizza': 500,
    'Chicken': 250,
    'Fish': 300,
    'Vegetables': 120,
  };

  int calculateCalories(String? selectedDish, String? quantity) {
    if (selectedDish != null && quantity != null && quantity.isNotEmpty) {
      int dishCalories = calorieMap[selectedDish] ?? 0;
      int quantityValue = int.tryParse(quantity) ?? 0;
      return dishCalories * quantityValue;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedLunch,
              items: mealOptions.map((String meal) {
                return DropdownMenuItem<String>(
                  value: meal == 'Select' ? null : meal,
                  child: Text(meal),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedLunch = value;
                });
              },
              decoration: InputDecoration(labelText: 'Mrg Dish'),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: morningQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Morning Quantity'),
            ),
            SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
              value: selectedLunch,
              items: mealOptions.map((String meal) {
                return DropdownMenuItem<String>(
                  value: meal == 'Select' ? null : meal,
                  child: Text(meal),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedLunch = value;
                });
              },
              decoration: InputDecoration(labelText: 'Lunch Dish'),
            ),
            SizedBox(height: 32.0),

            TextFormField(
              controller: lunchQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lunch Quantity'),
            ),
            SizedBox(height: 16.0),
            
            DropdownButtonFormField<String>(
              value: selectedDinner,
              items: mealOptions.map((String meal) {
                return DropdownMenuItem<String>(
                  value: meal == 'Select' ? null : meal,
                  child: Text(meal),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedDinner = value;
                });
              },
              decoration: InputDecoration(labelText: 'Dinner Dish'),
            ),
            SizedBox(height: 32.0),
              TextFormField(
              controller: lunchQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lunch Quantity'),
            ),
            SizedBox(height: 16.0),
            
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                int morningCalories = calculateCalories(selectedMorning, morningQtyController.text);
                int lunchCalories = calculateCalories(selectedLunch, lunchQtyController.text);
                int dinnerCalories = calculateCalories(selectedDinner, dinnerQtyController.text);

                print('Morning: $selectedMorning, Quantity: ${morningQtyController.text}, Calories: $morningCalories');
                print('Lunch: $selectedLunch, Quantity: ${lunchQtyController.text}, Calories: $lunchCalories');
                print('Dinner: $selectedDinner, Quantity: ${dinnerQtyController.text}, Calories: $dinnerCalories');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
