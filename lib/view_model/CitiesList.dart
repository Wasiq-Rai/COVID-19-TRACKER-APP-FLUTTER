import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class CityList extends StatefulWidget {
  static String city='Lahore';
   CityList({Key? key}) : super(key: key);

  @override
  State<CityList> createState() => CityListState();
}

class CityListState extends State<CityList> {
  List<String> cities = [];
  var _dropdownValue = 'Lahore';
  bool loaded=false;



  Future getCities() async {
    debugPrint('HEre is the line');

    final String response = await rootBundle.loadString('assets/cities.json');
    // final response = await http.get(Uri.parse('https://programming-quotes-api.herokuapp.com/Quotes'));
    var data = jsonDecode(response.toString());
    return data;


  }
  

  @override
  void initState() {
    super.initState();
    cities.clear();
    debugPrint("Started");

    getCities().then((data) {

      for (int i = 0; i < 439; i++) {
        cities.add(data['cities'][i]['name']);
      }

    });

  }



  @override
  Widget build(BuildContext context) {
  Future.delayed(Duration(seconds: 3,),(){
    debugPrint('Cities Updated!');
  });
  return FutureBuilder(
    future: getCities(),
    builder: (context,snapshot ){
      if(cities.isEmpty){
        return  Padding(
          padding: const EdgeInsets.all(15.0),
          child: DropdownButtonFormField(

            decoration: InputDecoration(


                helperText: 'Updating Cities!!!',
                label: Text('Wait!!!')),
            focusColor: Colors.green,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: cities.map((String items) {

              return DropdownMenuItem(
                value: items.length > 0 ? items : '',
                child: Text(items.length > 0 ? items : ''),
              );
            }).toList()
            ,

            onChanged: (String? value) {
              setState(() {
                CityList.city = value!;

              });
            },
            value: CityList.city,
          ),
        );
      }
      else{
        return  Padding(
          padding: const EdgeInsets.all(15.0),
          child: DropdownButtonFormField(

            decoration: InputDecoration(


                helperText: 'Choose city you want to study in',
                label: Text('City')),
            focusColor: Colors.green,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: cities.map((String items) {

              return DropdownMenuItem(
                value: items.length > 0 ? items : '',
                child: Text(items.length > 0 ? items : ''),
              );
            }).toList()
            ,

            onChanged: (String? value) {
              setState(() {
               this._dropdownValue = value!;
                CityList.city=this._dropdownValue;

              });
            },
            value: _dropdownValue,
          ),
        );
      }

    },

  );




  }




  // StreamBuilder(
  //     stream:  databaseRef.onValue,
  //     builder: (context,AsyncSnapshot<DatabaseEvent> snapshot ){
  //       if(!snapshot.hasData){
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //       else{
  //         List<dynamic> map = snapshot.data!.snapshot.value as dynamic;
  //       var list = [];
  //       list.clear();
  //       list= map.toList();
  //       Text(list[1]['name'].toString());
  //       return ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //           itemCount: snapshot.data!.snapshot.children.length,
  //           itemBuilder: (context,index){
  //             return ListTile(
  //               title: Text(list[index]['name']),
  //             );
  //           });
  //       }
  //     });
}

// List _cities = [];
// final databaseRef = FirebaseDatabase.instance.ref('citiesData');
// Future<void> getCities() async {

//   final String response = await rootBundle.loadString('assets/cities.json');
//   final data = await json.decode(response);
//   setState(() {
//     _cities = data["cities"];
//   });
// }
//
//
// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//       future: getCities(),
//       builder: (_, __)  {
//         if(_cities.isNotEmpty){
//           for(int index =0;index<_cities.length;index++) {
//             databaseRef.child(index.toString()).set({
//           'name': _cities[index]['name']});
//
//   }
//
//         }
//         return Text(_cities.length.toString());
//
//       }
//   );
//}
//}
