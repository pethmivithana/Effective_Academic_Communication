import '../unit_model.dart';

final UnitModel unit5_0 = UnitModel(
  unitIndex: 19,
  unitName: "Academic Discussion and Viva Preparation",
  introductionText: """
Hello everyone, welcome to Unit 5!
In this unit, we begin our journey into preparing for academic discussions and the viva voce. Academic discussions are formal conversations that require clarity, structure, and confidence, especially during a viva, where you are expected to explain, defend, and reflect on your work. As students in the computing field, you’ll often need to present technical ideas, justify decisions, and respond to critical questions.
This lesson helps you take the first step by focusing on how to express your ideas clearly and appropriately in academic conversations. We'll explore how to stay focused on a topic, respond with relevance, and use appropriate academic language. By strengthening these skills, you’ll be better prepared not just for your viva, but for teamwork, presentations, and interviews in your academic and professional journey.
By the end of this lesson, you will be able to:
1. Understand what academic discussion involves in a computing context
2. Identify the key features of effective participation in academic conversations
3. Recognize the importance of language, tone, and body language
4. Practice using academic phrases to express opinions and respond clearly""",

  preClassActivityDescription: """
Before we begin the lesson, let’s warm up by facing a small challenge!
Step 1: Watch the short video of a student responding in a viva exam.
Step 2: While watching, answer the following:""",

  preClassQuestions: [
    PreClassQuestion(
      questionText: "What phrases did the student use to explain their ideas?",
      correctAnswer: "null",
    ),
    PreClassQuestion(
      questionText: "How did the student respond to the examiner’s questions?",
      correctAnswer: "null",
    ),
    PreClassQuestion(
      questionText: "What body language or tone of voice stood out to you?",
      correctAnswer: "null",
    )
  ],

  preClassActivityVideo:"https://www.youtube.com/watch?v=YY2yjEEoB3U ",

  practiceActivityDescription1: """ 
Below is a short dialogue from an academic discussion. Read the conversation and fill in the blanks using the most suitable academic words or phrases from the word bank provided.

Word Bank:
In my opinion / Furthermore / To clarify / I agree with your point / However / That’s a valid question / From a technical perspective / As a result""",
  practiceActivityQuestions1: [
    PracticeQuestion1(
      questionText: """
Examiner: Can you explain why you chose to implement this algorithm?

Student: ___________, this algorithm provides faster processing time for large datasets compared to traditional methods.""",
      correctAnswer: "From a technical perspective",
    ),
    PracticeQuestion1(
      questionText: """
Student: ___________, it uses less memory.""",
      correctAnswer: "Furthermore",
    ),
    PracticeQuestion1(
      questionText: """
Examiner: I see. Some researchers suggest another approach. What is your view on that?

Student:  ___________, the alternative approach has its strengths.""",
      correctAnswer: "In my opinion",
    ),
    PracticeQuestion1(
      questionText: "Student: ___________, I believe my method suits the project's requirements better.",
      correctAnswer: "However",
    ),
    PracticeQuestion1(
      questionText: """
Examiner: Some parts of your explanation were unclear. Can you go over the second step again?

Student: ___________, in the second step, the program filters the data based on the user’s input before analysis.""",
      correctAnswer: "To clarify",
    ),
    PracticeQuestion1(
      questionText: """
Examiner: That makes more sense now. Do you think this can be improved further?

Student: ___________. We could explore integrating AI-based optimization to enhance performance.""",
      correctAnswer: "That’s a valid question",
    ),
    PracticeQuestion1(
      questionText: "Student: ___________, the system would be more adaptive and scalable.",
      correctAnswer: "As a result",
    ),
  ],

  practiceActivityDescription2: """
Go to the given website

Record a 30-second response to this question: Why is clear communication important in a viva?

Use at least two academic phrases from the lesson video.

Check the speech-to-text output to see if it reflects your intended message.

Submit your final audio with clear pronunciation and tone.""",

  practiceActivityLink2: "https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2: "https://courseweb.sliit.lk/mod/assign/view.php?id=375192",

  instructionsText: """
Watch the video lesson given below. You’ll learn about the purpose of a viva, the expectations in academic discussions, and how to present ideas clearly. Take notes while watching. Focus on how to introduce an idea, phrases to agree or disagree respectfully and the body language tips.""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=U08xcWZnZzBjdF82NzgzMA==",

  summary: """
In this lesson, you were introduced to the foundations of academic discussion and how they relate to viva preparation. You learned that academic discussions are structured, formal, and goal-oriented conversations, where clarity, relevance, and respectful responses are key. We explored how to express opinions, clarify ideas, and use proper academic language in a computing context. Through video observation, interactive games, and speaking practice, you’ve begun to develop the confidence and skills needed for more complex discussions. These communication strategies are not only useful for viva exams but are essential in your academic journey and future career.
See you in the next lesson!""",

  inClassActivity: """
Great job completing the lesson!
Now that you've been introduced to academic discussions and learned how to express your ideas clearly and confidently, it’s time to put those skills into practice together. In our classroom session, we’ll engage in short viva-style conversations where you’ll respond to typical examiner questions using the academic phrases you’ve learned.
If you’re unsure about how to phrase something or need more practice expressing your ideas formally, bring your questions to class—we’ll tackle them together, and your lecturer will help you refine your answers.
Looking forward to hearing your voices and seeing your confidence grow in action!""",

  quizQuestions: [
    QuizQuestion(
      question: "What is the main purpose of an academic discussion?",
      options: [
        "To talk freely with friends",
        "To present and discuss ideas formally",
        "To complain about assignments",
        "To memorize textbook content"
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Which phrase would best introduce your opinion in a viva?",
      options: [
        "You are wrong.",
        "I don’t know.",
        "In my opinion…",
        "Anyway, let’s skip that."
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Identify the inappropriate response in a formal discussion:",
      options: [
        "I believe that this approach is suitable.",
        "I totally disagree with you!",
        "That’s an interesting question. Let me explain.",
        "From my experience, this method works."
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "What is a good way to clarify your point if the examiner seems confused?",
      options: [
        "As I mentioned earlier, let me rephrase…",
        "You weren’t listening!",
        "Forget it.",
        "You should already know this."
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "Write one academic expression you could use to politely disagree with someone in a discussion.",
      correctTextAnswer: "I see your point, but I have a different perspective.",
      isTextAnswer: true,
    ),
  ],
);
