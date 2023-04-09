// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension SpacexAPI {
  class RocketNamesAndDescriptionsQuery: GraphQLQuery {
    public static let operationName: String = "RocketNamesAndDescriptions"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query RocketNamesAndDescriptions {
          rockets {
            __typename
            id
            name
            description
          }
        }
        """#
      ))

    public init() {}

    public struct Data: SpacexAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("rockets", [Rocket?]?.self),
      ] }

      public var rockets: [Rocket?]? { __data["rockets"] }

      /// Rocket
      ///
      /// Parent Type: `Rocket`
      public struct Rocket: SpacexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Rocket }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", SpacexAPI.ID?.self),
          .field("name", String?.self),
          .field("description", String?.self),
        ] }

        public var id: SpacexAPI.ID? { __data["id"] }
        public var name: String? { __data["name"] }
        public var description: String? { __data["description"] }
      }
    }
  }

}