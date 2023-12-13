 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Dish {
  String name;
  double caloriesPerGram;

  Dish({required this.name, required this.caloriesPerGram});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dish Calories Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dish> dishes = [
    Dish(name: 'Apple', caloriesPerGram: 0.52),
    Dish(name: 'Banana', caloriesPerGram: 1.05),
    Dish(name: 'Chicken Breast', caloriesPerGram: 1.65),
    // Add more dishes with their respective calorie values
  ];

  Dish? selectedDish;
  double quantity = 0.0;
  String selectedMeasurement = 'Grams';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dish Calories Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Dish>(
              value: selectedDish,
              onChanged: (Dish? value) {
                setState(() {
                  selectedDish = value;
                });
              },
              items: dishes.map<DropdownMenuItem<Dish>>((Dish dish) {
                return DropdownMenuItem<Dish>(
                  value: dish,
                  child: Text(dish.name),
                );
              }).toList(),
              hint: Text('Select Dish'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        quantity = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedMeasurement,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMeasurement = value ?? 'Grams';
                    });
                  },
                  items: ['Grams', 'Bowl', 'Cup'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateTotalCalories();
              },
              child: Text('Calculate Calories'),
            ),
            SizedBox(height: 10),
            Text('Total Calories: ${calculateTotalCalories()}'),
          ],
        ),
      ),
    );
  }

  double calculateTotalCalories() {
    if (selectedDish == null || quantity <= 0) {
      return 0.0;
    }

    double calories = selectedDish!.caloriesPerGram * quantity;

    // Adjust calories based on the selected measurement type
    if (selectedMeasurement == 'Bowl') {
      calories *= 2; // Adjust based on your own conversion factor
    } else if (selectedMeasurement == 'Cup') {
      calories *= 3; // Adjust based on your own conversion factor
    }

    return calories;
  }
}
