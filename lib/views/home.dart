import 'dart:convert';
import 'package:employees_details/models/employee.dart';
import 'package:employees_details/services/employee_service.dart';
import 'package:employees_details/views/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool loading = true;
 
  getEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    String? empString = prefs.getString("empData");
    if (empString == null) {
      EmployeeService service = EmployeeService();
      employees = await service.getEmployees();
      prefs.setString("empData", await service.getEmployeesString());
    }
    else {
      var empJson = jsonDecode(empString);
      employees = empJson.map((obj) => Employee.fromJson(obj)).toList();
    }
    loading = false;
    setState(() {     
    });
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: loading ? 
          CircularProgressIndicator() :
          ListView.builder(
            itemCount: employees.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EmpDetails(empData: employees[index]))
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Column(
                    children: [
                      Text("Name : ${employees[index].employeeName}"),
                      Text("Salary : ${employees[index].employeeSalary}")
                    ],
                  ),
                ),
              );
            }
          )
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          loading = true;
          setState(() {     
          });
          await getEmployees();
        }, 
        icon: Icon(Icons.download)
      ),
    );
  }
}
