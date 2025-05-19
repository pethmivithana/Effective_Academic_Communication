import '../unit_model.dart';

final UnitModel unit7_4 = UnitModel(
  unitIndex: 32,
  unitName: "Replacing common words with academic equivalents",
  introductionText: """
Welcome to Lesson 7.4!
In academic and professional communication, word choice matters. While everyday English may be fine for casual conversations, academic and technical writing requires more precise, formal, and objective vocabulary. Replacing common, casual, or vague words with academic equivalents not only improves your credibility but also helps you express ideas more accurately and professionally. For example, instead of saying “a lot of data,” we might say “a significant amount of data”; instead of “fix,” we use “resolve.”
This skill is especially important for students in computing, where you regularly write reports, proposals, and project documentation. Being able to use academic vocabulary appropriately shows your understanding of the topic and prepares you for communication in both academia and industry. In this unit, you'll learn how to recognize informal words and replace them with more suitable alternatives.
By the end of this lesson, you will be able to:
•	Identify common informal words in technical and academic writing
•	Replace these with appropriate academic equivalents
•	Apply formal vocabulary in written and spoken computing contexts
•	Improve clarity, formality, and professionalism in your communication
""",

  preClassActivityDescription: """
Let’s reflect on commonly used informal words in computing and explore more academic alternatives before the lesson begins. Follow the instructions given. 

Open the Padlet link provided 

Follow the instructions given there. 

This is an individual task, so do not edit others’ posts. But feel free to scroll through the wall and see how your peers are thinking, you might discover a few new words!
""",
  preClassActivityLink:"https://padlet.com/nilakmaw/Vocabulary_Swap_Challenge",

  practiceActivityDescription1: """ 
Read each sentence and examine the word or phrase that should be replaced. Then write the best academic replacement in the space provided.
""",
  practiceActivityQuestions1:[
    PracticeQuestion1(
      questionText: 'We had to ………… (deal with) a lot of bugs during testing.',
      correctAnswer: 'deal with',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'The tool can ………… (get) info from the server.',
      correctAnswer: 'get',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'They wanted to ………… (make sure) the results were accurate.',
      correctAnswer: 'make sure',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'The app had ………… (a lot of) problems at launch.',
      correctAnswer: 'a lot of',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'We need to ………… (fix) the database issue.',
      correctAnswer: 'fix',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'We’re going to ………… (look into) the issue tomorrow.',
      correctAnswer: 'look into',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'The team ………… (put together) a basic prototype last week.',
      correctAnswer: 'put together',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'They had to ………… (come up with) a new plan for the database.',
      correctAnswer: 'come up with',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'He ………… (talked about) the system\'s performance during the meeting.',
      correctAnswer: 'talked about',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'The new version is ………… (way better) than the last one.',
      correctAnswer: 'way better',
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription2: """
Below, you will find a sample technical discussion with informal phrases often used in technical or computing-related discussions.

Your task is to prepare a short-spoken response using academic equivalents instead.

You CANNOT use the sample given; you need to make your own discussion. 

Use a voice recorder to record your response and paste the record link here.

In each response, try to:
Begin with a short sentence explaining a computing process or scenario.
Use the academic version of the informal word or phrase in context.
Speak clearly and naturally.

Sample Informal Discussion

Student A: Hey, we need to fix that login bug before the next update. It’s been messing things up for some users.

Student B: Yeah, I noticed it too. I think we can get the error logs from the server and check what’s going on.

Student A: Good idea. After that, let’s put together a quick report so we can show the team tomorrow.

Student B: Sure. Also, I was thinking we should come up with a better way to handle login attempts—maybe add some sort of lockout feature?

Student A: Definitely. There are a lot of failed login attempts in the logs, so it makes sense to do that.
""",
  practiceActivityLink2:"https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2:"https://example.com/upload-practice-activity",

  instructionsText: """
Now, let’s watch the video lesson below. You’ll explore the differences between informal and academic language, and why it’s important to use academic vocabulary in computing-related writing. The video will show you how to spot casual phrases and suggest more formal, professional alternatives. Pay attention to the structure of example sentences in technical documentation and reports. You’ll also learn tips for recognizing tone and register, so you know when to adjust your word choice depending on the context.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you learned how to replace everyday informal words with academic equivalents to make your writing and speaking more professional. You explored the difference between casual and formal tone, particularly in computing-related communication. By practicing with both written and spoken exercises, you gained confidence in selecting more suitable vocabulary for technical contexts. Academic word choices like obtain instead of get or resolve instead of fix enhance the clarity, precision, and formality of your message. These skills are essential for writing reports, delivering presentations, and collaborating in academic and workplace environments. You are now better prepared to express your ideas with authority and academic style.""",

  inClassActivity: """
In our upcoming classroom session, we’ll play a game called “Upgrade That Sentence!” where each student will receive a casual computing-related sentence. Your task is to rewrite it using more academic vocabulary. We’ll then review answers together and vote on the most improved version. You’ll also work individually with real excerpts from student reports or sample documentation and highlight informal terms that need upgrading. Bring your voice too—we’ll do a lightning round where students read both versions aloud and reflect on how the tone changes. Let’s sharpen your academic voice together!
""",

  quizQuestions: [
    QuizQuestion(
      question: 'Which of the following is the best academic replacement for “get”?',
      options: ['obtain', 'grab', 'take', 'have'],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: 'What is a better academic word for “make sure”?',
      options: ['fix', 'create', 'ensure', 'guarantee'],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Which word is more formal: “a lot of” or “significant”?',
      correctTextAnswer: 'significant',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Rewrite this sentence using academic vocabulary:\nWe had to fix a lot of bugs to make sure the app worked well.',
      correctTextAnswer: 'We had to resolve numerous bugs to ensure the application functioned effectively.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'What is an academic alternative to “deal with”?',
      options: ['run away', 'handle', 'ignore', 'get rid of'],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Choose the best revision:\nThe students got good results after the test.',
      options: [
        'The students got nice results.',
        'The students obtained excellent results.',
        'The students did good in the test.',
        'The students were happy with the results.',
      ],
      correctOptionIndex: 1,
    ),
  ],
);
