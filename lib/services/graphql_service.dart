import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLService {
  static final HttpLink httpLink = HttpLink(
    uri: "https://countries.trevorblades.com/"
    // uri: "https://examplegraphql.herokuapp.com/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(
        dataIdFromObject: typenameDataIdFromObject,
      ),
    ),
  );
}
