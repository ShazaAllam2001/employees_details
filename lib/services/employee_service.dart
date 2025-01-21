import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:employees_details/models/employee.dart';

class EmployeeService {
  final String endpoint = "https://hub.dummyapis.com/employee/";

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    try {
      final response = await Dio().get(endpoint);
      final data = response.data;
      data.forEach((obj) => 
        employees.add(Employee.fromJson(obj))
      );
    }
    catch(e) {
      debugPrint(e.toString());
    }
    return employees;
  }

  Future<String> getEmployeesString() async {
    String employeesData = "";
    try {
      final response = await Dio().get(endpoint);
      employeesData = response.data;
    }
    catch(e) {
      debugPrint(e.toString());
    }
    return employeesData;
  }
}