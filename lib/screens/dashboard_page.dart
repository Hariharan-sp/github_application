import 'package:flutter/material.dart';
import 'package:github_application/provider/common_provider.dart';
import 'package:github_application/screens/profie_page.dart';
import 'package:github_application/screens/repo_page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, data, _) {
      return data.inProgress
          ? const CircularProgressIndicator()
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'Profile'),
                      Tab(text: 'Repositories'),
                    ],
                  ),

                ),
                body: TabBarView(
                  children: [
                    ProfilePage(
                      username: data.userDataResponseModel!.login.toString(),
                      imageUrl:
                          data.userDataResponseModel!.avatarUrl.toString(),
                      company: data.userDataResponseModel!.company.toString(),
                      location: data.userDataResponseModel!.location.toString(),
                    ),
                    RepositoryPage(
                      repositoryCount: data.userDataResponseModel!.publicRepos,
                    ),
                  ],
                ),
              ),
            );
    });
  }
}

