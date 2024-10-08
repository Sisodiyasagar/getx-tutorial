import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_controller_crud.dart'; // Import your controller

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final controllerCrud = Get.put(ControllerCrud());
  int? selectedIndex; // For tracking selected item for editing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () {
          _openFormDialog(context);
        },
      ),
      appBar: AppBar(
        title: Text("CRUD Operations"),
        backgroundColor: Colors.redAccent,
      ),
      body: Obx(() {
        return controllerCrud.list.isEmpty
            ? Center(child: Text("No data available"))
            : ListView.builder(
          itemCount: controllerCrud.list.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: ListTile(
                title: Text(controllerCrud.list[index]["name"]),
                subtitle: Text(controllerCrud.list[index]["city"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        nameController.text = controllerCrud.list[index]["name"];
                        cityController.text = controllerCrud.list[index]["city"];
                        selectedIndex = index;
                        _openFormDialog(context, isEdit: true);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        controllerCrud.delete(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _openFormDialog(BuildContext context, {bool isEdit = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(isEdit ? "Update Details" : "Add Details"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(labelText: "City"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (isEdit && selectedIndex != null) {
                    controllerCrud.updateList({
                      "name": nameController.text,
                      "city": cityController.text,
                    }, selectedIndex!);
                  } else {
                    controllerCrud.addToList({
                      "name": nameController.text,
                      "city": cityController.text,
                    });
                  }
                  nameController.clear();
                  cityController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text(isEdit ? "Update" : "Add"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                nameController.clear();
                cityController.clear();
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
