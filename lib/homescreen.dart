// ignore_for_file: file_names, avoid_print, non_constant_identifier_names, unused_element, no_leading_underscores_for_local_identifiers, unused_local_variable, must_be_immutable

import 'package:first_compleate_app/age_model.dart';
import 'package:flutter/material.dart';
//import 'package:gap/gap.dart';
import 'duration_model.dart';
import 'Age_Calculator.dart';
// import 'package:intl/date_symbol_data_local.dart';


//  String  datebrith_format = '';
// String datefuture_format = '';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Age _userAge = Age();

  final Duration _nextBirthDay = Duration();
  
 final TextEditingController _dateOfBirthController =   // String  date_format = ''; عشان دي
     TextEditingController(text: "01-01-2020" );

  final TextEditingController _todayDateController =
       TextEditingController(text: "01-01-2000");

  late DateTime future_date;

  late DateTime brith_date;

  @override
  Widget build(BuildContext context) {
    Widget _dateOfBirthHeading = _buildHeading("Date of Birth");
    Widget _birthDateTextField = _buildBirthDateTextField(context);
    Widget _todayDateHeading = _buildHeading("Today Date");
    Widget _todayDateTextField = _buildTodayDateTextField(context);
    Widget _clearCalculateButtonsRow = _buildClearCalcButtonsRow();
    Widget _ageOutputHeading = _buildHeading("Age is");
    Widget _ageOutputRow = _buildAgeOutputRow(context);
    Widget _nextBirthDayHeading = _buildHeading("Next Birth Day in");
    Widget _nextBirthOutputRow = _buildNextBirthDayOutputRow(context);
    Widget _emptyBox = const SizedBox(height: 20);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _dateOfBirthHeading,
            _birthDateTextField,
            _emptyBox,
            _todayDateHeading,
            _todayDateTextField,
            _emptyBox,
            _clearCalculateButtonsRow,
            _emptyBox,
            _ageOutputHeading,
            _ageOutputRow,
            _emptyBox,
            _nextBirthDayHeading,
            _nextBirthOutputRow,
          ],
        ),
      ),
    );
  }

  Widget _buildHeading(String headingTitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        headingTitle,
        style: const TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }

  Widget _buildBirthDateTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime(2100),)
                .then((date) {
              brith_date = date!;
              setState(() {
           String  datebrith_format = "${brith_date.year.toString()}-${brith_date.month.toString().padLeft(2,'0')}-${brith_date.day.toString().padLeft(2,'0')}";
             _dateOfBirthController.text = datebrith_format;
               });
              
            });
          },
          controller: _dateOfBirthController,                   // or TextEditingController(text: datebrith_format) ,                   //_dateOfBirthController
          decoration: _getTextFieldWithCalendarIconDecoration(context),
        )
      ],
    );
  }

  InputDecoration _getTextFieldWithCalendarIconDecoration(
      BuildContext context) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      suffixIcon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
      hintText: '2017-04-10',
    );
  }

  Widget _buildTodayDateTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1940),
                    lastDate: DateTime.now())
                .then((date) {
              future_date = date!;
              setState(() {
                // or https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart/16126580#16126580
               String datefuture_format = "${future_date.year.toString()}-${future_date.month.toString().padLeft(2,'0')}-${future_date.day.toString().padLeft(2,'0')}";
                 _todayDateController.text= datefuture_format;
              });
              print(date.toString());
            });
          },
          controller:   _todayDateController,                 //TextEditingController(text: datefuture_format),                               ///_todayDateController,
          decoration: _getTextFieldWithCalendarIconDecoration(context),
        )
      ],
    );
  }

  Widget _buildClearButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
      setState(() {
           _dateOfBirthController.text = '2017-04-10';
          _todayDateController.text = '2017-04-10';
          _userAge.years=0;
          _userAge.months=0;
          _userAge.day=0;

      });
        },
        child: const Text('CLEAR',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
             _userAge = age_claculater().claculateage(
                brith_date , future_date); // _userAge المتغير اللي هغيره
          });
        },
        child: const Text('CALCULATE',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  Widget _buildClearCalcButtonsRow() {
    Widget _clearOrangeButton = _buildClearButton();
    Widget _calcOrangeButton = _buildCalculateButton();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _clearOrangeButton,
        _calcOrangeButton,
      ],
    );
  }

  Widget _buildOutputField(
      String outputTitle, String outputData, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            outputTitle,
            style:const TextStyle(color: Colors.white),
          )),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor)),
          width: 115,
          height: 30,
          child: Center(
              child: Text(
            outputData,
            style:const TextStyle(color: Colors.grey),
          )),
        )
      ],
    );
  }

  Widget _buildAgeOutputRow(BuildContext context) {
    Widget _ageYearsOutputField = _buildOutputField(
        "Years",
        _userAge.years.toString(),
        context); //  _userAge.years.toString()   الجزء اللي محتاج يتغير
    Widget _ageMonthsOutputField =
        _buildOutputField("Months", _userAge.months.toString(), context);
    Widget _ageDaysOutputField =
        _buildOutputField("Days", _userAge.day.toString(), context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ageYearsOutputField,
        _ageMonthsOutputField,
        _ageDaysOutputField,
      ],
    );
  }

  Widget _buildNextBirthDayOutputRow(BuildContext context) {
    Widget _nextBirthYearsOutputField =
        _buildOutputField("Years", "-", context);
    Widget _nextBirthMonthsOutputField =
        _buildOutputField("Months", _nextBirthDay.months.toString(), context);
    Widget _nextBirthDaysOutputField =
        _buildOutputField("Days", _nextBirthDay.days.toString(), context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _nextBirthYearsOutputField,
        _nextBirthMonthsOutputField,
        _nextBirthDaysOutputField,
      ],
    );
  }
}
