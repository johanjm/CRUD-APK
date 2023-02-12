import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/firebase_service.dart';

class EditNamePage extends StatefulWidget{
  const EditNamePage ({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage>{

  TextEditingController nameControler = TextEditingController(text: "");
  @override
  Widget build (BuildContext context){

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameControler.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
        title:  const Text('Editar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameControler,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación',
              ),
            ),
            ElevatedButton(onPressed: () async {
              await updatePeople(arguments['uid'], nameControler.text).then((value) {
                Navigator.pop(context);
              });
              
            }, 
            child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }

}