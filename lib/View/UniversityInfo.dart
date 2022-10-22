import 'package:flutter/material.dart';

class UniversityInfo extends StatelessWidget {
  final List list;
  final int index;

  const UniversityInfo({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(
            thickness: 3,
            color: Colors.grey,
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.11),
                child: DataCard(
                    name: list[index]['name'].toString(),
                    adress: list[index]['adress'].toString(),
                    admission: list[index]['admission'].toString(),
                    status: list[index]['status'].toString(),
                    phone: list[index]['phone'].toString(),
                    fax: list[index]['Fax'].toString(),
                    city: list[index]['city'].toString(),
                    url: list[index]['URL'].toString(),
                    email: list[index]['Email'].toString(),
                    fee: list[index]['fee'].toString())),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img.png'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(
            thickness: 3,
            color: Colors.grey,
          ),
        ),
      ],
    ));
  }
}

class DataCard extends StatelessWidget {
  final String name,
      adress,
      admission,
      status,
      phone,
      fax,
      city,
      url,
      email,
      fee;
  const DataCard(
      {Key? key,
      required this.name,
      required this.adress,
      required this.admission,
      required this.status,
      required this.phone,
      required this.fax,
      required this.city,
      required this.url,
      required this.email,
      required this.fee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Colors.white24,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Name: '), Expanded(child: Text(name))]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Adress: '), Expanded(child: Text(adress))]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('City: '), Text(city)]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Phone: '), Text(phone)]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Email: '),
                TextButton(onPressed: () {}, child: Text(email))
              ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Admission: '), Text(admission)]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Status: '), Text(status)]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Fee: '), Text(fee)]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('URL: '),
                TextButton(onPressed: () {}, child: Text(url))
              ]),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Fax: '), Text(fax)]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
