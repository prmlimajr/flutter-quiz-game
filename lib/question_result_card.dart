import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionResultCard extends StatelessWidget {
  const QuestionResultCard(this.data, {super.key});

  final Map<String, Object> data;

  Color getColor() {
    if (data['user_answer'] == data['correct_answer']) {
      return const Color.fromARGB(255, 87, 155, 233);
    } else {
      return  const Color.fromARGB(255, 199, 17, 216);
    }
  }

  @override
  Widget build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: getColor(),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                ((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 78, 13, 151),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String, 
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(197, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data['user_answer'] as String, 
                style: GoogleFonts.lato(
                  color: getColor(),
                ),
              ),
              Text(
                data['correct_answer'] as String, 
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 87, 155, 233),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
