import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eng_app_2/models/all_units.dart' as unit_data;
import 'package:eng_app_2/models/unit_model.dart';
import 'introduction_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();

  final List<Map<String, dynamic>> units = [
    {
      'title': 'Introduction to the program and getting to know each other',
      'icon': Icons.school,
      'subunits': [
        {
          'name': 'Introduction to the program and getting to know each other',
          'unitIndex': 1
        },
      ]
    },
    {
      'title': 'Basic grammar skills',
      'icon': Icons.book,
      'subunits': [
        {'name': 'Basic grammar skills', 'unitIndex': 2},
        {'name': 'Word order in English', 'unitIndex': 3},
        {'name': 'Types of sentences in English', 'unitIndex': 4},
      ]
    },
    {
      'title': 'Tenses',
      'icon': Icons.history_edu,
      'subunits': [
        {'name': 'Tenses', 'unitIndex': 5},
        {'name': 'Simple present', 'unitIndex': 6},
        {'name': 'Present continuous', 'unitIndex': 7},
        {'name': 'Present perfect', 'unitIndex': 8},
        {'name': 'Present perfect continuous', 'unitIndex': 9},
        {'name': 'Simple past', 'unitIndex': 10},
        {'name': 'Past continuous', 'unitIndex': 11},
        {'name': 'Past perfect continuous', 'unitIndex': 12},
        {'name': 'Simple future', 'unitIndex': 13},
        {'name': 'Future Continuous', 'unitIndex': 14},
        {'name': 'Future perfect', 'unitIndex': 15},
      ]
    },
    {
      'title': 'Essential study skills',
      'icon': Icons.lightbulb,
      'subunits': [
        {'name': 'Essential study skills', 'unitIndex': 16},
        {'name': 'Listening to lectures and taking notes', 'unitIndex': 17},
        {'name': 'Vocabulary learning strategies', 'unitIndex': 18},
      ]
    },
    {
      'title': 'Academic discussion and viva preparation',
      'icon': Icons.record_voice_over,
      'subunits': [
        {'name': 'Academic discussion and viva preparation', 'unitIndex': 19},
        {'name': 'Introduction to viva voce', 'unitIndex': 20},
        {'name': 'Structuring responses', 'unitIndex': 21},
        {'name': 'Handling examiner questions', 'unitIndex': 22},
      ]
    },
    {
      'title': 'Communication strategies',
      'icon': Icons.forum,
      'subunits': [
        {'name': 'Communication strategies', 'unitIndex': 23},
        {'name': 'Understanding communication strategies', 'unitIndex': 24},
        {'name': 'Types of questions', 'unitIndex': 25},
        {'name': 'Summarizing key points in discussions', 'unitIndex': 26},
        {'name': 'Paraphrasing for Better Understanding', 'unitIndex': 27},
      ]
    },
    {
      'title': 'Context-Based Vocabulary Development',
      'icon': Icons.spellcheck,
      'subunits': [
        {'name': 'Context-Based Vocabulary Development', 'unitIndex': 28},
        {'name': 'Changing word forms', 'unitIndex': 29},
        {
          'name': 'Using context clues to understand unfamiliar words',
          'unitIndex': 30
        },
        {'name': 'Using formal vs. informal expressions', 'unitIndex': 31},
        {
          'name': 'Replacing common words with academic equivalents',
          'unitIndex': 32
        },
      ]
    },
    {
      'title': 'Structuring ideas for academic discussions',
      'icon': Icons.account_tree,
      'subunits': [
        {
          'name': 'Structuring ideas for academic discussions',
          'unitIndex': 33
        },
        {
          'name': 'Organizing thoughts before speaking/writing',
          'unitIndex': 34
        },
        {
          'name': 'The point-evidence-explanation (PEE) method',
          'unitIndex': 35
        },
        {
          'name': 'Using topic sentences and supporting details',
          'unitIndex': 36
        },
      ]
    },
    {
      'title': 'Making academic presentations',
      'icon': Icons.present_to_all,
      'subunits': [
        {'name': 'Making academic presentations', 'unitIndex': 37},
        {'name': 'Introduction to academic presentations', 'unitIndex': 38},
        {'name': 'Tips to overcome presentation anxiety', 'unitIndex': 39},
        {'name': 'Structuring presentations', 'unitIndex': 40},
      ]
    },
    {
      'title': 'Enhancing coherence and logical flow',
      'icon': Icons.timeline,
      'subunits': [
        {'name': 'Enhancing coherence and logical flow', 'unitIndex': 41},
        {
          'name': 'Maintaining the rapport of the presentations',
          'unitIndex': 42
        },
        {
          'name': 'Practicing and refining delivery (online and in-person)',
          'unitIndex': 43
        },
      ]
    },
    {
      'title': 'Mastering Oral Exams & Viva Voce',
      'icon': Icons.mic,
      'subunits': [
        {'name': 'Mastering Oral Exams & Viva Voce', 'unitIndex': 44},
        {'name': 'Speaking with Confidence & Clarity', 'unitIndex': 45},
        {
          'name': 'Handling Challenging & Unexpected Questions',
          'unitIndex': 46
        },
        {'name': 'Responding with Critical Thinking', 'unitIndex': 47},
      ]
    },
    {
      'title': 'Reflection and self-improvement in academic communication',
      'icon': Icons.assessment,
      'subunits': [
        {
          'name': 'Reflection and self-improvement in academic communication',
          'unitIndex': 48
        },
        {'name': 'Self-Assessment & Reflection', 'unitIndex': 49},
        {'name': 'Peer Feedback & Group Discussion', 'unitIndex': 50},
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeProgress();
  }

  void _initializeProgress() {
    // Check if this is the first time user is logging in
    List<dynamic>? completedUnits = box.read('completed_units');
    if (completedUnits == null) {
      // First time user - initialize with empty progress
      box.write('completed_units', <int>[]);
    }
  }

  List<int> _getCompletedUnits() {
    List<dynamic>? completed = box.read('completed_units');
    if (completed == null) return <int>[];
    return completed.cast<int>();
  }

  bool _isUnitUnlocked(int unitIndex) {
    List<int> completedUnits = _getCompletedUnits();

    // First unit (index 0) is always unlocked
    if (unitIndex == 0) return true;

    // For other units, check if the previous unit's last subunit is completed
    int previousUnitLastSubunitIndex = _getLastSubunitIndex(unitIndex - 1);
    return completedUnits.contains(previousUnitLastSubunitIndex);
  }

  bool _isSubunitUnlocked(int unitIndex, int subunitIndex) {
    List<int> completedUnits = _getCompletedUnits();

    // First subunit of first unit is always unlocked
    if (unitIndex == 0 && subunitIndex == 0) return true;

    // Check if unit is unlocked first
    if (!_isUnitUnlocked(unitIndex)) return false;

    // First subunit of an unlocked unit is always unlocked
    if (subunitIndex == 0) return true;

    // For other subunits, check if previous subunit is completed
    int previousSubunitUnitIndex = units[unitIndex]['subunits'][subunitIndex - 1]['unitIndex'];
    return completedUnits.contains(previousSubunitUnitIndex);
  }

  int _getLastSubunitIndex(int unitIndex) {
    if (unitIndex < 0 || unitIndex >= units.length) return -1;
    List<dynamic> subunits = units[unitIndex]['subunits'];
    if (subunits.isEmpty) return -1;
    return subunits.last['unitIndex'];
  }

  bool _isSubunitCompleted(int unitIndex) {
    List<int> completedUnits = _getCompletedUnits();
    return completedUnits.contains(unitIndex);
  }

  UnitModel? _getUnitData(int? unitIndex) {
    if (unitIndex == null) return null;
    final unit = unit_data.units.firstWhere(
          (unit) => unit.unitIndex == unitIndex,
      orElse: () => null as UnitModel,
    );
    return unit;
  }

  void _navigateToScreen(int unitIndex, int subunitIndex) {
    if (!_isSubunitUnlocked(unitIndex, subunitIndex)) {
      _showLockedDialog();
      return;
    }

    final subunit = units[unitIndex]['subunits'][subunitIndex];
    final unitData = _getUnitData(subunit['unitIndex'] as int?);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroductionScreen(
          unitIndex: unitIndex,
          subunitIndex: subunitIndex,
          subunitTitle: subunit['name'],
          unitData: unitData,
        ),
      ),
    );
  }

  void _showLockedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.lock, color: Colors.orange),
              SizedBox(width: 8),
              Text("Unit Locked", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Text(
            "Complete the previous unit to unlock this one!",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF010066),
                foregroundColor: Colors.white,
              ),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showSubunitModal(int unitIndex) {
    if (!_isUnitUnlocked(unitIndex)) {
      _showLockedDialog();
      return;
    }

    final subunits = units[unitIndex]['subunits'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select a Lesson',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                ),
                ...subunits.map<Widget>((subunit) {
                  int subIndex = subunits.indexOf(subunit);
                  bool isUnlocked = _isSubunitUnlocked(unitIndex, subIndex);
                  bool isCompleted = _isSubunitCompleted(subunit['unitIndex']);

                  return ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? Colors.green
                                : isUnlocked
                                ? const Color(0xFF010066)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: isCompleted
                                ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '$subIndex',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                                : Text(
                              '$subIndex',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          isCompleted
                              ? Icons.check_circle
                              : isUnlocked
                              ? Icons.play_circle_outline
                              : Icons.lock,
                          color: isCompleted
                              ? Colors.green
                              : isUnlocked
                              ? const Color(0xFF010066)
                              : Colors.grey,
                        ),
                      ],
                    ),
                    title: Text(
                      subunit['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isUnlocked ? Colors.black : Colors.grey,
                      ),
                    ),
                    trailing: isUnlocked
                        ? const Icon(Icons.arrow_forward_ios_rounded, size: 12)
                        : const Icon(Icons.lock, size: 12, color: Colors.grey),
                    onTap: isUnlocked
                        ? () {
                      Navigator.pop(context);
                      _navigateToScreen(unitIndex, subIndex);
                    }
                        : () => _showLockedDialog(),
                  );

                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF010066),
        title: Text(
          'Welcome, ${widget.username} 👋',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF010066),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Learning Journey 📚",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "Complete units in order to unlock new content.🏆📈",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: units.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final unit = units[index];
                  bool isUnlocked = _isUnitUnlocked(index);
                  bool isCompleted = _getLastSubunitIndex(index) != -1 &&
                      _isSubunitCompleted(_getLastSubunitIndex(index));

                  return GestureDetector(
                    onTap: () => _showSubunitModal(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isUnlocked ? Colors.white : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: isUnlocked ? Colors.black12 : Colors.black26,
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: isCompleted
                            ? Border.all(color: Colors.green, width: 2)
                            : null,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: isCompleted
                                    ? Colors.green
                                    : isUnlocked
                                    ? const Color(0xFFFF6100)
                                    : Colors.grey,
                                radius: 35,
                                child: isCompleted
                                    ? const Icon(Icons.check, color: Colors.white, size: 30)
                                    : isUnlocked
                                    ? Icon(unit['icon'], color: Colors.white)
                                    : const Icon(Icons.lock, color: Colors.white),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: isUnlocked
                                      ? const Color(0xFF010066)
                                      : Colors.grey,
                                  radius: 12,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              unit['title'],
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: isUnlocked
                                    ? const Color(0xFF010066)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height:1), // Give a bit more space above the icon
                          Padding(
                            padding: const EdgeInsets.only(top: 1), // Push it down a bit
                            child: Icon(
                              isCompleted
                                  ? Icons.check_circle
                                  : isUnlocked
                                  ? Icons.touch_app_rounded
                                  : Icons.lock,
                              color: isCompleted
                                  ? Colors.green
                                  : isUnlocked
                                  ? Colors.grey
                                  : Colors.grey,
                              size: 18,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}