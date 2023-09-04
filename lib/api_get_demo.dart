import 'package:api_calling/comment.model.dart';
import 'package:api_calling/network_api.dart';
import 'package:flutter/material.dart';

class GetApiDemo extends StatefulWidget {
  const GetApiDemo({super.key});

  @override
  State<GetApiDemo> createState() => _GetApiDemoState();
}

class _GetApiDemoState extends State<GetApiDemo> {
  late Future<List<Vanila>> futureCommentData;
  @override
  void initState() {
    futureCommentData = NetworkApi.fetchCommentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[335],
      body: FutureBuilder(
        future: futureCommentData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Text(snapshot.data![index].postId.toString()),
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].body),
                  trailing: Text(snapshot.data![index].email),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
