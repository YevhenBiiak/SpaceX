// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension SpacexAPI {
  class LaunchesQuery: GraphQLQuery {
    public static let operationName: String = "Launches"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Launches {
          launches {
            __typename
            id
            mission_name
            links {
              __typename
              flickr_images
            }
            launch_date_local
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
        .field("launches", [Launch?]?.self),
      ] }

      public var launches: [Launch?]? { __data["launches"] }

      /// Launch
      ///
      /// Parent Type: `Launch`
      public struct Launch: SpacexAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", SpacexAPI.ID?.self),
          .field("mission_name", String?.self),
          .field("links", Links?.self),
          .field("launch_date_local", SpacexAPI.Date?.self),
        ] }

        public var id: SpacexAPI.ID? { __data["id"] }
        public var mission_name: String? { __data["mission_name"] }
        public var links: Links? { __data["links"] }
        public var launch_date_local: SpacexAPI.Date? { __data["launch_date_local"] }

        /// Launch.Links
        ///
        /// Parent Type: `LaunchLinks`
        public struct Links: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.LaunchLinks }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("flickr_images", [String?]?.self),
          ] }

          public var flickr_images: [String?]? { __data["flickr_images"] }
        }
      }
    }
  }

}