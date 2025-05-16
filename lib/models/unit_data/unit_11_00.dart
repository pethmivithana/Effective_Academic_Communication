import '../unit_model.dart';

final UnitModel unit11_0 = UnitModel(
  unitIndex: 44,
  unitName: "Mastering Oral Exams & Viva Voce",
  introductionText: """
Hello, future computing professionals!
Oral exams and viva voce sessions can feel a little intimidating, can’t they? You're asked to speak clearly, explain your work, and respond on the spot. But here’s a secret: you can totally master them with the right tools and mindset! In this lesson, we’ll focus on how to prepare for and ace your viva by organizing your thoughts, using academic language, and showing confidence—even when you feel nervous inside.
In computing fields, you're often asked to justify your decisions—whether it's your choice of algorithm, programming logic, or system design. The viva isn’t just about what you know, but how well you can explain and defend your knowledge. This lesson will help you sound more professional, calm, and structured during your oral assessments. By the end, you’ll be well on your way to becoming a viva pro!
By the end of this lesson, you will be able to:
•	Understand how to structure a strong oral response.
•	Use polite and academic phrases to agree, disagree, and clarify.
•	Present your technical decisions clearly and confidently.
•	Practice techniques to manage anxiety and stay calm under pressure.
""",

  preClassActivityDescription: """
Before we dive in, let’s check how you feel about oral exams. Select one emoji that best describes your confidence level right now:
🫣 – I panic just thinking about it
😬 – I’ve tried it but I freeze
🙂 – I can manage with some help
😎 – I feel confident and ready!
""",

  preClassQuestions:[
    PreClassQuestion(
      questionText: "Write one sentence about why you feel this way. \nExample: 😬 – I get nervous because I don’t know how to start answering the questions.",
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription1: """ 
Here’s a messy viva response. Rearrange the pieces into a clear, logical academic answer.

Scrambled Phrases:
	Let me begin by stating the problem this study addresses.
	Firstly, let me explain how the data was collected.
	From my findings, this algorithm performs better on sparse datasets.
	To conclude, the selected model improves efficiency by 20%.
	Furthermore, this method allows for easier real-time implementation.
	That decision was based on both practical constraints and performance needs.
	I’d be happy to elaborate on that if needed.

""",

  practiceActivityQuestions1:[
  PracticeQuestion1(
    questionText: "Which is the correct order to form a clear academic viva response?",
    options: [
      "1. Let me begin by stating the problem this study addresses. → 2. Firstly, let me explain how the data was collected. → 3. That decision was based on both practical constraints and performance needs. → 4. From my findings, this algorithm performs better on sparse datasets. → 5. Furthermore, this method allows for easier real-time implementation. → 6. To conclude, the selected model improves efficiency by 20%. → 7. I’d be happy to elaborate on that if needed.",
      "1. To conclude, the selected model improves efficiency by 20%. → 2. Firstly, let me explain how the data was collected. → 3. From my findings, this algorithm performs better on sparse datasets. → 4. Let me begin by stating the problem this study addresses. → 5. Furthermore, this method allows for easier real-time implementation. → 6. That decision was based on both practical constraints and performance needs. → 7. I’d be happy to elaborate on that if needed.",
      "1. Firstly, let me explain how the data was collected. → 2. Let me begin by stating the problem this study addresses. → 3. From my findings, this algorithm performs better on sparse datasets. → 4. That decision was based on both practical constraints and performance needs. → 5. Furthermore, this method allows for easier real-time implementation. → 6. To conclude, the selected model improves efficiency by 20%. → 7. I’d be happy to elaborate on that if needed.",
    ],
    correctOptionIndex: 0,
    isTextAnswer: false,
  ),
  ],


  practiceActivityDescription2: """
Form a 20-second answer for the question, “What technical issues do/did you face when you try/tried to design a website?” (You can talk about your experiences or imagine you have had the experience)
Include:	Technical issues 
What you did/ can do to minimize the issues
Why it matters
Record your answer through this  and share the audio link here!
""",

  practiceActivityLink2:"https://record.reverb.chat/",

  practiceUploadLink2:"https://example.com/upload-practice-activity",

  instructionsText: """
Watch the video lesson carefully to understand what a viva voce is and how it differs from everyday question-and-answer sessions. The video will explain the structure, tone, and types of questions typically asked in an oral exam, especially in computing-related disciplines. You’ll see how students explain their decisions, clarify misunderstandings, and handle unexpected questions.
Feel free to take notes—especially when you hear helpful phrases, sentence starters, or expressions that sound natural and professional. These can become powerful tools in your own responses during future vivas. Pay attention to both what is said and how it’s said—tone, body language, and pacing are just as important as the content!
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you’ve taken your first real steps toward mastering oral exams and viva voce presentations. We explored how to deliver clear, confident, and well-structured responses—even when you're under pressure. You practiced reordering academic responses, creating technical pitches, selecting strong academic phrases, and matching emotions to coping strategies. With these tools, you’re more than ready to handle those tough questions with poise and professionalism. Whether you’re explaining a technical decision or clarifying a misunderstood point, remember: structure, clarity, and confidence are your best friends!

Keep practicing, stay calm, and trust in what you know. You’ve got this!
""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to bring your viva skills to life in the classroom. When we meet in person, we’ll build on what you’ve learned through fun, practical activities designed to boost your confidence and help you speak more clearly and professionally. This is your chance to ask questions, try out academic phrases, and practice responding to typical viva-style prompts in a supportive environment.
If there’s anything from the lesson that felt unclear or tricky, don’t worry—just bring your questions with you. Your lecturer will be more than happy to explain, guide, and help you polish your responses. Remember, the classroom is a safe space to learn and grow. Let’s work together to turn hesitation into fluency and strengthen your speaking skills, step by step. 
""",

  quizQuestions: [
    QuizQuestion(
      question: "1. What’s the main purpose of a viva voce?",
      options: [
        "a) To confuse students",
        "b) To test how well you party",
        "c) To assess your understanding and reasoning",
        "d) To give feedback on grammar",
      ],
      correctOptionIndex: 2,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "2. Which is the BEST way to begin explaining a technical decision?",
      options: [
        "a) Let me explain the logic behind my choice",
        "b) I read it somewhere",
        "c) It was a guess",
        "d) No reason, just felt right",
      ],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "3. Which of these phrases shows polite disagreement?",
      options: [
        "a) You’re wrong.",
        "b) That’s ridiculous.",
        "c) Not really.",
        "d) I see your point, but I’d suggest another approach.",
      ],
      correctOptionIndex: 3,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "4. Fill in the blank: “_______, the algorithm offers higher accuracy on real-time data.”",
      options: [
        "a) Anyway",
        "b) Actually",
        "c) Furthermore",
        "d) Whatever",
      ],
      correctOptionIndex: 2,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "5. In a viva, if you don’t understand the question, you should say:",
      options: [
        "a) Can you please rephrase the question?",
        "b) Speak properly, please!",
        "c) Say it again loudly!",
        "d) Never mind.",
      ],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "6. One good way to stay calm before a viva is:",
      options: [
        "a) Ignore it till the last minute",
        "b) Practice common questions aloud",
        "c) Drink 4 cups of coffee",
        "d) Memorize every word of your report",
      ],
      correctOptionIndex: 1,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "7. Complete this academic phrase: “________, I would like to clarify my earlier point.”",
      options: [
        "a) If you don't get it",
        "b) As mentioned before",
        "c) In other words",
        "d) Wait a sec",
      ],
      correctOptionIndex: 2,
      isTextAnswer: false,
    ),
  ],
);
