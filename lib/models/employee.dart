import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;
    String contactNumber;

    Employee({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
        required this.contactNumber,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["firstName"],
        employeeSalary: json["salary"],
        employeeAge: json["age"],
        contactNumber: json["contactNumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": employeeName,
        "salary": employeeSalary,
        "age": employeeAge,
        "contactNumber": contactNumber,
    };
}