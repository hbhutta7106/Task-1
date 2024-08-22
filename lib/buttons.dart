import 'package:flutter/material.dart';

enum Status {
  age,
  approved,
  rejected,
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  Status selectedValue = Status.approved;
  TextEditingController textEditingControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // here, Scaffold.of(context) returns null
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  maxLength: 50, // Set the maximum number of characters
                  buildCounter: (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) {
                    return Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$currentLength/${maxLength ?? 0} characters',
                        style: TextStyle(
                          color: isFocused ? Colors.blue : Colors.grey,
                        ),
                      ),
                    );
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
