import 'package:flutter/material.dart';
import 'dart:async';

class TimeStart extends StatefulWidget {
  const TimeStart({super.key});

  @override
  State<TimeStart> createState() => _TimeStartState();
}

class _TimeStartState extends State<TimeStart> {
  Timer? _timer;
  int _seconds = 30; // Starting time: 30 seconds
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            _stopTimer();
            // Timer finished - you can add completion logic here
          }
        });
      });
    }
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _seconds = 30; // Reset to initial time
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _pauseTimer();
    } else {
      _startTimer();
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Squats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 150,
                height: 271,
                child: Image.asset("assets/workout/workoutwomen.png"),
              ),
              const SizedBox(height: 100),
              const Text(
                "Lower Body Training",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                _formatTime(_seconds),
                style: TextStyle(
                    color: _seconds <= 10 ? Colors.red : Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: _toggleTimer,
                        child: Container(
                          width: 140,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF7FFA88),
                                Color(0xFF4B9451),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            _isRunning ? Icons.pause : Icons.play_arrow, 
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _stopTimer,
                    child: Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.only(
                          right: 16), // optional right padding
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.stop, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
