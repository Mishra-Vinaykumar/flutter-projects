import 'dart:io';
import 'dart:ui';

void main() {
  print('Welcome to dart!');

  // stdout.write('Enter Your Name: ');
  // var name = stdin.readLineSync();
  // print("Welcome , $name");

  var akash = new Human();

  // akash.myFun();
  akash.printName();

  // Declartion of Variable
  int? a;
  print(a);

  //var vs dynamic
  String n = "Raman";

  //var
  // var section;   //yeabhi use kar sakte hai
  dynamic section; //yeabhi use kar sakte hai
  section = "D";
  section = 3;
  section = false;
}

class Human {
  late int name;
  late int number;
  late int age;

// Functions
  void myFun(String name) {
    stdout.write('Enter Name : ');
    var name = stdin.readLineSync();
    print("my name is $name");
  }

  void printName() {
    print('name ');
  }

  Human();
}
