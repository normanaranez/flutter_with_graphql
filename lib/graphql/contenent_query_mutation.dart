class ContenentQueryMutation {
  String query = r"""
                  query GetContinent($code : String!){
                    continent(code:$code){
                      name
                      countries{
                        name
                      }
                    }
                  }
                """;
}
