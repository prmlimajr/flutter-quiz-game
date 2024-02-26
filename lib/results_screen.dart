import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.resetGame,
  });

  final List<String> chosenAnswers;
  final void Function() resetGame;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numCorrectQuestions of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 201, 153, 251),
                ),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              TextButton(
                onPressed: resetGame,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Restart Quiz', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
