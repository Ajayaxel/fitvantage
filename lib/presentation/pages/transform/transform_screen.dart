import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_bloc.dart';
import 'package:my_app/blocs/lifestyle/lifestyle_event.dart';
import 'package:my_app/constsatnce/const_button.dart';
import 'package:my_app/presentation/pages/lifestylequestionnaire/questionnaire_screen.dart';
import 'package:my_app/presentation/pages/pedometer/step_screen.dart';
import 'package:my_app/repositories/lifestyle_repository.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PedometerHomePage()));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Heart Rate Info
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FontAwesomeIcons.heartPulse,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '78 BPM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Step Count Info
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FontAwesomeIcons.personWalking,
                          color: Colors.greenAccent,
                          size: 30,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '4,230 Steps',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Constbutton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => LifestyleBloc(LifestyleRepository())
                        ..add(FetchLifestyleQuestions()),
                      child: LifestyleQuestionPage(),
                    ),
                  ),
                );
              },
              text: "Start Assessment",
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
