// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_app/blocs/mealplan/bloc/mealplan_bloc.dart';
// import 'package:my_app/blocs/mealplan/bloc/mealplan_state.dart';
// import 'package:my_app/models/meal_plan.dart';

// class MealPlanScreen extends StatefulWidget {
//   const MealPlanScreen({super.key});

//   @override
//   State<MealPlanScreen> createState() => _MealPlanScreenState();
// }

// class _MealPlanScreenState extends State<MealPlanScreen> {
//   final Set<String> _completedMeals = <String>{};
//   int _selectedPlanIndex = 0;
//   int _selectedDayIndex = 0; // Add this to track selected day

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(

//         title: const Text(
//           '🍱 My Meal Plans',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color(0xFF010A04),
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () => _showProgressDialog(context),
//             icon: const Icon(Icons.analytics_outlined),
//             tooltip: 'View Progress',
//           ),
//         ],
//       ),
//       body: BlocBuilder<MealPlanBloc, MealPlanState>(
//         builder: (context, state) {
//           if (state is MealPlanLoading) {
//             return _buildLoadingState();
//           } else if (state is MealPlanLoaded) {
//             final mealPlans = state.mealPlans;

//             if (mealPlans.isEmpty) {
//               return _buildEmptyState();
//             }

//             return Column(
//               children: [
//                 if (mealPlans.length > 1) _buildPlanSelector(mealPlans),
//                 _buildDaySelector(mealPlans[_selectedPlanIndex]), // Add day selector
//                 Expanded(
//                   child: _buildMealPlanContent(mealPlans[_selectedPlanIndex]),
//                 ),
//               ],
//             );
//           } else if (state is MealPlanError) {
//             return _buildErrorState(state.message);
//           } else {
//             return _buildEmptyState();
//           }
//         },
//       ),
//     );
//   }

//   // Add day selector widget
//   Widget _buildDaySelector(MealPlan plan) {
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: plan.mealPlanJson.length,
//         itemBuilder: (context, index) {
//           final day = plan.mealPlanJson[index];
//           final isSelected = index == _selectedDayIndex;
//           final dayProgress = _getDayProgress(day);

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedDayIndex = index;
//               });
//             },
//             child: Container(
//               margin: const EdgeInsets.only(right: 12),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: isSelected ? const Color(0xff7FFA88) : const Color(0xFF1A1A1A),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: isSelected ? const Color(0xFF4CAF50) : Colors.grey[800]!,
//                   width: 1,
//                 ),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 24,
//                     height: 24,
//                     decoration: BoxDecoration(
//                       color: dayProgress == 1.0
//                           ? const Color(0xFF4CAF50)
//                           // ignore: deprecated_member_use
//                           : (isSelected ? Colors.white.withOpacity(0.2) : const Color(0xff7FFA88)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${index + 1}',
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     day.dayName,
//                     style: TextStyle(
//                       color: isSelected ? Colors.black : Colors.grey[400],
//                       fontSize: 14,
//                       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildLoadingState() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(
//             color: Color(0xFF4CAF50),
//             strokeWidth: 3,
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Loading your meal plans...',
//             style: TextStyle(color: Colors.white70, fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.restaurant_menu,
//             size: 80,
//             color: Colors.grey[600],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No Meal Plans Found',
//             style: TextStyle(
//               color: Colors.grey[400],
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Your trainer will assign meal plans soon',
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildErrorState(String message) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(
//             Icons.error_outline,
//             size: 80,
//             color: Colors.redAccent,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Oops! Something went wrong',
//             style: TextStyle(
//               color: Colors.grey[400],
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             message,
//             style: const TextStyle(color: Colors.redAccent),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () {
//               // Trigger reload
//               // context.read<MealPlanBloc>().add(ReloadMealPlans());
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF4CAF50),
//               foregroundColor: Colors.white,
//             ),
//             child: const Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPlanSelector(List<MealPlan> mealPlans) {
//     return Container(
//       height: 120,
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: mealPlans.length,
//         itemBuilder: (context, index) {
//           final plan = mealPlans[index];
//           final isSelected = index == _selectedPlanIndex;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedPlanIndex = index;
//                 _selectedDayIndex = 0; // Reset day selection when plan changes
//               });
//             },
//             child: Container(
//               width: 200,
//               margin: const EdgeInsets.only(right: 12),
//               decoration: BoxDecoration(
//                 color: isSelected ? const Color(0xff7FFA88) : const Color(0xFF1A1A1A),
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(
//                   color: isSelected ? const Color(0xFF4CAF50) : Colors.grey[800]!,
//                   width: 2,
//                 ),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     plan.name,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : Colors.grey[300],
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     plan.description,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white70 : Colors.grey[500],
//                       fontSize: 12,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const Spacer(),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.calendar_today,
//                         size: 12,
//                         color: isSelected ? Colors.white70 : Colors.grey[500],
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         '${plan.mealPlanJson.length} days',
//                         style: TextStyle(
//                           color: isSelected ? Colors.white70 : Colors.grey[500],
//                           fontSize: 11,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Updated to show only selected day
//   Widget _buildMealPlanContent(MealPlan plan) {
//     if (plan.mealPlanJson.isEmpty) {
//       return const Center(
//         child: Text(
//           'No meal data available',
//           style: TextStyle(color: Colors.white70),
//         ),
//       );
//     }

//     // Ensure selected day index is valid
//     if (_selectedDayIndex >= plan.mealPlanJson.length) {
//       _selectedDayIndex = 0;
//     }

//     final selectedDay = plan.mealPlanJson[_selectedDayIndex];

//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: _buildPlanHeader(plan),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: _buildSelectedDayContent(selectedDay, _selectedDayIndex),
//         ),
//         if (plan.dos.isNotEmpty || plan.donts.isNotEmpty)
//           SliverToBoxAdapter(
//             child: _buildGuidelinesSection(plan),
//           ),
//         const SliverToBoxAdapter(
//           child: SizedBox(height: 100), // Bottom padding
//         ),
//       ],
//     );
//   }

//   // New method to build content for selected day only
//   Widget _buildSelectedDayContent(MealPlanJson day, int dayIndex) {
//     final validMealTypes = day.mealTypes.where((type) => type.meals.isNotEmpty).toList();

//     if (validMealTypes.isEmpty) {
//       return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: const Color(0xFF1A1A1A),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey[800]!),
//         ),
//         child: Column(
//           children: [
//             Text(
//               '📅 ${day.dayName}',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Rest day - No meals scheduled',
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A1A1A),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey[800]!),
//       ),
//       child: Column(
//         children: [
//           // Day header
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: _getDayProgress(day) == 1.0
//                         ? const Color(0xFF4CAF50)
//                         : const Color(0xff7FFA88),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${dayIndex + 1}',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         day.dayName,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         '${validMealTypes.length} meal types',
//                         style: TextStyle(
//                           color: Colors.grey[400],
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (_getDayProgress(day) > 0)
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4CAF50),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Text(
//                       '${(_getDayProgress(day) * 100).toInt()}%',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Meal types
//           ...validMealTypes.map((type) => _buildMealTypeCard(type, day.dayName)),
//         ],
//       ),
//     );
//   }

//   Widget _buildPlanHeader(MealPlan plan) {
//     final totalMeals = _getTotalMealsCount(plan);
//     final completedMeals = _getCompletedMealsCount(plan);
//     final progress = totalMeals > 0 ? completedMeals / totalMeals : 0.0;

//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xff7FFA88), Color(0xFF388E3C)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   plan.name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   'v${plan.version}',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             plan.description,
//             style: const TextStyle(
//               color: Colors.white70,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Progress',
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     LinearProgressIndicator(
//                       value: progress,
//                       backgroundColor: Colors.white.withOpacity(0.3),
//                       valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
//                       minHeight: 8,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Text(
//                 '${(progress * 100).toInt()}%',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMealTypeCard(MealType type, String dayName) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFF2A2A2A),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Text(
//                   _getMealTypeEmoji(type.typeName),
//                   style: const TextStyle(fontSize: 24),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _getMealTypeName(type.typeName),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         '${type.meals.length} items',
//                         style: TextStyle(
//                           color: Colors.grey[400],
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ...type.meals.asMap().entries.map((entry) {
//             final index = entry.key;
//             final meal = entry.value;
//             final mealKey = '${dayName}_${type.typeName}_$index';
//             final isCompleted = _completedMeals.contains(mealKey);

//             return _buildMealItem(meal, mealKey, isCompleted);
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildMealItem(Meal meal, String mealKey, bool isCompleted) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: isCompleted
//             ? const Color(0xFF1B5E20).withOpacity(0.3)
//             : const Color(0xFF1A1A1A),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: isCompleted
//               ? const Color(0xFF4CAF50)
//               : Colors.grey[700]!,
//         ),
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 if (isCompleted) {
//                   _completedMeals.remove(mealKey);
//                 } else {
//                   _completedMeals.add(mealKey);
//                 }
//               });
//             },
//             child: Container(
//               width: 24,
//               height: 24,
//               decoration: BoxDecoration(
//                 color: isCompleted ? const Color(0xFF4CAF50) : Colors.transparent,
//                 border: Border.all(
//                   color: isCompleted ? const Color(0xFF4CAF50) : Colors.grey[600]!,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: isCompleted
//                   ? const Icon(
//                       Icons.check,
//                       color: Colors.white,
//                       size: 16,
//                     )
//                   : null,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Dish ID: ${meal.dishId ?? 'N/A'}',
//                   style: TextStyle(
//                     color: isCompleted ? Colors.white : Colors.grey[300],
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     decoration: isCompleted ? TextDecoration.lineThrough : null,
//                   ),
//                 ),
//                 if (meal.quantity != null)
//                   Text(
//                     'Quantity: ${meal.quantity} ${meal.unitId ?? ''}',
//                     style: TextStyle(
//                       color: isCompleted ? Colors.white70 : Colors.grey[400],
//                       fontSize: 12,
//                     ),
//                   ),
//                 if (meal.categoryId != null)
//                   Text(
//                     'Category: ${meal.categoryId}',
//                     style: TextStyle(
//                       color: isCompleted ? Colors.white70 : Colors.grey[400],
//                       fontSize: 12,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGuidelinesSection(MealPlan plan) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A1A1A),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey[800]!),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             '📋 Guidelines',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           if (plan.dos.isNotEmpty) ...[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('✅', style: TextStyle(fontSize: 16)),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Do\'s:',
//                         style: TextStyle(
//                           color: Color(0xFF4CAF50),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         plan.dos,
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             if (plan.donts.isNotEmpty) const SizedBox(height: 16),
//           ],
//           if (plan.donts.isNotEmpty)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('❌', style: TextStyle(fontSize: 16)),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Don\'ts:',
//                         style: TextStyle(
//                           color: Colors.redAccent,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         plan.donts,
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }

//   String _getMealTypeEmoji(TypeName typeName) {
//     switch (typeName) {
//       case TypeName.BREAKFAST:
//         return '🌅';
//       case TypeName.LUNCH:
//         return '🌞';
//       case TypeName.MEAL_TYPE_3:
//         return '🌆';
//       case TypeName.MEAL_TYPE_4:
//         return '🌙';
//     }
//   }

//   String _getMealTypeName(TypeName typeName) {
//     switch (typeName) {
//       case TypeName.BREAKFAST:
//         return 'Breakfast';
//       case TypeName.LUNCH:
//         return 'Lunch';
//       case TypeName.MEAL_TYPE_3:
//         return 'Evening Snack';
//       case TypeName.MEAL_TYPE_4:
//         return 'Dinner';
//     }
//   }

//   double _getDayProgress(MealPlanJson day) {
//     final totalMeals = day.mealTypes
//         .where((type) => type.meals.isNotEmpty)
//         .fold<int>(0, (sum, type) => sum + type.meals.length);

//     if (totalMeals == 0) return 0.0;

//     int completedCount = 0;
//     for (final type in day.mealTypes) {
//       for (int i = 0; i < type.meals.length; i++) {
//         final mealKey = '${day.dayName}_${type.typeName}_$i';
//         if (_completedMeals.contains(mealKey)) {
//           completedCount++;
//         }
//       }
//     }

//     return completedCount / totalMeals;
//   }

//   int _getTotalMealsCount(MealPlan plan) {
//     return plan.mealPlanJson.fold<int>(
//       0,
//       (sum, day) => sum + day.mealTypes.fold<int>(
//         0,
//         (daySum, type) => daySum + type.meals.length,
//       ),
//     );
//   }

//   int _getCompletedMealsCount(MealPlan plan) {
//     int completed = 0;
//     for (final day in plan.mealPlanJson) {
//       for (final type in day.mealTypes) {
//         for (int i = 0; i < type.meals.length; i++) {
//           final mealKey = '${day.dayName}_${type.typeName}_$i';
//           if (_completedMeals.contains(mealKey)) {
//             completed++;
//           }
//         }
//       }
//     }
//     return completed;
//   }

//   void _showProgressDialog(BuildContext context) {
//     final currentPlan = context.read<MealPlanBloc>().state;
//     if (currentPlan is! MealPlanLoaded || currentPlan.mealPlans.isEmpty) return;

//     final plan = currentPlan.mealPlans[_selectedPlanIndex];
//     final totalMeals = _getTotalMealsCount(plan);
//     final completedMeals = _getCompletedMealsCount(plan);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: const Color(0xFF1A1A1A),
//           title: const Text(
//             '📊 Progress Overview',
//             style: TextStyle(color: Colors.white),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               CircularProgressIndicator(
//                 value: totalMeals > 0 ? completedMeals / totalMeals : 0.0,
//                 strokeWidth: 8,
//                 backgroundColor: Colors.grey[700],
//                 valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 '$completedMeals / $totalMeals meals completed',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 '${totalMeals > 0 ? ((completedMeals / totalMeals) * 100).toInt() : 0}% Complete',
//                 style: TextStyle(
//                   color: Colors.grey[400],
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text(
//                 'Close',
//                 style: TextStyle(color: Color(0xFF4CAF50)),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  int selectedDayIndex = 0;
  int selectedMeal = 0;

  final List<DateTime> weekDays = List.generate(
    7,
    (index) => DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1 - index)),
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 80,
                child: Row(
                  children: List.generate(weekDays.length, (index) {
                    final day = weekDays[index];
                    final isSelected = selectedDayIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                          });
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
                                color: isSelected ? const Color(0xff161816) : Colors.transparent,
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
              ),
              const SizedBox(height: 20),
              Row(
                children: List.generate(meals.length, (index) {
                  final isSelected = selectedMeal == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMeal = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF6CFB82) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected ? null : Border.all(color: Colors.grey, width: 1),
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
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: const [
                    MealCard(
                      image: "assets/Homeimages/salad.png",
                      title: "Salad with Egg",
                      calories: "310 kcal .131 G",
                      protein: 26,
                      carbs: 20,
                      fat: 16,
                    ),
                    SizedBox(height: 20),
                    MealCard(
                      image: "assets/Homeimages/eggrost.png",
                      title: "Green Vegetables",
                      calories: "310 kcal .131 G",
                      protein: 26,
                      carbs: 20,
                      fat: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String image;
  final String title;
  final String calories;
  final int protein;
  final int carbs;
  final int fat;

  const MealCard({
    super.key,
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
      builder: (context) {
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
                        title,
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
                      child: Image.asset(image, fit: BoxFit.cover ,width: double.infinity,height: 110,),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "🕒 Prep Time: 15 minutes",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Ingredients:",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "• 2 boiled eggs (hard or soft, as you prefer)\n"
                      "• 1 cup lettuce or mixed greens\n"
                      "• 1/2 cucumber, sliced\n"
                      "• 1/2 tomato, diced\n"
                      "• 1/4 red onion, thinly sliced\n"
                      "• 1/4 avocado, sliced (optional)\n"
                      "• 1 tbsp olive oil\n"
                      "• 1 tsp lemon juice or vinegar\n"
                      "• Salt and pepper to taste\n"
                      "• Optional toppings: grated carrot, croutons, feta cheese, herbs",
                      style: TextStyle(color: Colors.grey, height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xff7FFA88).withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tips:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("• Want more protein? Add chickpeas or grilled chicken.\n"
                              "• For a creamy dressing, mix Greek yogurt with mustard and lemon juice.",
                              style: TextStyle(color: Colors.white, height: 1.4)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
                child: Image.asset(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                calories,
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
                    NutrientBar(label: "Protien", value: protein, color: const Color(0xFF43C26D)),
                    NutrientBar(label: "Carbo", value: carbs, color: const Color(0xFFE0EB51)),
                    NutrientBar(label: "Fat", value: fat, color: const Color(0xFF636AF8)),
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
                  height: (value / 30) * 60,
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
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(label, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
