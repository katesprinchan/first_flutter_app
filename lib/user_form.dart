import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text(
            'Форма',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GoblinOne',
            ),
          ),
        ),
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            const Spacer(), // Используем Spacer для заполнения доступного пространства
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Привет, ${firstNameController.text} ${lastNameController.text}!',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Say Hi!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
