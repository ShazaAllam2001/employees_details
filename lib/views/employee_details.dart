import 'package:employees_details/models/employee.dart';
import 'package:flutter/material.dart';

class EmpDetails extends StatefulWidget {
  const EmpDetails({super.key, required this.empData});

  final Employee empData;

  @override
  State<EmpDetails> createState() => _EmpDetailsState();
}

class _EmpDetailsState extends State<EmpDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back)
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.empData.employeeName),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Employee ID ${widget.empData.id}"),
            Text("Employee Name ${widget.empData.employeeName}"),
            Text("Employee Age ${widget.empData.employeeAge}"),
            Text("Employee Salary ${widget.empData.employeeSalary}"),
            Text("Employee Contact Number ${widget.empData.contactNumber}"),
          ],
        )
      ),
    );
  }
}