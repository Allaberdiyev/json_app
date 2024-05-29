import 'dart:collection';

class CompanyController {
  final List<String> _employees = [];
  final List<String> _products = [];

  UnmodifiableListView<String> get employees =>
      UnmodifiableListView(_employees);
  UnmodifiableListView<String> get products => UnmodifiableListView(_products);

  void getCompanyinfo() {}

  void addEmployee(String employee) {
    _employees.add(employee);
  }

  void editEmployee(int index, String newEmployee) {
    if (index >= 0 && index < _employees.length) {
      _employees[index] = newEmployee;
    }
  }

  void deleteEmployee(int index) {
    if (index >= 0 && index < _employees.length) {
      _employees.removeAt(index);
    }
  }

  void addProduct(String product) {
    _products.add(product);
  }

  void editProduct(int index, String newProduct) {
    if (index >= 0 && index < _products.length) {
      _products[index] = newProduct;
    }
  }

  void deleteProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
    }
  }
}
