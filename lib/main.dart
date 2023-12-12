
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
    TextEditingController foodGramsController= TextEditingController();


  String? selectedMorning;
  String? selectedLunch;
  String? selectedDinner;
  String? selectedFoodGrams;

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
  
  List<String> foodGramsOptions = [
    '100 grams',
    '200 grams',
    '300 grams',
    '400 grams',
    '500 grams',
  ];

  int calculateCalories(String? selectedDish, String? quantity) {
    if (selectedDish != null && quantity != null && quantity.isNotEmpty) {
      int dishCalories = calorieMap[selectedDish] ?? 0;
      int quantityValue = int.tryParse(quantity) ?? 0;
      return dishCalories * quantityValue;
    }
    return 0;
  }

  
  // int calculateFoodGrams(String? selectedDish, String? quantity) {
  //   if (selectedFoodGrams != null && quantity != null && quantity.isNotEmpty) {
  //     // int dishFoodGrams = foodGramsOptions[selectedDish] ?? 0;
  //     int quantityValue = int.tryParse(quantity) ?? 0;
  //     return dishFoodGrams * quantityValue;
  //   }
  //   return 0;
  // }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedMorning,
              items: mealOptions.map((String meal) {
                return DropdownMenuItem<String>(
                  value: meal == 'Select' ? null : meal,
                  child: Text(meal),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedMorning = value;
                });
              },
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            SizedBox(height: 32.0),

              DropdownButtonFormField<String>(
              value: selectedFoodGrams,
              items: foodGramsOptions.map((String gram) {
                return DropdownMenuItem<String>(
                  value: gram == 'Select' ? null : gram,
                  child: Text(gram),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedFoodGrams = value;
                });
              },
              decoration: InputDecoration(labelText: 'Food Grams'),
            ),
            SizedBox(height: 32.0),

            TextFormField(
              controller: morningQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 16.0),

  


              ElevatedButton(
              onPressed: () {
                // Handle form submission here
                int morningCalories = calculateCalories(selectedMorning, morningQtyController.text);
                // int morningFoodGrams = calculateFoodGrams(selectedFoodGrams, foodGramsController.text);
                print('Morning: $selectedMorning, Quantity: ${morningQtyController.text}, Calories: $morningCalories, Food Grams: $selectedFoodGrams');
              },
              child: Text('Submit'),
            ),
 //Lunch 
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
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            SizedBox(height: 32.0),

              DropdownButtonFormField<String>(
              value: selectedFoodGrams,
              items: foodGramsOptions.map((String gram) {
                return DropdownMenuItem<String>(
                  value: gram == 'Select' ? null : gram,
                  child: Text(gram),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedFoodGrams = value;
                });
              },
              decoration: InputDecoration(labelText: 'Food Grams'),
            ),
            SizedBox(height: 32.0),
            TextFormField(
              controller: lunchQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 16.0),
              ElevatedButton(
              onPressed: () {
                // Handle form submission here
                int lunchCalories = calculateCalories(selectedLunch, lunchQtyController.text);

                print('Lunch: $selectedLunch, Quantity: ${lunchQtyController.text}, Calories: $lunchCalories, Food Grams: ${selectedFoodGrams}');
              },
              child: Text('Submit'),
            ),
            //Dinner 
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
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            SizedBox(height: 32.0),
              DropdownButtonFormField<String>(
              value: selectedFoodGrams,
              items: foodGramsOptions.map((String gram) {
                return DropdownMenuItem<String>(
                  value: gram == 'Select' ? null : gram,
                  child: Text(gram),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedFoodGrams = value;
                });
              },
              decoration: InputDecoration(labelText: 'Food Grams'),
            ),
            SizedBox(height: 32.0),
              TextFormField(
              controller: lunchQtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: ' Quantity'),
            ),
            SizedBox(height: 16.0),
            
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                int dinnerCalories = calculateCalories(selectedDinner, dinnerQtyController.text);
                print('Dinner: $selectedDinner, Quantity: ${dinnerQtyController.text}, Calories: $dinnerCalories, Food Grams: ${selectedFoodGrams}',);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
