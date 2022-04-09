import 'package:flutter/material.dart';
import 'package:flutter_tech_exam/common/route_names.dart';
import 'package:flutter_tech_exam/core/services/navigation_service.dart';
import 'package:flutter_tech_exam/core/view_models/user_list_view_model.dart';
import 'package:flutter_tech_exam/core/views/base/view.dart';
import 'package:flutter_tech_exam/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Widget)
@Named(RouteNames.userList)
class UserListView extends StatelessWidget with ViewMixin<UserListViewModel> {
  UserListView() : super(key: const Key(RouteNames.userList));

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Rebuild only this part of the UI when `counter` changes
            ValueListenableBuilder<List<UserEntity>>(
              valueListenable: viewModel.users,
              builder: (context, users, child) {
                if (users.isEmpty) {
                  return const Center(child: Text('No users'));
                } else {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 100),
                          Text('There are ${users.length} users'),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.separated(
                              itemCount: users.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 20),
                              itemBuilder: (_, i) {
                                return Material(
                                  borderRadius: BorderRadius.circular(8),
                                  elevation: 1,
                                  child: InkWell(
                                    onTap: () => viewModel.onNavigateToUserDetails(users[i]),
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: Text(users[i].name),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
