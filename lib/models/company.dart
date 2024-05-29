import 'package:json/models/employee.dart';
import 'package:json/models/product.dart';

class Company {
  final String company;
  final String location;
  List<Employee> employees;
  List<Product> products;

  Company({
    required this.company,
    required this.location,
    required this.employees,
    required this.products,
  });
}
