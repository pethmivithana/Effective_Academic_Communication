//error in praactice activity
import '../unit_model.dart';

final UnitModel unit5_3 = UnitModel(
  unitIndex: 22,
  unitName: "Handling Examiner Questions",
  introductionText: """
Hello and welcome!
In this lesson, we’ll explore one of the most crucial aspects of academic discussions and viva voce exams—handling examiner questions with clarity and confidence. During a viva, it’s not just about what you know but also how effectively you can explain, defend, or clarify your answers under pressure.
As computing undergraduates, you’ll often be asked to justify your technical decisions, explain project outcomes, or reflect on what could have been done differently. Examiner questions can vary from clarification prompts to critical evaluations, and this lesson will give you strategies and language tools to manage them smoothly.
Whether you're answering confidently, asking for clarification, or responding to challenging feedback, you'll learn how to stay composed, respectful, and academically appropriate in your responses. Let’s get ready to take your communication to the next level! 
By the end of this lesson, you will be able to:
•	Understand the types of questions commonly asked during a viva
•	Use polite and clear language to respond to difficult or unexpected questions
•	Ask for clarification when needed
•	Apply strategies to stay calm and composed during examiner interactions
""",

  preClassActivityDescription: """
Before we start the lesson, let’s do a small activity…  
Think about a time when you were asked a challenging question in class or during a presentation. Reflect on the experience and answer the following.

1.	What was the question?

2.	How did you feel at that moment?

3.	How did you respond? 

4.	Looking back, what would you have done differently?

Use phrases like: “I should have clarified…”, “Next time, I would say…”, “I could respond more confidently by…”
""",

  preClassActivityUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375196",

  practiceActivityDescription1: """ 
It’s time to practice thinking and speaking under pressure—just like in a viva!

Go to given website

Choose three of the following examiner-style questions to answer in your own words:

•	Can you explain why you selected this method?

•	What challenges did you face, and how did you solve them?

•	If you had more time, what would you improve in this project?

•	How does your solution compare to existing ones?

•	What did you learn from this experience?

Record a one-minute audio using at least three polite academic expressions from the lesson.

Save and submit your audio link via the app.

Don’t worry about being perfect—this is all about practicing your response style and tone.
""",
  practiceActivityLink:"https://vocaroo.com",
  practiceUploadLink:"https://courseweb.sliit.lk/mod/assign/view.php?id=375197",

  practiceActivityDescription2: """
Fill in the blanks using the correct phrases from the word bank to complete the dialogue between a student and an examiner.

Word Bank:
If I understand you correctly – That’s a great question – Let me clarify that – Based on my findings – I appreciate your feedback – To be honest – In that case – What I intended to show was
""",

  practiceActivityQuestions2: [
  PracticeQuestion2(
    questionText: 'Examiner: You mentioned performance improvement. Can you explain how you measured that?\nStudent: __________. I used response time and memory usage metrics during the testing phase.',
    correctAnswer: 'That’s a great question',
  ),
  PracticeQuestion2(
    questionText: "Examiner: But your chart doesn't reflect memory efficiency.\nStudent: __________. __________, the chart was focused on speed, but I can add another section for memory usage in the final version.",
    correctAnswer: 'I appreciate your feedback – Let me clarify that',
  ),
  PracticeQuestion2(
    questionText: 'Examiner: Okay. So would you consider another method if you had more time?\nStudent: __________, yes. I would have explored machine learning-based optimization.',
    correctAnswer: 'To be honest',
  ),
  PracticeQuestion2(
    questionText: 'Examiner: Some parts of your explanation were unclear. Can you walk me through the second phase again?\nStudent: __________, the second phase involved backend integration using Node.js and MongoDB.',
    correctAnswer: 'What I intended to show was',
  ),
  ],

  instructionsText: """
Now let’s watch a short video lesson explaining how to handle different types of examiner questions. You’ll learn practical phrases and techniques like asking for clarification, using pauses effectively, and staying polite—even when unsure. You can take notes on the question types: clarification, justification, reflection and useful phrases: “That’s an interesting point…”, “If I understand you correctly…”, “Let me clarify…”
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
You’ve successfully completed a crucial lesson in viva and academic communication! In this unit, you learned how to handle examiner questions effectively—whether they’re asking for clarification, challenging your choices, or requesting further explanation. You practiced using academic expressions like “Let me clarify that” and “That’s an interesting question,” which help you stay calm, polite, and professional in high-stakes conversations.
We also explored the importance of listening actively, pausing to think, and framing your answers thoughtfully, especially when you're under pressure. Whether you're in a real viva, an internship interview, or a technical meeting, these skills will help you respond with confidence and clarity.
Keep practicing, and you’ll soon master the art of academic interaction!""",

  inClassActivity: """
Congratulations on finishing the lesson!
Now it’s time to bring your skills into the real world. In our classroom session, we’ll hold a mini viva simulation where you’ll take turns playing the role of both examiner and student. You’ll respond to technical and reflective questions while applying the polite academic phrases and strategies you’ve practiced. If anything was unclear or you want more chances to practice, bring your questions—we’ll go through them as a group, and your lecturer will help you refine your responses.
Looking forward to hearing you handle those tough questions like a pro!
""",

  quizQuestions: [
    QuizQuestion(
      question: "Which of these is a polite way to ask for clarification during a viva?",
      options: [
        "What?",
        "Can you repeat that?",
        "I don’t understand.",
        "If I understand you correctly, you’re asking…?",
      ],
      correctOptionIndex: 3,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Choose a phrase that politely disagrees with the examiner:",
      options: [
        "I see your point, but based on my findings…",
        "That’s wrong.",
        "I think you misunderstood.",
        "I’m not sure that’s accurate.",
      ],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "What’s the benefit of using pauses during a response?",
      options: [
        "To seem unsure",
        "To think before you speak",
        "To ignore the question",
        "To waste time",
      ],
      correctOptionIndex: 1,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Rewrite this response in a more formal and polite way:\nI don’t know what you’re talking about.",
      correctTextAnswer: "I'm not sure I understand your question. Could you please clarify?",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Give one strategy to stay calm and focused during difficult examiner questions. Provide an example phrase.",
      correctTextAnswer: "Take a deep breath and pause before answering. For example, say: 'That’s a good question. Let me think for a moment.'",
      isTextAnswer: true,
    ),
  ],
);
