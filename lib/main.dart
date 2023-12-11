
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  String selectedMorningFood = 'Select Morning Food';
  String selectedLunchFood = 'Select Lunch Food';
  String selectedDinnerFood = 'Select Dinner Food';

  int morningQuantity = 0;
  int lunchQuantity = 0;
  int dinnerQuantity = 0;

  List<String> foodItems = [
    'Select Morning Food',
    'Eggs',
    'Cereal',
    'Toast',
    'Select Lunch Food',
    'Sandwich',
    'Salad',
    'Pasta',
    'Select Dinner Food',
    'Chicken',
    'Fish',
    'Vegetables',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildDropdown('Morning', selectedMorningFood, (String? newValue) {
              setState(() {
                selectedMorningFood = newValue!;
              });
            }),
            buildQuantitySelector('Morning', morningQuantity, (int value) {
              setState(() {
                morningQuantity = value;
              });
            }),
            SizedBox(height: 16.0),
            buildDropdown('Lunch', selectedLunchFood, (String? newValue) {
              setState(() {
                selectedLunchFood = newValue!;
              });
            }),
            buildQuantitySelector('Lunch', lunchQuantity, (int value) {
              setState(() {
                lunchQuantity = value;
              });
            }),
            SizedBox(height: 16.0),
            buildDropdown('Dinner', selectedDinnerFood, (String? newValue) {
              setState(() {
                selectedDinnerFood = newValue!;
              });
            }),
            buildQuantitySelector('Dinner', dinnerQuantity, (int value) {
              setState(() {
                dinnerQuantity = value;
              });
            }),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                print('Morning Food: $selectedMorningFood, Quantity: $morningQuantity');
                print('Lunch Food: $selectedLunchFood, Quantity: $lunchQuantity');
                print('Dinner Food: $selectedDinnerFood, Quantity: $dinnerQuantity');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String value, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('$label Food'),
        SizedBox(height: 8.0),
        DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          items: foodItems.map((String foodItem) {
            return DropdownMenuItem<String>(
              value: foodItem,
              child: Text(foodItem),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildQuantitySelector(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 8.0),
        Text('$label Quantity'),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (value > 0) {
                    onChanged(value - 1);
                  }
                },
              ),
            ),
            Text('$value'),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  onChanged(value + 1);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
