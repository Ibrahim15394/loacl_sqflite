import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  ViewScreen({Key? key}) : super(key: key);

  final TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Sqflite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
             controller: userController,
              decoration:  InputDecoration(
                suffix: TextButton(
                    onPressed: (){},
                    child: const Text('Add',style: TextStyle(color: Colors.black),)) ,
                border: const OutlineInputBorder(),
                labelText: 'userName',
                suffixStyle: const TextStyle(color: Colors.black),



              ),
            ),
            const SizedBox(height: 20.0,),
            Expanded(
              child: RefreshIndicator(
                onRefresh: ()async{},
                child: ListView.separated(
                   itemBuilder: (context, index) =>  Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     child: Row(
                       children: const [
                         CircleAvatar(
                           backgroundColor: Colors.teal,
                           radius: 30.0,
                           child: Text('A',style: TextStyle(
                             color: Colors.white,
                             fontSize: 30.0,
                           ),),
                         ),
                         SizedBox(width: 10.0,),
                         Expanded(
                           child: Text('User 1',
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 25.0,
                               fontWeight: FontWeight.w500,
                             ),),
                         ),
                       ],
                     ),
                   ),
                   separatorBuilder: (context, index) =>const Divider(),
                   itemCount: 4,
           ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
