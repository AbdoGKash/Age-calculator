// ignore_for_file: camel_case_types


import 'package:first_compleate_app/age_model.dart';

class age_claculater {
    
Age a = Age();
  Age claculateage(DateTime brithday, DateTime futureday) {
    DateTime now = futureday;
    Duration age = now.difference(brithday);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);

    a.years = years;
    a.months =months;
    a.day=days;

      return a;
  }

  


}

 // operator overloading
// class arithmeticOperator { 
        
//       double a = 0; 
        
//       void input() { 
//         print('Enter number\n'); 
//         a = double.parse(stdin.readLineSync()!); 
//       } 
    
//       void display() { 
//         print('$a\n'); 
//       } 
    
//       arithmeticOperator operator + (arithmeticOperator b) { 
//         /* with operator function of classarith return type we can use 
//         '+' operaator to add two variables of data type arith */
//         arithmeticOperator c = new arithmeticOperator(); 
//         c.a = b.a + a; 
//         return c;          
//       } 
// }


  

