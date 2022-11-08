import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Person {
  final String? gender;
  final String email;
  final String? nat;
  final String? title;
  final String? first;
  final String? last;

  const Person({
    required this.gender,
    required this.email,
    required this.nat,
    required this.title,
    required this.first,
    required this.last,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      gender: json['results'][0]['gender'],
      email: json['results'][0]['email'],
      nat: json['results'][0]['nat'],
      title: json['results'][0]['name']['title'],
      first: json['results'][0]['name']['first'],
      last: json['results'][0]['name']['last'],
    );
  }
}

class RandomPerson extends StatefulWidget {
  const RandomPerson({super.key});

  @override
  State<RandomPerson> createState() => _RandomPersonState();
}

Future<Person> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://randomuser.me/api/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Person.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _RandomPersonState extends State<RandomPerson> {
  late Future<Person> futurePerson;

  @override
  void initState() {
    super.initState();
    futurePerson = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch random user example',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Person>(
            future: futurePerson,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Email: ${snapshot.data!.email}\nGender: ${snapshot.data!.gender}\nNat: ${snapshot.data!.nat}');
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
