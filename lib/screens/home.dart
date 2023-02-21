// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:basic3/screens/items/data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 List display=[];
 TextEditingController name = TextEditingController();

  void searchItems(String text){
    setState(() {
      display=[];
    });
    for(int x=0; x<data.length; x++){
      if(data[x].toString().toLowerCase().contains(text.toLowerCase())){
        setState(() {
          display.add(data[x]);
        });
      }else{
        continue;
      }
    }
  }
  @override

  void initState(){
    super.initState();
    searchItems(name.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: TextFormField(
            onChanged: (value){
              searchItems(value);
            },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 20,
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  hintText: ("Search ..."),
                  suffixIcon: Icon(Icons.search, color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)))),
        ),
        body: display.isNotEmpty ? ListView.builder(
            itemCount: display.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.shopping_basket),
                    backgroundColor: Colors.orange,
                  ),
                  title: Text(
                    display[index],
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text("miriam",
                      style: TextStyle(fontSize: 12, color: Colors.black38)),
                  trailing: Icon(Icons.more));
            }): Center(
              child: Text("OOps! No Results Found!"),
            ),
            );
  }
}
