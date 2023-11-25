import 'package:cyber_vault/models/personal_info.dart';
import 'package:cyber_vault/pages/edit_personal_info_page.dart';
import 'package:cyber_vault/services/personal_info_service.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  late Future<List<PersonalInfo>> personalInfos;

  @override
  void initState() {
    super.initState();
    personalInfos = getPersonalInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
        ),
        body: FutureBuilder<List<PersonalInfo>>(
          future: personalInfos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No accounts found"),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  PersonalInfo info = snapshot.data![index];
                  return Card(
                      child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditPersonalInfoPage(personalInfo: info),
                        ),
                      );
                    },
                    leading: const Icon(Icons.info_outline_rounded),
                    title: Text(info.recordTitle),
                    // subtitle: Text(account.email),
                    trailing: const Icon(Icons.chevron_right),
                    isThreeLine: false,
                  ));
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_personalInfo');
          },
          child: const Icon(Icons.add),
        ));
  }
}
