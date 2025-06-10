import '../unit_model.dart';

final UnitModel unit10_2 = UnitModel(
  unitIndex: 43,
  unitName: "Practicing and Refining Delivery (Online & In-Person)",
  introductionText: """
Hello everyone!
Welcome to our final lesson under Unit 10: Enhancing Coherence and Logical Flow. Today, we focus on a vital skill for confident presenting: practicing and refining your delivery, both online and in-person.
Whether you're addressing a live audience or presenting virtually, adjusting your tone, pace, and body language can make a significant difference in how effectively your message is received.
Lesson Objectives
By the end of this lesson, you will be able to:
1.	Identify key differences between online and in-person presentation styles.
2.	Use voice modulation, gestures, and eye contact to enhance delivery.
3.	Recognize common delivery mistakes and learn how to correct them.
4.	Record and evaluate your own presentation for further improvement.
""",

  preClassActivityDescription: """
Watch this short video on the key differences between online and in-person presentation delivery:
 
After watching, answer the following quiz:
""",
  preClassActivityVideo:"https://www.youtube.com/watch?v=asHncB7zDDA",

  preClassQuestions:[
    PreClassQuestion(
      questionText: 'What is a key challenge of online communication?',
      options: [
        'a) Difficulty maintaining eye contact with the audience',
        'b) Too much audience interaction',
        'c) Limited time to prepare',
        'd) Less need for clarity in speech',
      ],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: 'How is audience engagement different in an in-person setting?',
      options: [
        'a) The audience can respond in real time with facial expressions and body language',
        'b) The speaker can ignore the audience’s reactions',
        'c) Audience members rely only on chat boxes to respond',
        'd) Speakers should avoid making eye contact',
      ],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: 'In an online presentation, what should a speaker do to maintain engagement?',
      options: [
        'a) Use a monotone voice to sound professional',
        'b) Look at the screen instead of the camera',
        'c) Speak clearly, use facial expressions, and encourage interaction',
        'd) Read directly from a script without pauses',
      ],
      correctOptionIndex: 2,
    ),
  ],

  practiceActivityDescription1: """ 
Step 1: Prepare a 1-minute PowerPoint presentation on: "The Role of Technology in Education". You have to use 2-3 slides for this.   

Step 2: Use Microsoft PowerPoint Coach to rehearse and get feedback.
Focus on:
•	Pace
•	Clarity
•	Engagement
•	Tone

Step 3: Reflect on your performance using these questions:
•	Was I speaking at the right pace?
•	Did I vary my tone to maintain interest?
•	How can I improve my body language or online presence?

Step 4: Upload your final recorded presentation to the app for lecturer feedback. If the file size is too large, you can upload the video to the drive and share the link. 
""",

  practiceUploadLink:"https://courseweb.sliit.lk/mod/assign/view.php?id=375237",


  practiceActivityDescription2: """
As the practice activity 2, we need you to watch this Tedx video on what makes a powerful presentation. This will help you to be better at your presentation skills.""",

  practiceVideoUrl:"https://www.youtube.com/watch?v=yoD8RMq2OkU",

  instructionsText: """
Watch the recorded lecture provided. It outlines practical techniques for maintaining rapport throughout your presentation and will support you in completing the activities.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=c0hkdzFJb1BUMV82NzcyNQ==",

  summary: """
In this lesson, you learned how to refine your delivery for both online and in-person presentations. We explored how to adjust your tone, pace, and use of body language to create an impactful and engaging presentation. You also practiced using Microsoft PowerPoint Coach for feedback and reflection.""",

  inClassActivity: """
I’m looking forward to seeing you in class where we’ll practice delivering presentations together. Let’s engage in interactive activities and supportive peer feedback to polish your delivery even more!
""",

  quizQuestions: [
    QuizQuestion(
      question: 'Tone and Pace\nHow did you find your pacing?',
      options: [
        'a) I spoke too quickly.',
        'b) My pace was just right.',
        'c) I spoke too slowly.',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Use of Filler Words',
      options: [
        'a) I used many filler words.',
        'b) I used a few.',
        'c) I hardly used any.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Clarity and Pronunciation',
      options: [
        'a) My speech was unclear.',
        'b) Some words were unclear.',
        'c) I spoke clearly.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Engagement and Eye Contact',
      options: [
        'a) I didn’t engage well.',
        'b) I tried to engage.',
        'c) I was fully engaged.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Feedback from PowerPoint Coach',
      options: [
        'a) I found it hard to apply all tips.',
        'b) I tried most suggestions.',
        'c) I followed the feedback and improved.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Confidence in Delivery',
      options: [
        'a) I still felt unsure.',
        'b) I felt somewhat confident.',
        'c) I felt confident and ready.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Final Self-Assessment',
      options: [
        'a) I need more practice.',
        'b) I did okay.',
        'c) I’m happy with my performance.',
      ],
      correctOptionIndex: 2,
    ),
  ],
);
