import 'package:flutter/material.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/summary_screen.dart';

class QuizScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const QuizScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<QuizQuestion> quizQuestions;
  List<String?> selectedAnswers = [];
  bool showResults = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    quizQuestions = widget.unitData?.quizQuestions ?? [];
    selectedAnswers = List.filled(quizQuestions.length, null);
  }

  void uploadAnswers() {
    if (selectedAnswers.contains(null) || selectedAnswers.contains("")) {
      setState(() {
        errorMessage = "Please answer all questions before submitting.";
      });
      return;
    }

    setState(() {
      showResults = true;
      errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = quizQuestions.length;
    final answered =
        selectedAnswers.where((a) => a != null && a!.isNotEmpty).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subunitTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF010066),
        centerTitle: true,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: widget.unitData == null || quizQuestions.isEmpty
          ? const Center(
        child: Text(
          "No quiz questions available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Column(
        children: [
          if (errorMessage != null)
            Container(
              width: double.infinity,
              color: Colors.red.shade100,
              padding: const EdgeInsets.all(10),
              child: Text(
                errorMessage!,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: LinearProgressIndicator(
              value: total == 0 ? 0 : answered / total,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                  answered == total ? Colors.green : Colors.orange),
            ),
          ),
          const Text(
            "🎯 End Lesson Quiz",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF010066),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: quizQuestions.length,
              itemBuilder: (context, index) {
                final question = quizQuestions[index];
                final isCorrect = question.options != null &&
                    selectedAnswers[index] ==
                        question.options![question.correctOptionIndex ?? 0];

                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q${index + 1}: ${question.question}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        if (question.description != null &&
                            question.description!.isNotEmpty)
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 6.0, bottom: 12.0),
                            child: Text(
                              question.description!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ),
                        if (question.options != null)
                          ...question.options!.map((option) {
                            bool selected = selectedAnswers[index] == option;
                            bool correct = option ==
                                question.options![
                                question.correctOptionIndex ?? 0];

                            return Tooltip(
                              message: showResults && correct
                                  ? "This is the correct answer"
                                  : "",
                              child: RadioListTile<String>(
                                activeColor: showResults
                                    ? (correct ? Colors.green : Colors.red)
                                    : const Color(0xFF010066),
                                title: Text(
                                  option,
                                  style: TextStyle(
                                    color: showResults
                                        ? (correct
                                        ? Colors.green
                                        : selected
                                        ? Colors.red
                                        : Colors.black)
                                        : Colors.black,
                                    fontWeight: selected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                value: option,
                                groupValue: selectedAnswers[index],
                                onChanged: showResults
                                    ? null
                                    : (value) {
                                  setState(() {
                                    selectedAnswers[index] = value;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        if (question.isTextAnswer)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  selectedAnswers[index] = value;
                                },
                                decoration: const InputDecoration(
                                  labelText: "Your Answer",
                                  border: OutlineInputBorder(),
                                ),
                                enabled: !showResults,
                              ),
                              if (showResults &&
                                  question.correctTextAnswer != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Correct Answer: ${question.correctTextAnswer}",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            ElevatedButton.icon(
            onPressed: showResults ? null : uploadAnswers,
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text("Submit Answers"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010066),
                foregroundColor: Colors.white, // Makes text color white
                iconColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                minimumSize: const Size(160, 50),
              ),
            ),


                ElevatedButton.icon(
                  onPressed: showResults
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          unitIndex: widget.unitIndex,
                          subunitIndex: widget.subunitIndex,
                          subunitTitle: widget.subunitTitle,
                          unitData: widget.unitData,
                        ),
                      ),
                    );
                  }
                      : null,
                  icon: const Icon(Icons.summarize, color: Colors.white),
                  label: const Text("Next: Summary"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF010066),
                    foregroundColor: Colors.white, // Ensures text color is white
                    iconColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    minimumSize: const Size(160, 50),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
