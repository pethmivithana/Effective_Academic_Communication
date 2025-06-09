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
  practiceUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375182",

  practiceActivityDescription2: """
Since this lesson is a brief introduction to essential study skills, as the Practice Activity 2, you're suppose to watch the given Youtube video and write 3 things that you would like to develop within yourself. 
""",

  practiceVideoUrl: "https://www.youtube.com/watch?v=jMhhaAQK1NQ",
  practiceUploadLink2: "https://courseweb.sliit.lk/mod/forum/view.php?id=375184",

  instructionsText: """
After completing the pre-class activity, you are here for the lecture. Please note that Unit 4’s introduction will only give you a brief overview of what we will discuss in the upcoming lessons. We hope you’ll watch it and enjoy!
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=d09zTVBKWnk4cV82NzY4NQ==",

  summary: """
In this lesson, we discussed the essential study skills needed for academic success in an English-medium instructions. We reflected on strategies for listening to lectures, identified common challenges, and evaluated current note-taking and vocabulary learning methods. Through these activities, we aim to equip you with tools to overcome challenges and improve your academic performance in English.""",

  inClassActivity: """
We will engage in some interactive activities in class to help reinforce the skills you have learned today. These activities will allow you to practice identifying key points during a lecture and improve your note-taking and vocabulary acquisition strategies.
""",

  quizQuestions: [
    QuizQuestion(
      question: 'Which of the following is a recommended way to identify key points in a lecture?',
      options: [
        'Writing everything the lecturer says',
        'Focusing only on the PowerPoint slides',
        'Listening for repetition and transition words',
        'Ignoring examples and focusing only on definitions',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'What is one common challenge students face when listening to lectures in English?',
      options: [
        'Taking notes in their first language',
        'Finding the lecture room',
        'Understanding fast speech and identifying key ideas',
        'Having too many books',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Which of these is a good vocabulary learning strategy?',
      options: [
        'Ignoring unfamiliar words',
        'Using flashcards and writing definitions',
        'Only reading vocabulary lists before exams',
        'Memorizing without using the words',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'After taking notes in a lecture, what is the best follow-up action to improve learning?',
      options: [
        'Throw away your notes',
        'Leave them untouched until the exam',
        'Organize and rewrite your notes for better understanding',
        'Ask a friend to do it for you',
      ],
      correctOptionIndex: 2,
    ),
  ],
);
