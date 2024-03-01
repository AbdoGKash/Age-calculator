// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

///import 'Age_Calculator.dart';

void main() {
  runApp(App());
  
}

class App extends StatelessWidget {
  const App({super.key});  // https://stackoverflow.com/questions/67615843/flutter-new-project-error-const-myappkey-key-superkey-key
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blueAccent,
            primarySwatch: Colors.blue
            // appBarTheme:const AppBarTheme(color: Colors.amber)
            ),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Age Calculator"),
            ),
            body: HomeScreen()),
      ),
    );
  }
}











  // age_claculater age = age_claculater();
  // var a = age.claculateage(DateTime(1998,6,11), DateTime(2023,11,23));
  // print(a)












// import 'package:flutter/material.dart'; 
// import 'package:flutter/services.dart'; 

// void main() { 
// runApp(const MyApp()); 
// } 

// class MyApp extends StatelessWidget { 
// const MyApp({Key? key}); 

// @override 
// Widget build(BuildContext context) { 
// 	return MaterialApp( 
// 	debugShowCheckedModeBanner: false, 
// 	title: 'Age Calculator', 
// 	theme: ThemeData(primarySwatch: Colors.deepOrange), 
// 	home: const HomeScreen(), 
// 	); 
// } 
// } 

// class HomeScreen extends StatefulWidget { 
// const HomeScreen({Key? key}); 

// @override 
// State<HomeScreen> createState() => _HomeScreenState(); 
// } 

// class _HomeScreenState extends State<HomeScreen> { 
// String myAge = ''; 

// @override 
// Widget build(BuildContext context) { 
// 	return Scaffold( 
// 	appBar: AppBar( 
// 		title: const Text("Age Calculator"), 
// 		centerTitle: true, 
// 		systemOverlayStyle: SystemUiOverlayStyle( 
// 			statusBarColor: Theme.of(context).primaryColor), 
// 	), 
// 	body: Center( 
// 		child: Column( 
// 		mainAxisAlignment: MainAxisAlignment.center, 
// 		children: [ 
// 			const Text( 
// 			'Your age is', 
// 			// style: Theme.of(context).textTheme.displayLarge, 
// 			style: TextStyle(fontSize: 40), 
// 			), 
// 			const SizedBox( 
// 			height: 10, 
// 			), 
// 			Text(myAge), 
// 			const SizedBox( 
// 			height: 30, 
// 			), 
// 			ElevatedButton( 
// 			onPressed: () => pickDob(context), 
// 			child: const Text('Pick Your Date of Birth'), 
// 			) 
// 		], 
// 		), 
// 	), 
// 	); 
// } 

// pickDob(BuildContext context) { 
// 	showDatePicker( 
// 	context: context, 
// 	initialDate: DateTime.now(), 
// 	firstDate: DateTime(1900), 
// 	lastDate: DateTime.now(), 
// 	).then((pickedDate) { 
// 	if (pickedDate != null) { 
// 		//calculateAge(pickedDate); 
// 	} 
// 	}); 
// } 

// // calculateAge(DateTime birth) { 
// // 	DateTime now = DateTime.now(); 
// // 	Duration age = now.difference(birth); 
// // 	int years = age.inDays ~/ 365; 
// // 	int months = (age.inDays % 365) ~/ 30; 
// // 	int days = ((age.inDays % 365) % 30); 
// // 	setState(() { 
// // 	myAge = '$years years, $months months, and $days days'; 
// // 	}); 
// // } 
// } 










































 




  





