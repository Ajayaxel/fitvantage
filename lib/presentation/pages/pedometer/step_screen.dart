import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepTrackerHomePage extends StatefulWidget {
  const StepTrackerHomePage({Key? key}) : super(key: key);

  @override
  State<StepTrackerHomePage> createState() => _StepTrackerHomePageState();
}

class _StepTrackerHomePageState extends State<StepTrackerHomePage>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _stepController;
  late AnimationController _floatingDotsController;
  late Animation<double> _progressAnimation;
  late Animation<int> _stepAnimation;

  // Real-time data variables
  int stepOffset = 0;
  int currentSteps = 0;
  int goalSteps = 10000;
  int currentBPM = 72;
  double caloriesBurned = 0.0;
  bool goalAchieved = false;
  bool showSuccessMessage = false;

  // Stream subscriptions for real-time data
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
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _stepController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _floatingDotsController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    _stepAnimation = IntTween(
      begin: 0,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _stepController,
      curve: Curves.easeOut,
    ));
  }

  // Request permissions for step counting
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

  // Initialize pedometer
  void _initPedometer() {
    try {
      _initPlatformState();
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to initialize pedometer: $e';
      });
    }
  }

  // Initialize platform state for pedometer
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

  // Handle step count updates
  void _onStepCount(StepCount event) {
    setState(() {
      currentSteps = event.steps - stepOffset;
      _steps = currentSteps.toString();
      _errorMessage = '';
      _calculateCalories();
      _checkGoalAchievement();
    });
    _updateAnimations();
  }

  // Handle pedestrian status changes
  void _onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  // Handle step count errors
  void _onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
      _errorMessage = 'Error reading step count: $error';
    });
  }

  // Handle pedestrian status errors
  void _onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
      _errorMessage = 'Error reading pedestrian status: $error';
    });
  }

  // Calculate calories burned
  void _calculateCalories() {
    caloriesBurned = (currentSteps * 0.04);
  }

  // Check if goal is achieved
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

  // Update animations with new data
  void _updateAnimations() {
    double progress = (currentSteps / goalSteps).clamp(0.0, 1.0);

    // Update progress animation
    _progressAnimation = Tween<double>(
      begin: _progressAnimation.value,
      end: progress,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOut,
    ));

    // Update step animation
    _stepAnimation = IntTween(
      begin: _stepAnimation.value,
      end: currentSteps,
    ).animate(CurvedAnimation(
      parent: _stepController,
      curve: Curves.easeOut,
    ));

    _progressController.forward(from: 0);
    _stepController.forward(from: 0);
  }

  // Simulate BPM changes
  void _startBPMSimulation() {
    _bpmTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          if (_status == 'walking') {
            currentBPM = 80 + math.Random().nextInt(40);
          } else {
            currentBPM = 65 + math.Random().nextInt(20);
          }
        });
      }
    });
  }

  // Show success dialog when goal is achieved
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
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
                  color: Color(0xFF4CAF50),
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
                  color: Color(0xFF4CAF50),
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
                  color: Color(0xFF4CAF50),
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

  // Reset step counter
  void _resetSteps() {
    setState(() {
      stepOffset += currentSteps;
      currentSteps = 0;
      currentBPM = 72;
      goalAchieved = false;
      showSuccessMessage = false;
      caloriesBurned = 0.0;
    });
    _updateAnimations();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _stepController.dispose();
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
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                bool isMobile = screenWidth < 600;
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 40,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          _buildHeader(isMobile),
                          if (_errorMessage.isNotEmpty)
                            _buildErrorMessage()
                          else
                            const SizedBox(
                              height: 130,
                            ),
                          _buildStepsDisplay(isMobile),
                          _buildSemicircularProgress(isMobile),
                          const SizedBox(
                            height: 100,
                          ),
                          _buildStatsCards(isMobile),
                          const SizedBox(
                            height: 20,
                          ),
                          if (!_isPermissionGranted) ...[
                            _buildPermissionButton(),
                          ],
                          SizedBox(height: isMobile ? 40 : 60),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            if (showSuccessMessage) _buildSuccessBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: _buildHeaderButton(Icons.arrow_back_ios_new, isMobile),
        ),
        Column(
          children: [
            Text(
              'StepTracker',
              style: TextStyle(
                fontSize: isMobile ? 24 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Your Daily Fitness Companion',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF94CD7B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _resetSteps,
          child: _buildHeaderButton(Icons.refresh, isMobile),
        ),
      ],
    );
  }

  Widget _buildHeaderButton(IconData icon, bool isMobile) {
    return Container(
      width: isMobile ? 48 : 56,
      height: isMobile ? 48 : 56,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: isMobile ? 20 : 24,
      ),
    );
  }

  Widget _buildStepsDisplay(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.directions_walk,
          color: Colors.white,
          size: isMobile ? 32 : 40,
        ),
        SizedBox(width: isMobile ? 20 : 30),
        AnimatedBuilder(
          animation: _stepAnimation,
          builder: (context, child) {
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: _stepAnimation.value.toString(),
                    style: TextStyle(
                      fontSize: isMobile ? 64 : 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: ' steps',
                    style: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // SizedBox(height: isMobile ? 10 : 15),
        // Text(
        //   'Status: $_status',
        //   style: TextStyle(
        //     fontSize: isMobile ? 14 : 16,
        //     color: _status == 'walking' ? const Color(0xFF4CAF50) : const Color(0xFF666666),
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }

  Widget _buildSemicircularProgress(bool isMobile) {
    double size = isMobile ? 300 : 350;
    double progress = currentSteps / goalSteps;
    int progressPercent = (progress * 100).round();
    int stepsLeft = math.max(0, goalSteps - currentSteps);

    return Container(
      width: size,
      height: size / 2 + 40,
      child: Stack(
        children: [
          // Progress Arc
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(size, size / 2 + 40),
                painter: SemicircularProgressPainter(
                  progress: _progressAnimation.value,
                  strokeWidth: isMobile ? 20 : 25,
                ),
              );
            },
          ),
          // Center content
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    int animatedPercent =
                        (_progressAnimation.value * 100).round();
                    return Text(
                      '$animatedPercent%',
                      style: TextStyle(
                        fontSize: isMobile ? 40 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                Text(
                  stepsLeft > 0 ? '$stepsLeft steps left' : 'Goal achieved!',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: goalAchieved
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          // Start and end labels
          Positioned(
            bottom: -5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF666666),
                  ),
                ),
                Text(
                  goalSteps.toString(),
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards(bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.favorite_outline,
            title: 'Heart Rate',
            value: '$currentBPM bpm',
            showHeartChart: true,
            isMobile: isMobile,
          ),
        ),
        SizedBox(width: isMobile ? 16 : 20),
        Expanded(
          child: _buildStatCard(
            icon: Icons.local_fire_department_outlined,
            title: 'Calories',
            value: '${caloriesBurned.toStringAsFixed(1)} cal',
            showHeartChart: false,
            isMobile: isMobile,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required bool showHeartChart,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, // center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // center items horizontally in row
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: isMobile ? 18 : 20,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),
          SizedBox(
            height: isMobile ? 32 : 40,
            child: showHeartChart
                ? CustomPaint(
                    painter: HeartRateChartPainter(),
                    size: Size(double.infinity, isMobile ? 32 : 40),
                  )
                : CustomPaint(
                    painter: CalorieGaugePainter(
                      progress: (caloriesBurned / 400).clamp(0.0, 1.0),
                    ),
                    size: Size(double.infinity, isMobile ? 32 : 40),
                  ),
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
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
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
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
            colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4CAF50).withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.celebration, color: Colors.white, size: 30),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Goal Achieved! 🎉',
                style: TextStyle(
                  color: Colors.white,
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
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for semicircular progress
class SemicircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  SemicircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 20);
    final radius = size.width / 2 - strokeWidth / 2;

    // Background arc
    final backgroundPaint = Paint()
      ..color = const Color(0xFF2A2A2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = math.pi;
    const sweepAngle = math.pi;
    final progressSweep = sweepAngle * progress;

    // Draw background
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweep,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Custom painter for heart rate chart
class HeartRateChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final points = <Offset>[
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.1, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.2),
      Offset(size.width * 0.3, size.height * 0.9),
      Offset(size.width * 0.4, size.height * 0.1),
      Offset(size.width * 0.5, size.height * 0.8),
      Offset(size.width * 0.6, size.height * 0.8),
      Offset(size.width * 0.7, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.9),
      Offset(size.width * 0.9, size.height * 0.1),
      Offset(size.width, size.height * 0.8),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for calorie gauge
class CalorieGaugePainter extends CustomPainter {
  final double progress;

  CalorieGaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.height;

    // Background arc
    final backgroundPaint = Paint()
      ..color = const Color(0xFF2A2A2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    const startAngle = math.pi;
    const totalAngle = math.pi;
    final progressAngle = totalAngle * progress;

    // Draw background
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalAngle,
      false,
      backgroundPaint,
    );

    // Draw progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
