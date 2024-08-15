import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/integration_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntegrationListView extends StatelessWidget {
  const IntegrationListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<Map<String, dynamic>> integrationData = [
      {
        'image': 'assets/images/drive_google_google drive_icons.png',
        'name': 'Drive',
        'details':
            'Store, share, and collaborate on documents and files securely',
        'isToggled': false,
      },
      {
        'image': 'assets/images/onedrive.png',
        'name': 'OneDrive',
        'details':
            'Access, sync, and manage your files seamlessly across devices',
        'isToggled': true,
      },
      {
        'image': 'assets/images/trello.png',
        'name': 'Trello',
        'details':
            'Organize your projects, track tasks, and collaborate in a visual way',
        'isToggled': false,
      },
      {
        'image': 'assets/images/dropbox.png',
        'name': 'Dropbox',
        'details':
            'Securely store, sync, and share all your files and documents',
        'isToggled': true,
      },
      {
        'image': 'assets/images/atlassian.png',
        'name': 'Atlassian',
        'details':
            'Streamline project planning and manage workflows effectively',
        'isToggled': false,
      },
      {
        'image': 'assets/images/jira.png',
        'name': 'Jira',
        'details':
            'Track tasks, manage projects, and streamline team collaboration',
        'isToggled': true,
      },
      {
        'image': 'assets/images/notion.png',
        'name': 'Notion',
        'details':
            'Create documents, collaborate on projects, and manage flexible workflows',
        'isToggled': false,
      },
      {
        'image': 'assets/images/microsoft_office_office 365_teams.png',
        'name': 'Microsoft Teams',
        'details':
            'Enhance team communication, and project management with Microsoft Teams',
        'isToggled': true,
      },
      {
        'image': 'assets/images/chat_slack.png',
        'name': 'Slack',
        'details':
            'Transform team communication, enhance collaboration, and streamline workflow efficiency',
        'isToggled': false,
      },
      // Add more items as needed
    ];

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: integrationData.length,
      itemBuilder: (context, index) {
        final item = integrationData[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: IntegrationContainer(
            isToggled: item['isToggled'],
            image: item['image'],
            nameText: item['name'],
            detailText: item['details'],
            onChanged: (bool value) {
              // Handle toggle switch change
              // print('${item['nameText']} is now ${value ? 'enabled' : 'disabled'}');
            },
          ),
        );
      },
    );
  }
}
