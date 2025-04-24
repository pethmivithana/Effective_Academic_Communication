import '../unit_model.dart';

final UnitModel unit2_0 = UnitModel(
  unitIndex: 2,
    unitName: "Basic Grammar Skills",
    introductionText: """
Hello everyone, Welcome to Unit 02 
This lesson introduces basic grammar in spoken English. Before we move on to more advanced topics such as word order and types of sentences, it is important to first understand the fundamental role of grammar in communication. Take a moment to reflect on how you currently structure sentences and recognize areas where you might need improvement.
This lesson will focus on building both accuracy and confidence in forming grammatically correct sentences. We will explore how grammar structures impact meaning and help create clear and effective communication—a key skill for expressing your ideas in English. To start, let’s take a moment to clarify our objectives. Knowing what we aim to accomplish will help you stay focused and motivated throughout the lesson. With that in mind, let’s go over the lesson goals.
By the end of this lesson, you will be able to:
-	Understand the importance of grammar in spoken English.
-	Recognize and use basic sentence structures (Subject-Verb-Object).
-	Identify and correct common grammatical mistakes in speech.
    """,
    preClassActivityDescription: """
Watch a short video clip where common grammar mistakes are made in spoken English.
 """,
  preClassQuestions: [
    PreClassQuestion(
      questionText: "Write down at least three grammar errors you notice and explain why you think they are wrong.",
      correctAnswer: "1. 'He go to school everyday.' → should be 'goes' (subject-verb agreement)\n"
          "2. 'She don’t like apples.' → should be 'doesn’t' (incorrect auxiliary verb)\n"
          "3. 'I am agree with you.' → 'agree' is a verb, so 'I agree with you' is correct (no 'am')",
    ),
  ],

  preClassActivityVideo:"https://www.youtube.com/watch?v=ePVZvMjSMvE ",

    practiceActivityDescription1: """
    We hope that you now have a clear understanding of the basic grammar skills needed for Spoken English. Let’s test what you have learnt so far! Follow the instructions accordingly. 

Step 01: Click on the given link and you will be directed to a website with a quiz.

Step 02: Enter your name and click on “start game”. Select the correct answer for all the questions.

Step 03: After finishing the quiz, click on “Skip to summary” and take a screenshot of the ‘Performance Stats’.

Step 04: Upload the screenshot to the submission portal. 
   """,

    practiceActivityLink: "https://quizizz.com/join?gc=28179076" ,
    practiceUploadLink: "https://example.com/upload-practice-activity",
    practiceActivityDescription2: """
Let’s practice more! Follow the instructions.
    
Step 01: Visit the given website 

Step 02: Read aloud 5 sentences about your daily routine, focusing on correct grammar and pronunciation.

Step 03: Review the speech-to-text result and identify any mistakes. If there are errors, record the sentence again until you say it correctly.

Step 04: Record your final attempt and submit your best recording here!
    """,

    practiceActivityLink2:"https://www.speakpipe.com/voice-recorder ",
    practiceUploadLink2: "https://example.com/upload-practice-activity",
    instructionsText: """
Please click on the given link. 
You will now watch a video lesson explaining the basic grammar skills you need to know when practicing spoken English. Listen very carefully and you may take down notes whenever necessary. Enjoy!
""",
    instructionVideoId: "8laYlyAFd0o",
    summary: """
    Now, we have come to the end of Unit 2. In this lesson, we explored the fundamental role of grammar in spoken English, focusing on building accuracy and confidence in forming correct sentences. We discussed the importance of sentence structure, particularly the Subject-Verb-Object (SVO) pattern, and how proper grammar usage enhances clarity in communication. Common grammatical mistakes were also highlighted, reinforcing the need for accuracy in both speech and writing. Applying these grammar rules correctly will help you express your thoughts more effectively, whether in casual conversations or professional settings. 
    """,

    inClassActivity: """
    Join us in the classroom as we put our basic grammar skills into practice! This is your chance to refine your understanding of sentence structure, avoid common mistakes, and build confidence in forming clear, grammatically correct sentences. Have any questions? Your lecturer will be there to guide you.
  Keep practicing and see you in the next lesson!
""",
  quizQuestions: [
    QuizQuestion(
      question: "Which of the following sentences is grammatically correct?",
      options: [
        "He go to the store every morning.",
        "He goes to the store every morning.",
        "He going to the store every morning.",
        "He gone to the store every morning."
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Identify the correct sentence structure:",
      options: [
        "Eats she lunch at noon.",
        "She eats lunch at noon.",
        "At noon she lunch eats.",
        "Lunch eats she at noon."
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Choose the sentence written in the simple past tense:",
      options: [
        "She is going to the market.",
        "She went to the market.",
        "She goes to the market.",
        "She will go to the market."
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "What is the correct way to form a question in English?",
      options: [
        "You can tell me where is the bank?",
        "Where the bank is you can tell?",
        "Can you tell me where the bank is?",
        "Tell you me where the bank is can?"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Rewrite this sentence in the simple past tense: \nShe writes an email to her professor every day.",
      correctTextAnswer: "She wrote an email to her professor every day.",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Identify the grammatical error in this sentence and correct it: \nThey doesn’t like spicy food.",
      correctTextAnswer: "They don't like spicy food.",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Create a grammatically correct sentence using the Subject-Verb-Object (SVO) structure.",
      correctTextAnswer: "The dog chased the ball.", // You can choose any valid example
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Explain why grammar is important in spoken English. Provide one example of how incorrect grammar can lead to misunderstandings.",
      correctTextAnswer: "Grammar helps convey clear meaning. For example, 'Let's eat, Grandma!' vs 'Let's eat Grandma!' shows how punctuation and grammar change meaning.",
      isTextAnswer: true,
    ),
  ],

);


