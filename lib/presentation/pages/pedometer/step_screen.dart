import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/presentation/widgets/circural_progress.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class PedometerHomePage extends StatefulWidget {
  const PedometerHomePage({super.key});

  @override
  _PedometerHomePageState createState() => _PedometerHomePageState();
}

class _PedometerHomePageState extends State<PedometerHomePage>
    with TickerProviderStateMixin {
  late AnimationController _progressAnimationController;
  late AnimationController _floatingDotsController;
  late Animation<double> _progressAnimation;

  int stepOffset = 0; // 👈 New offset for real reset
  int currentSteps = 0;
  int goalSteps = 10000;
  int currentBPM = 72;
  int caloriesBurned = 0;
  int selectedIndex = 0;
  bool goalAchieved = false;
  bool showSuccessMessage = false;

  StreamSubscription<StepCount>? _stepCountStream;
  StreamSubscription<PedestrianStatus>? _pedestrianStatusStream;
  Timer? _bpmTimer;
  Timer? _successMessageTimer;

  String _status = 'stopped';
  String _steps = '0';
  String _errorMessage = '';
  bool _isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _requestPermissions();
    _startBPMSimulation();
  }

  void _initializeAnimations() {
    _progressAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _floatingDotsController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  Future<void> _requestPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
      _initPedometer();
    } else {
      setState(() {
        _errorMessage =
            'Permission denied. Please enable activity recognition in settings.';
      });
    }
  }

  void _initPedometer() {
    try {
      _initPlatformState();
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to initialize pedometer: $e';
      });
    }
  }

  void _initPlatformState() async {
    try {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream.listen(
        _onPedestrianStatusChanged,
        onError: _onPedestrianStatusError,
      );

      _stepCountStream = Pedometer.stepCountStream.listen(
        _onStepCount,
        onError: _onStepCountError,
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Pedometer not available: $e';
      });
    }

    if (!mounted) return;
  }

  void _onStepCount(StepCount event) {
    setState(() {
      currentSteps = event.steps - stepOffset;
      _steps = currentSteps.toString();
      _errorMessage = '';
      _calculateCalories();
      _checkGoalAchievement();
    });
    _updateProgressAnimation();
  }

  void _onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void _onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
      _errorMessage = 'Error reading step count: $error';
    });
  }

  void _onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
      _errorMessage = 'Error reading pedestrian status: $error';
    });
  }

  void _calculateCalories() {
    caloriesBurned = (currentSteps * 0.04).round();
  }

  void _checkGoalAchievement() {
    if (currentSteps >= goalSteps && !goalAchieved) {
      setState(() {
        goalAchieved = true;
        showSuccessMessage = true;
      });

      HapticFeedback.heavyImpact();
      _showSuccessDialog();

      _successMessageTimer?.cancel();
      _successMessageTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            showSuccessMessage = false;
          });
        }
      });
    }
  }

  void _updateProgressAnimation() {
    double progress = (currentSteps / goalSteps).clamp(0.0, 1.0);
    _progressAnimationController.animateTo(progress);
  }

  void _startBPMSimulation() {
   
      if (mounted) {
        setState(() {
          if (_status == 'walking') {
            currentBPM = 80 + math.Random().nextInt(40);
          } else {
            currentBPM = 65 + math.Random().nextInt(20);
          }
        });
      }
   
  }


  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF00FF88), width: 2),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF00FF88),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Goal Achieved!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00FF88),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Congratulations! You\'ve reached your daily step goal of ${goalSteps.toString()} steps!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                '🎉 Keep up the great work! 🎉',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF00FF88),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Color(0xFF00FF88),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showGoalEditDialog() {
    TextEditingController goalController = TextEditingController();
    goalController.text = goalSteps.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          title: const Text(
            'Set Your Goal',
            style: TextStyle(
              color: Color(0xFF00FF88),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your daily step goal:',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: goalController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF00FF88)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF00FF88), width: 2),
                  ),
                  hintText: 'Enter steps',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                int newGoal = int.tryParse(goalController.text) ?? goalSteps;
                if (newGoal > 0) {
                  setState(() {
                    goalSteps = newGoal;
                    goalAchieved = currentSteps >= goalSteps;
                  });
                  _updateProgressAnimation();
                }
                Navigator.of(context).pop();
              },
              child: const Text(
                'Set Goal',
                style: TextStyle(
                  color: Color(0xFF00FF88),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _resetSteps() {
    setState(() {
      stepOffset += currentSteps ; // ✅ Set new offset so next steps are relative
      currentSteps = 0;
      currentBPM = 72;
      goalAchieved = false;
      showSuccessMessage = false;
      caloriesBurned = 0;
    });
    _updateProgressAnimation();
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _floatingDotsController.dispose();
    _stepCountStream?.cancel();
    _pedestrianStatusStream?.cancel();
    _bpmTimer?.cancel();
    _successMessageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF000000), Color(0xFF111111)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
           
              Column(
                children: [
                   GestureDetector(
                     onTap: () {
                       Navigator.of(context).pop();
                     },
                     child: const Padding(
                       padding: EdgeInsets.only(left: 20, right: 20),
                       child: Align(alignment: Alignment.topLeft, child: Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
                     ),
                   ),
                  _buildHeader(),
                  if (_errorMessage.isNotEmpty) _buildErrorMessage(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCircularProgress(),
                          const SizedBox(height: 30),
                          _buildStatsCards(),
                          const SizedBox(height: 20),
                          if (!_isPermissionGranted) _buildPermissionButton(),
                          const SizedBox(height: 20),
                          IconButton(
                            onPressed: _resetSteps,
                            icon: const Icon(Icons.refresh),
                            color: Colors.white,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildBottomNavigation(),
                ],
              ),
              if (showSuccessMessage) _buildSuccessBanner(),
            ],
          ),
        ),
      ),
    );
  }
// resusing comapontes 
  Widget _buildErrorMessage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.red.withOpacity(0.1),
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.red.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionButton() {
    return ElevatedButton(
      onPressed: _requestPermissions,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00FF88),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: const Text(
        'Grant Permission',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSuccessBanner() {
    return Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00FF88), Color(0xFF00CC66)],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00FF88).withValues(alpha: 0.5),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.celebration, color: Colors.black, size: 30),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Goal Achieved! 🎉',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  showSuccessMessage = false;
                });
              },
              icon: const Icon(Icons.close, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only( left: 20, right: 20),
      child: Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'StepTracker',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Your Daily Fitness Companion',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF00FF88),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _status == 'walking' ? const Color(0xFF00FF88) : const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  _status == 'walking' ? 'ACTIVE' : 'IDLE',
                  style: TextStyle(
                    color: _status == 'walking' ? Colors.black : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return GestureDetector(
      onTap: _showGoalEditDialog,
      child: SizedBox(
        width: 280,
        height: 280,
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            double progress = (currentSteps / goalSteps).clamp(0.0, 1.0);
            return CustomPaint(
              painter: CircularProgressPainter(
                progress: progress,
                progressColor: goalAchieved ? const Color(0xFF00FFAA) : const Color(0xFF00FF88),
                backgroundColor: const Color(0xFF333333),
                strokeWidth: 12,
              ),
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [Color(0xFF1A1A1A), Color(0xFF000000)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: goalAchieved 
                          ? const Color(0xFF00FF88).withValues(alpha: 0.3)
                          : Colors.black.withValues(alpha: 0.8),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentSteps.toString(),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: goalAchieved ? const Color(0xFF00FFAA) : const Color(0xFF00FF88),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'STEPS',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFF00FF88).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Goal: ${goalSteps.toString().replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF00FF88),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(progress * 100).toInt()}% Complete',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                        ),
                      ),
                      if (goalAchieved)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00FFAA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              '✅ COMPLETED!',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatsCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              emoji: '❤️',
              value: currentBPM.toString(),
              label: 'BPM',
              subtitle: _status == 'walking' ? 'Active' : 'Resting',
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _buildStatCard(
              emoji: '🔥',
              value: caloriesBurned.toString(),
              label: 'CALORIES',
              subtitle: 'Burned',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
   
    required String emoji,
    required String value,
    required String label,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A1A), Color(0xFF0D0D0D)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF333333)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF00FF88),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF888888),
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF666666),
              ),
            ),
        
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF333333), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, '👟', 'Steps'),
          _buildNavItem(1, '📊', 'Stats'),
          _buildNavItem(2, '🎯', 'Goals'),
          _buildNavItem(3, '⚙️', 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        
        // For testing: reset steps when tapping settings
        // if (index == 3) {
        //   _resetSteps();
        // }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF00FF88).withValues(alpha: 0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF00FF88) : const Color(0xFF333333),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(
                    fontSize: 16,
                    color: isActive ? Colors.black : const Color(0xFF888888),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? const Color(0xFF00FF88) : const Color(0xFF888888),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


