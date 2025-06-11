import '../unit_model.dart';

final UnitModel unit4_1 = UnitModel(
  unitIndex: 17,
  unitName: "Listening to Lectures and Taking Notes",
  introductionText: """
Hi everyone!
Today, we’re going to a particularly important topic: Listening to Lectures and Taking Notes. As discussed in our previous lesson, listening to long academic lectures in English can be quite challenging. This session will help you enhance your listening comprehension by using effective strategies you may not have tried before.
Lesson Objectives
By the end of this lesson, you will be able to:
1.	Understand the importance of active listening in academic settings and how it improves comprehension and retention.
2.	Identify key strategies for effective listening, including focusing on main ideas, key details, and transitional cues used by lecturers.
3.	Use various note-taking techniques—such as the Cornell Method and mind mapping—to organize and summarize lecture content effectively.
4.	Apply active listening techniques to capture essential information without transcribing everything word-for-word.""",

  preClassActivityDescription: """
Step 1: Watch the first 5 minutes of the following video. Try to identify the main idea and take notes accordingly (you don’t need to watch the entire video).

Step 2: Reflect on your experience:
•	Was it difficult to follow the lecture?
•	What challenges did you face while taking notes?

Share your thoughts in a short-written paragraph.""",
  preClassActivityVideo:"https://www.youtube.com/watch?v=O5nskjZ_GoI",
  preClassActivityUploadLink: "https://courseweb.sliit.lk/mod/forum/view.php?id=375185",

  practiceActivityDescription1: """
Watch this video on note-taking methods.""",

  practiceActivityVideo:"https://www.youtube.com/watch?v=X8Wgu6-d2Pc",

  practiceActivityDescription2: """
Now, apply one of the note-taking methods you just learned. Watch the following lecture on Artificial Intelligence and take notes using your chosen method. 

You can take down the note on a piece of paper while watching the video, and after you complete the note please take a photo of your note and upload it in the given submission portal.""",

  practiceVideoUrl:"https://www.youtube.com/watch?v=mJeNghZXtMo",
  practiceUploadLink2: "https://courseweb.sliit.lk/mod/assign/view.php?id=375186",

  instructionsText: """
Once you’ve completed the pre-class activity, please watch the recorded mini lesson provided. It will introduce note-taking techniques and strategies to use in real academic lectures.""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=V3RyOFl4ZkVpdl82NzY4Ng==",

  summary: """
In this lesson, we explored how to become a more effective listener during academic lectures. You learned the value of active listening, discovered several note-taking methods, and practiced applying them using real-world content. The goal is not just to take notes—but to take useful notes that help you retain and understand the content.""",

  inClassActivity: """
We will conduct interactive sessions in class to help you practice what you’ve learned in an engaging and collaborative way.""",

  quizQuestions: [
    QuizQuestion(
      question: "What is the main purpose of active listening during a lecture?",
      options: [
        "To write everything the lecturer says word for word",
        "To focus on important ideas and understand the content better",
        "To memorize the lecture without writing anything",
        "To daydream while pretending to listen"
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Which of the following is a commonly used note-taking method?",
      options: [
        "Skimming and scanning",
        "Word-for-word transcription",
        "The Cornell Method",
        "Freewriting"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "What should you do if the lecturer speaks too fast?",
      options: [
        "Ask the lecturer to stop",
        "Ignore what’s being said",
        "Focus on keywords and main ideas",
        "Try to write every single word"
      ],
      correctOptionIndex: 2,
    ),
  ],
);
