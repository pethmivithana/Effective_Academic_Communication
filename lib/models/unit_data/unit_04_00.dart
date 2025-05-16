import '../unit_model.dart';
//look again about pre class activity
final UnitModel unit4_0 = UnitModel(
  unitIndex: 16,
  unitName: "Essential Study Skills",
  introductionText: """
Hello everyone! Today marks the beginning of our fourth unit, "Essential Study Skills." As you have already started your undergraduate journey, this will be immensely helpful to you in your academic path. You may have done your schooling in Sinhala or Tamil, but now, you've reached a point where your university education must be conducted in English. You will attend lectures in English for 2–4 hours, where you need to grasp the main ideas and take all assessments in English. We understand that this transition from Sinhala/Tamil to English might cause communication challenges for some students. Therefore, this lesson is specifically designed to address these issues by offering strategies and techniques that you can incorporate into your studies. I hope this provides you with a brief yet clear understanding of the purpose of Unit 4. Now, let's look at the lesson objectives for this unit.
By the end of this lesson, students will be able to:
1. Reflect on their existing strategies for understanding academic lectures.
2. Identify common challenges faced when listening to lectures in English.
3. Evaluate their approach to reviewing and organizing notes after a lecture.
4. Identify areas where they need improvement in vocabulary acquisition.
""",

  preClassActivityDescription: """
Fill out the short survey below. Be honest in your responses—there are no right or wrong answers!
""",

  preClassSurvey: [
    SurveyQuestion(
      questionText: "How do you usually prepare for an academic lecture?",
      options: [
        "I read about the topic in advance.",
        "I don’t prepare beforehand.",
        "I skim through any available lecture slides or notes.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: false,
    ),
    SurveyQuestion(
      questionText: "While listening to a lecture, how do you identify key points?",
      options: [
        "I focus on the lecturer’s repetition and emphasis.",
        "I listen for transition words (e.g., 'first,' 'next,' 'in conclusion').",
        "I write down everything I hear.",
        "I rely on the PowerPoint slides.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: true,
    ),
    SurveyQuestion(
      questionText: "What challenges do you face when listening to lectures in English? (Select all that apply)",
      options: [
        "Understanding fast speech.",
        "Recognizing key ideas versus extra information.",
        "Getting distracted easily.",
        "Writing notes while listening.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: true,
    ),
    SurveyQuestion(
      questionText: "How do you currently take notes during a lecture?",
      options: [
        "I use bullet points.",
        "I write in full sentences.",
        "I create diagrams or mind maps.",
        "I don’t take notes during lectures.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: false,
    ),
    SurveyQuestion(
      questionText: "Do you review your notes after a lecture?",
      options: [
        "Yes, I organize and rewrite them.",
        "Sometimes, only before an exam.",
        "No, I rarely review my notes.",
      ],
      allowsMultipleAnswers: false,
    ),
    SurveyQuestion(
      questionText: "How do you learn new academic vocabulary?",
      options: [
        "I use flashcards.",
        "I write down definitions.",
        "I try to use new words in speaking and writing.",
        "I don’t have a specific strategy.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: true,
    ),
    SurveyQuestion(
      questionText: "What is the biggest challenge you face when learning new vocabulary?",
      options: [
        "Remembering meanings.",
        "Using words correctly in a sentence.",
        "Pronouncing words correctly.",
        "Other (please specify): ___________",
      ],
      allowsMultipleAnswers: false,
    ),
  ],

  practiceActivityDescription1: """
After watching the video, write 6 skills that you need to develop.
""",

  practiceActivityVideo: "https://www.youtube.com/watch?v=CPxSzxylRCI",
  practiceUploadLink:"https://example.com/upload-practice-activity",

  practiceActivityDescription2: """
Now, you're going to talk about what you will have done if you were the President of Sri Lanka. Think of this as a time-travel log where you're reporting what you've already finished by a specific point in the future.

Step 1: Visit this voice recording tool

Step 2: Click the red “Record” button and speak five Future Perfect sentences of what you will have done if you were the President of Sri Lanka.

Step 3: After recording, click “Save & Share” and copy the audio link and submit it.
""",

  practiceActivityLink2: "https://vocaroo.com",
  practiceUploadLink2: "https://example.com/upload-practice-activity",

  instructionsText: """
After completing the pre-class activity, you are here for the lecture. Please note that Unit 4’s introduction will only give you a brief overview of what we will discuss in the upcoming lessons. We hope you’ll watch it and enjoy!
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, we discussed the essential study skills needed for academic success in an English-medium instructions. We reflected on strategies for listening to lectures, identified common challenges, and evaluated current note-taking and vocabulary learning methods. Through these activities, we aim to equip you with tools to overcome challenges and improve your academic performance in English.""",

  inClassActivity: """
We will engage in some interactive activities in class to help reinforce the skills you have learned today. These activities will allow you to practice identifying key points during a lecture and improve your note-taking and vocabulary acquisition strategies.
""",

  quizQuestions: [
    QuizQuestion(
      question: "Choose the sentence that uses the Future Perfect Tense correctly:",
      options: [
        "a) I have finished the task by Friday.",
        "b) I will be finishing the task by Friday.",
        "c) I will have finished the task by Friday.",
        "d) I finish the task by Friday.",
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "What is the correct structure of the Future Perfect Tense?",
      options: [
        "a) will + be + verb-ing",
        "b) will + have + past participle",
        "c) have + been + verb-ing",
        "d) had + verb",
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Which of these sentences describes an action that will be complete before another future moment?",
      options: [
        "a) I am writing the code.",
        "b) I will write the code.",
        "c) I wrote the code.",
        "d) I will have written the code.",
      ],
      correctOptionIndex: 3,
    ),
    QuizQuestion(
      question: "Rewrite the following sentence using Future Perfect Tense:\nShe submits the final assignment before midnight.",
      correctTextAnswer: "She will have submitted the final assignment before midnight",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Explain one use of the Future Perfect Tense in a real-life computing scenario. Give an example.",
      correctTextAnswer: "The Future Perfect Tense can be used to describe an action that will be completed before a future deadline. For example: 'By the time the system goes live, the QA team will have tested all major features.'",
      isTextAnswer: true,
    ),
  ],
);
