import 'package:flutter/material.dart';
import 'package:json/controllers/company_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final companyController = CompanyController();

  @override
  void initState() {
    companyController.getCompanyinfo();
    super.initState();
  }

  void _addEmployee() {
    setState(() {
      companyController.addEmployee('New Employee');
    });
  }

  Future<void> _editEmployee(int index) async {
    String? newEmployeeName = await _showEditDialog(
      context,
      companyController.employees[index],
    );
    if (newEmployeeName != null && newEmployeeName.isNotEmpty) {
      setState(() {
        companyController.editEmployee(index, newEmployeeName);
      });
    }
  }

  void _deleteEmployee(int index) {
    setState(() {
      companyController.deleteEmployee(index);
    });
  }

  void _addProduct() {
    setState(() {
      companyController.addProduct('New Product');
    });
  }

  Future<void> _editProduct(int index) async {
    String? newProductName = await _showEditDialog(
      context,
      companyController.products[index],
    );
    if (newProductName != null && newProductName.isNotEmpty) {
      setState(() {
        companyController.editProduct(index, newProductName);
      });
    }
  }

  void _deleteProduct(int index) {
    setState(() {
      companyController.deleteProduct(index);
    });
  }

  Future<String?> _showEditDialog(
      BuildContext context, String currentName) async {
    TextEditingController _controller =
        TextEditingController(text: currentName);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'New Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 214, 214),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 118, 118, 118),
        title: const Text(
          'Company Management',
          style:
              TextStyle(fontSize: 15, color: Color.fromARGB(255, 10, 10, 10)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          const Text('Employees', style: TextStyle(fontSize: 17)),
          ElevatedButton(
            onPressed: _addEmployee,
            child: const Text(
              'Add Employee',
              style: TextStyle(color: Color.fromARGB(255, 2, 48, 199)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: companyController.employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(companyController.employees[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 2, 48, 199),
                        ),
                        onPressed: () => _editEmployee(index),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 177, 18, 6),
                        ),
                        onPressed: () => _deleteEmployee(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Text('Products', style: TextStyle(fontSize: 17)),
          ElevatedButton(
            onPressed: _addProduct,
            child: const Text(
              'Add Product',
              style: TextStyle(color: Color.fromARGB(255, 2, 48, 199)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: companyController.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(companyController.products[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 2, 48, 199),
                        ),
                        onPressed: () => _editProduct(index),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 177, 18, 6),
                        ),
                        onPressed: () => _deleteProduct(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
