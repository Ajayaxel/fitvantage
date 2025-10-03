import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/bloc/meal/bloc/meal_plan_bloc.dart';
import 'package:my_app/bloc/meal/bloc/meal_plan_event.dart';
import 'package:my_app/bloc/meal/bloc/meal_plan_state.dart';
import 'package:my_app/models/meals_model.dart';
import 'package:my_app/services/meal_plan_service.dart';


class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealPlanBloc(MealPlanService())..add(LoadMealPlans()),
      child: const MealPlanView(),
    );
  }
}

class MealPlanView extends StatefulWidget {
  const MealPlanView({super.key});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  final List<DateTime> weekDays = List.generate(
    7,
    (index) => DateTime.now().subtract(
      Duration(days: DateTime.now().weekday - 1 - index),
    ),
  );

  final List<String> meals = ["Breakfast", "Lunch", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
              const SizedBox(height: 30),
              _buildWeekDaysSelector(),
              const SizedBox(height: 20),
              _buildMealTypeSelector(),
              const SizedBox(height: 30),
              _buildMealsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            backgroundColor: Color(0xff272727),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "My Meals Plan",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDaysSelector() {
    return BlocBuilder<MealPlanBloc, MealPlanState>(
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: Row(
            children: List.generate(weekDays.length, (index) {
              final day = weekDays[index];
              final isSelected = state is MealPlanLoaded && 
                                state.selectedDayIndex == index;
              
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<MealPlanBloc>().add(SelectDay(index));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.E().format(day).substring(0, 1),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? const Color(0xff161816) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat.d().format(day),
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  Widget _buildMealTypeSelector() {
    return BlocBuilder<MealPlanBloc, MealPlanState>(
      builder: (context, state) {
        return Row(
          children: List.generate(meals.length, (index) {
            final isSelected = state is MealPlanLoaded && 
                              state.selectedMealType == index;
            
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<MealPlanBloc>().add(SelectMealType(index));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? const Color(0xFF6CFB82) 
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: isSelected 
                        ? null 
                        : Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      meals[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildMealsList() {
    return Expanded(
      child: BlocBuilder<MealPlanBloc, MealPlanState>(
        builder: (context, state) {
          if (state is MealPlanLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF6CFB82),
              ),
            );
          }
          
          if (state is MealPlanError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MealPlanBloc>().add(LoadMealPlans());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6CFB82),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          }
          
          if (state is MealPlanLoaded) {
            final selectedDay = _getSelectedDayMealPlan(state);
            final selectedMeals = _getSelectedMeals(selectedDay, state.selectedMealType);
            
            if (selectedMeals.isEmpty) {
              return const Center(
                child: Text(
                  'No meals available for this selection',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }
            
            return ListView.separated(
              itemCount: selectedMeals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final meal = selectedMeals[index];
                return MealCard(
                  meal: meal,
                  image: meal.image.isNotEmpty 
                      ? meal.image 
                      : "assets/Homeimages/salad.png", // fallback image
                  title: meal.name,
                  calories: "${meal.kcal} kcal • ${meal.weight.toString()}",
                  protein: _parseNutrientValue(meal.nutrients.protein.name),
                  carbs: _parseNutrientValue(meal.nutrients.carbohydrates.name),
                  fat: _parseNutrientValue(meal.nutrients.fat.name),
                );
              },
            );
          }
          
          return const Center(
            child: Text(
              'No meal plans available',
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
  
  MealPlan? _getSelectedDayMealPlan(MealPlanLoaded state) {
    if (state.mealPlans.isEmpty) return null;
    
    // Get the selected date
    final selectedDate = weekDays[state.selectedDayIndex];
    
    // Find meal plan for selected date
    for (final mealPlan in state.mealPlans) {
      if (_isSameDay(mealPlan.date, selectedDate)) {
        return mealPlan;
      }
    }
    
    // If no exact match, return first available meal plan
    return state.mealPlans.first;
  }
  
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
           date1.month == date2.month &&
           date1.day == date2.day;
  }
  
  List<Breakfast> _getSelectedMeals(MealPlan? mealPlan, int mealTypeIndex) {
    if (mealPlan == null) return [];
    
    switch (mealTypeIndex) {
      case 0:
        return mealPlan.meals.breakfast;
      case 1:
        return mealPlan.meals.lunch;
      case 2:
        return mealPlan.meals.dinner;
      default:
        return [];
    }
  }
  
  int _parseNutrientValue(String nutrientString) {
    // Extract number from strings like "26g", "20g", etc.
    final regex = RegExp(r'(\d+)');
    final match = regex.firstMatch(nutrientString);
    return match != null ? int.parse(match.group(1)!) : 0;
  }
}

//lib/widgets/meal_card.dart



class MealCard extends StatelessWidget {
  final Breakfast meal;
  final String image;
  final String title;
  final String calories;
  final int protein;
  final int carbs;
  final int fat;

  const MealCard({
    super.key,
    required this.meal,
    required this.image,
    required this.title,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  void _showMealDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => MealDetailDialog(meal: meal, image: image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMealDetails(context),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.restaurant,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                "${meal.kcal} kcal • ${meal.weight}",
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.more_horiz, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff5E615F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NutrientBar(
                      label: "Protein",
                      value: protein,
                      color: const Color(0xFF43C26D),
                    ),
                    NutrientBar(
                      label: "Carbo",
                      value: carbs,
                      color: const Color(0xFFE0EB51),
                    ),
                    NutrientBar(
                      label: "Fat",
                      value: fat,
                      color: const Color(0xFF636AF8),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NutrientBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const NutrientBar({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 10,
                  height: (value / 60) * 60, // Adjusted scale
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${value}g",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

//lib/widgets/meal_detail_dialog.dart


class MealDetailDialog extends StatelessWidget {
  final Breakfast meal;
  final String image;

  const MealDetailDialog({
    super.key,
    required this.meal,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff1C1C1C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 110,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.restaurant,
                          color: Colors.grey,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "🕒 Prep Time: ${meal.recipe.prepTime}",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Ingredients:",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...meal.recipe.ingredients.map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "• $ingredient",
                      style: const TextStyle(color: Colors.grey, height: 1.4),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff7FFA88).withOpacity(0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tips:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...meal.recipe.tips.map(
                        (tip) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            "• $tip",
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Nutrition Info
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

