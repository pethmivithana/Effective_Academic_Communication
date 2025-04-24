import 'package:flutter/material.dart';
import 'package:eng_app_2/models/unit_model.dart';
import 'package:eng_app_2/homescreen.dart';
import 'package:get_storage/get_storage.dart';

class InClassActivityScreen extends StatefulWidget {
  final int unitIndex;
  final int subunitIndex;
  final String subunitTitle;
  final UnitModel? unitData;

  const InClassActivityScreen({
    Key? key,
    required this.unitIndex,
    required this.subunitIndex,
    required this.subunitTitle,
    this.unitData,
  }) : super(key: key);

  @override
  _InClassActivityScreenState createState() => _InClassActivityScreenState();
}

class _InClassActivityScreenState extends State<InClassActivityScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final unit = widget.unitData;
    final username = box.read('username') ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subunitTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF010066),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: unit == null || unit.inClassActivity.isEmpty
          ? const Center(
        child: Text(
          "No in-class activity available.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Section Title
            Row(
              children: const [
                Icon(Icons.school, color: Color(0xFF010066), size: 30),
                SizedBox(width: 8),
                Text(
                  "In-Class Activity",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF010066),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Activity Content Box (Styled like PracticeActivityScreen2)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.menu_book_outlined,
                            color: Colors.deepPurple),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            unit.inClassActivity,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Finish Button with Confirmation
            ElevatedButton.icon(
              onPressed: () async {
                bool confirm = await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Confirm Finish"),
                    content: const Text("Are you sure you want to finish this activity?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("Yes, Finish"),
                      ),
                    ],
                  ),
                );

                if (confirm) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(username: username),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.check_circle_outline),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6100),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              label: const Text(
                "Finish Activity",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}