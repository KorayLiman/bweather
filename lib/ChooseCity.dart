import 'package:flutter/material.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({Key? key}) : super(key: key);

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                    labelText: "City",
                    hintText: "Choose City",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context, textEditingController.text);
              },
              icon: Icon(Icons.search))
        ],
      )),
    );
  }
}
