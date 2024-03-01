class Age {
  int years = 0, months = 0, day = 0;

  // solve error Instance of 'Age'

  //https://stackoverflow.com/questions/64836203/what-does-override-tostring-method-do-in-a-flutter-dart-class
  @override
  String toString() {
    return "Age : ${years}:yeaes - ${months}:months - ${day}:days";
  }
}
