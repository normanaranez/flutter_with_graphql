class PersonQueryMutation {
  String query = r"""
                  query Persons {
                    persons {
                      id
                      name
                      lastName
                      age
                    }
                  }
                """;
}
