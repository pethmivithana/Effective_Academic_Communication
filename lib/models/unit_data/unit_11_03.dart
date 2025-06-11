import '../unit_model.dart';

final UnitModel unit11_3 = UnitModel(
  unitIndex: 47,
  unitName: "Responding with Critical Thinking",
  introductionText: """
Hello everyone!
Welcome to our third lesson in Unit 11. Today, we will focus on the lesson “responding with critical thinking” during oral exams and viva voce sessions. Whether you’re in a formal exam or an academic discussion, applying critical thinking will help you give well-reasoned, structured answers that truly reflect your understanding.
Lesson Objectives
By the end of this lesson, students will be able to:
1.	Understand the importance of critical thinking in oral exams and viva voce.
2.	Develop strategies to analyze and evaluate questions before responding.
3.	Apply critical thinking skills to structure clear and logical answers.
""",

  preClassActivityDescription: """
To begin, watch the video below on the key aspects of critical thinking and how it applies in academic settings.

After watching, answer the following simple quiz:
""",
  preClassActivityVideo:"https://www.youtube.com/watch?v=6OLPL5p0fMg",

  preClassQuestions:[
    PreClassQuestion(
      questionText: 'What does critical thinking primarily involve?',
      options: [
        'a) Memorizing information',
        'b) Analyzing and evaluating information',
        'c) Repeating answers word-for-word',
        'd) Agreeing with the professor’s views',
      ],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText: 'Which of the following is an example of critical thinking?',
      options: [
        'a) Accepting an idea because it’s widely accepted',
        'b) Asking questions to understand the reasoning behind an idea',
        'c) Agreeing without thinking',
        'd) Following instructions without questioning',
      ],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText:
      'Why is critical thinking important during an oral exam?',
      correctAnswer:
      'Critical thinking is important because it allows you to analyze questions, provide thoughtful responses, and explain your reasoning clearly. It helps you demonstrate a deeper understanding of the subject rather than just memorized facts.',
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription1: """ 
Question:
“What are the benefits and challenges of online education compared to traditional classroom learning?”

Step 1: Analyze the Question

Identify the two key parts: benefits and challenges of online education

Step 2: Structure Your Answer

•	Introduction
•	Main Body (Benefits and Challenges)
•	Conclusion

Step 3: Support Your Answer
 
Give at least one relevant example each for benefits and challenges.

Step 4: Write Your Final Response

Submit your response in the space provided. 
""",

  practiceUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375240",


  practiceActivityDescription2: """
We have given an interesting video taken from TED-Ed about “critical thinking.” This will refresh your mind.""",

  practiceVideoUrl:"https://www.youtube.com/watch?v=JpYA7WXkHyI",

  instructionsText: """
Now, let's go through a brief recorded lecture where we discuss the practical use of critical thinking during oral exams and vivas. After watching, complete the practice tasks that follow.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=ZDZQdnY4OWRsSV82NzcyNg==",

  summary: """
In this lesson, we learned how to use critical thinking to give thoughtful, well-structured responses in oral exams and viva settings. From analyzing questions to organizing your thoughts clearly and providing solid examples, you are now better equipped to face these academic challenges confidently.""",

  inClassActivity: """
I'm excited to meet you in class to practice these skills through mock viva sessions and interactive speaking activities. Come prepared to share your ideas! 
""",

  quizQuestions: [
    QuizQuestion(
      question: 'What is the first step in responding to a complex exam question?',
      options: [
        'a) Give an answer immediately',
        'b) Analyze the question',
        'c) Start with an example',
        'd) Skip the question if unsure',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Why is it important to support your answers with examples in oral exams?',
      options: [
        'a) To make your response sound more knowledgeable',
        'b) To provide concrete evidence for your claims',
        'c) To show that you have memorized the material',
        'd) To fill time',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'In what order should you structure your response in an oral exam?',
      options: [
        'a) Give your conclusion first, then body, then introduction',
        'b) Introduction, body, conclusion',
        'c) Body, conclusion, introduction',
        'd) Random order',
      ],
      correctOptionIndex: 1,
    ),
  ],
);
