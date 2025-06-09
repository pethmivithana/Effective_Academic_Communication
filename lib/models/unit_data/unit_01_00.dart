import '../unit_model.dart';

final UnitModel unit1_0= UnitModel(
  unitIndex: 1,
    unitName: "Introduction to the Programme and Getting to Know Each Other",
    introductionText: """
Hello everyone! Welcome to the first session of your English course. This course is designed as a support system to help students improve their English proficiency, a necessary skill for your future academic journey at SLIIT. The course primarily focuses on speaking skills and will provide you with many enjoyable activities to practice English.
You may have completed your school education in Sinhala or Tamil medium, but now you are at a turning point in life—your university education, where your degree is entirely in English. This means that all your assessments will also be in English. Therefore, we believe this course will help you develop your communication skills, which will ultimately lead to better grades.
Now, let’s discuss the structure of the course. We have done our best to make it more learner-centered by including activities that you can complete at your convenience. However, the lessons are structured step by step, so you cannot skip them. Please note that this is done for your own benefit, as we want you to gain the maximum advantage from this course.
Each lesson will begin by outlining the lesson objectives. It is very important for you to read these objectives carefully, as they provide an overall understanding of what we expect from you at the end of each lesson. The second part of every lesson is a pre-class activity. In this section, you will either watch a video or engage in an interactive activity on a separate app to get an initial idea of the lesson topic.
In the third step, you will be introduced to a brief recorded session conducted by a lecturer. This session provides you with guidelines, rules, and essential information before you practice different aspects of language learning. For example, if the lesson is based on presentation skills, the lecturer will provide you with quality input in a 15–20-minute recorded session.
After watching the recorded session, you will be guided through an individual activity that can be completed at home. Please note that we encourage you to complete this activity immediately after watching the recorded session, as this will help you retain the information and complete the task more effectively.
At the end of the lesson, there will be an online quiz to check whether you have achieved the lesson objectives. Completing this quiz is mandatory, as it allows you to assess your own learning progress in the course.
Each lesson concludes with a summary of the lesson and by giving you an idea of what you are expected to do in the classroom. By the time you attend the class, you will have already learned the lesson, and class time will be dedicated to demonstrating your progress. We believe this well-structured course will help you become a better communicator in the future. However, remember that while we can guide you, the learning process must be completed by you.
Now that you are familiar with the course structure, let’s move on to our first lesson: Getting to Know Each Other. First of all, we’ll pay attention to the lesson objectives. These are the aims of the lesson that we want you to achieve at the end of this lesson. 
By the end of this lesson, you will be able to:
1.	Introduce yourself confidently by stating your name, background, and interests.
2.	Use appropriate greetings in formal and informal contexts.
3.	Engage in small talk by asking and responding to basic questions about personal information.
4.	Practice active listening skills to respond appropriately in conversations. """,

    preClassActivityDescription: """
Follow the steps given and complete it. 

Step 1 – Introduce yourself in 3-4 sentences, including your name, academic background, interests, and life goals. Keep it simple!

Step 2 – Use ChatGPT to ask for feedback on your introduction. Then, let the AI tool generate a sample introduction.

Step 3 – Practice your self-introduction again and check for grammar errors and clarity using Grammarly (free version available).

Step 4 – Write your self-introduction in the given space so we can get to know you!

Click the button below to open the discussion forum and submit your answers. You can type your responses directly on the forum, and they’ll be saved automatically.""",

    preClassActivityUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=374526",

    practiceActivityDescription1: """
It’s time to do an individual activity to practice what you learnt. You can simply follow the steps given.

Step 1: Record a 30-second video or audio introducing yourself.

Step 2: Use Speechify or NaturalReader to listen to your introduction and check your pronunciation.

Step 3: Upload your final recording to the given submission link.""",

    practiceUploadLink: "https://courseweb.sliit.lk/mod/assign/view.php?id=374527",

    practiceActivityDescription2: """
Next we’ll watch a YouTube video which is about “self-introductions”. These videos can be a good source of information for you to improve your proficiency.""",

    practiceVideoUrl: "https://www.youtube.com/watch?v=8laYlyAFd0o",

    instructionsText: """
Play the brief recorded session which will give you more information about self-introductions.""",

    instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=VjhLdGIyTENEcF82NzY1Ng==",

    summary: """
We completed our very first lesson today! The main focus of the lesson was to provide you with background information about the program and what we will be doing in the future. We also covered the lesson on “Self-Introductions,” which will be very helpful for getting to know each other at university. Additionally, you can use this knowledge when a lecturer asks you to introduce yourself.

We hope this lesson was interesting and gave you some motivation to improve your English proficiency!""",

    inClassActivity: "Hello students! We believe you have completed the lesson and are ready to attend the physical class. We will have an interactive session with casual conversations and will use different AI tools to make it more engaging. See you soon!",

    quizQuestions: [
      QuizQuestion(
        question: "What is the best way to introduce yourself in a professional setting?",
        options: [
          "Hey, what's up?",
          "Hi, I'm Sahan. I specialize in software engineering.",
          "Yo, call me Sanz!",
          "Guess who I am?"
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        question: "Which greeting is the most formal?",
        options: [
          "Hey there!",
          "Good morning, Ms. Kulasekara.",
          "What's up?",
          "Yo dude!"
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        question: """
Complete the sentence: 
When introducing yourself, you should say your _____ background, and one _____ fact about yourself.""",
        correctTextAnswer: "family, interesting",
        isTextAnswer: true,
      ),
      QuizQuestion(
        question: "If you use ChatGPT to generate an introduction, what should you do before using it?",
        options: [
          "Copy and paste it without reading",
          "Personalize it to match your style and details",
          "Ignore it and write from scratch",
          "Use only the AI-generated version without checking for errors"
        ],
        correctOptionIndex: 1,
      ),
      QuizQuestion(
        question: "Write one professional greeting that you might use in different settings.",
        isTextAnswer: true,
        correctTextAnswer: "Good Morning",
      ),
      QuizQuestion(
        question: "Write one informal greeting that you might use in different settings.",
        isTextAnswer: true,
        correctTextAnswer: "Yo What's up",
      ),
    ]
);


