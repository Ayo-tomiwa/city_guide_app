import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to manage attractions page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageAdminDataPage(
                      dataType: 'Attractions',
                    ),
                  ),
                );
              },
              child: Text('Manage Attractions'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to manage reviews page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageAdminDataPage(
                      dataType: 'Reviews',
                    ),
                  ),
                );
              },
              child: Text('Manage Reviews'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to manage notifications page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageAdminDataPage(
                      dataType: 'Notifications',
                    ),
                  ),
                );
              },
              child: Text('Manage Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageAdminDataPage extends StatelessWidget {
  final String dataType;

  const ManageAdminDataPage({Key? key, required this.dataType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage $dataType'),
      ),
      body: Center(
        child: Text('Manage $dataType Page'),
      ),
    );
  }
}
