import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/firebase_service.dart';

class AddNamePage extends StatefulWidget{
  const AddNamePage ({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage>{

  TextEditingController nameControler = TextEditingController(text: "");
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Agregar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameControler,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo nombre',
              ),
            ),
            ElevatedButton(onPressed: () async {
              await addPeople(nameControler.text).then((_) {
                Navigator.pop(context);
              });
              
            }, 
            child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }

}