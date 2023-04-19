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
            details
            upcoming
            launch_date_local
            links {
              __typename
              flickr_images
            }
            rocket {
              __typename
              rocket {
                __typename
                id
                name
                description
                height {
                  __typename
                  meters
                }
                diameter {
                  __typename
                  meters
                }
                mass {
                  __typename
                  kg
                }
              }
            }
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
          .field("details", String?.self),
          .field("upcoming", Bool?.self),
          .field("launch_date_local", SpacexAPI.Date?.self),
          .field("links", Links?.self),
          .field("rocket", Rocket?.self),
        ] }

        public var id: SpacexAPI.ID? { __data["id"] }
        public var mission_name: String? { __data["mission_name"] }
        public var details: String? { __data["details"] }
        public var upcoming: Bool? { __data["upcoming"] }
        public var launch_date_local: SpacexAPI.Date? { __data["launch_date_local"] }
        public var links: Links? { __data["links"] }
        public var rocket: Rocket? { __data["rocket"] }

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

        /// Launch.Rocket
        ///
        /// Parent Type: `LaunchRocket`
        public struct Rocket: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.LaunchRocket }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("rocket", Rocket?.self),
          ] }

          public var rocket: Rocket? { __data["rocket"] }

          /// Launch.Rocket.Rocket
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
              .field("height", Height?.self),
              .field("diameter", Diameter?.self),
              .field("mass", Mass?.self),
            ] }

            public var id: SpacexAPI.ID? { __data["id"] }
            public var name: String? { __data["name"] }
            public var description: String? { __data["description"] }
            public var height: Height? { __data["height"] }
            public var diameter: Diameter? { __data["diameter"] }
            public var mass: Mass? { __data["mass"] }

            /// Launch.Rocket.Rocket.Height
            ///
            /// Parent Type: `Distance`
            public struct Height: SpacexAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("meters", Double?.self),
              ] }

              public var meters: Double? { __data["meters"] }
            }

            /// Launch.Rocket.Rocket.Diameter
            ///
            /// Parent Type: `Distance`
            public struct Diameter: SpacexAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("meters", Double?.self),
              ] }

              public var meters: Double? { __data["meters"] }
            }

            /// Launch.Rocket.Rocket.Mass
            ///
            /// Parent Type: `Mass`
            public struct Mass: SpacexAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Mass }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("kg", Int?.self),
              ] }

              public var kg: Int? { __data["kg"] }
            }
          }
        }
      }
    }
  }

}