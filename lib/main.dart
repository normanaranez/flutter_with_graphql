import 'package:flutter/material.dart';
import 'package:flutter_with_graphql/graphql/contenent_query_mutation.dart';
import 'package:flutter_with_graphql/graphql/person_query_mutation.dart';
import 'package:flutter_with_graphql/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MaterialApp(title: "GQL App", home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GraphQLService graphQLService = GraphQLService();

    return GraphQLProvider(
      child: HomePage(),
      client: graphQLService.client,
    );
  }
}

class HomePage extends StatelessWidget {

  final ContenentQueryMutation contenentQueryMutation = ContenentQueryMutation();
  final PersonQueryMutation personQueryMutation = PersonQueryMutation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter with GraphQL"),
      ),
      body: Query(
        options: QueryOptions(
            documentNode: gql(contenentQueryMutation.query),
            // documentNode: gql(personQueryMutation.query),
            // pollInterval: 1,
            variables: <String, dynamic>{"code": "SA"},
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (result.data == null) {
            return Text("No Data Found !");
          }
          // print(result.data['persons'][2]['lastName']);
          // return ListView.builder(
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title:
          //           Text(result.data['persons'][index]['lastName']),
          //     );
          //   },
          //   itemCount: result.data['persons'].length,
          // );
         
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title:
                    Text(result.data['continent']['countries'][index]['name']),
              );
            },
            itemCount: result.data['continent']['countries'].length,
          );
        },
      ),
    );
  }
}
