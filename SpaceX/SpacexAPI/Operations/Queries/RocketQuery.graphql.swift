// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension SpacexAPI {
  class RocketQuery: GraphQLQuery {
    public static let operationName: String = "Rocket"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Rocket($id: ID!) {
          rocket(id: $id) {
            __typename
            id
            name
            active
            first_flight
            cost_per_launch
            success_rate_pct
            description
            height {
              __typename
              meters
              feet
            }
            diameter {
              __typename
              meters
              feet
            }
            mass {
              __typename
              kg
              lb
            }
            payload_weights {
              __typename
              name
              kg
              lb
            }
            engines {
              __typename
              number
              thrust_to_weight
              type
            }
            landing_legs {
              __typename
              material
              number
            }
            first_stage {
              __typename
              fuel_amount_tons
              reusable
              thrust_sea_level {
                __typename
                kN
                lbf
              }
              thrust_vacuum {
                __typename
                kN
                lbf
              }
            }
            second_stage {
              __typename
              engines
              fuel_amount_tons
              thrust {
                __typename
                kN
                lbf
              }
              payloads {
                __typename
                composite_fairing {
                  __typename
                  diameter {
                    __typename
                    meters
                    feet
                  }
                  height {
                    __typename
                    meters
                    feet
                  }
                }
                option_1
              }
            }
            wikipedia
          }
        }
        """#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: SpacexAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("rocket", Rocket?.self, arguments: ["id": .variable("id")]),
      ] }

      public var rocket: Rocket? { __data["rocket"] }

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
          .field("active", Bool?.self),
          .field("first_flight", SpacexAPI.Date?.self),
          .field("cost_per_launch", Int?.self),
          .field("success_rate_pct", Int?.self),
          .field("description", String?.self),
          .field("height", Height?.self),
          .field("diameter", Diameter?.self),
          .field("mass", Mass?.self),
          .field("payload_weights", [Payload_weight?]?.self),
          .field("engines", Engines?.self),
          .field("landing_legs", Landing_legs?.self),
          .field("first_stage", First_stage?.self),
          .field("second_stage", Second_stage?.self),
          .field("wikipedia", String?.self),
        ] }

        public var id: SpacexAPI.ID? { __data["id"] }
        public var name: String? { __data["name"] }
        public var active: Bool? { __data["active"] }
        public var first_flight: SpacexAPI.Date? { __data["first_flight"] }
        public var cost_per_launch: Int? { __data["cost_per_launch"] }
        public var success_rate_pct: Int? { __data["success_rate_pct"] }
        public var description: String? { __data["description"] }
        public var height: Height? { __data["height"] }
        public var diameter: Diameter? { __data["diameter"] }
        public var mass: Mass? { __data["mass"] }
        public var payload_weights: [Payload_weight?]? { __data["payload_weights"] }
        public var engines: Engines? { __data["engines"] }
        public var landing_legs: Landing_legs? { __data["landing_legs"] }
        public var first_stage: First_stage? { __data["first_stage"] }
        public var second_stage: Second_stage? { __data["second_stage"] }
        public var wikipedia: String? { __data["wikipedia"] }

        /// Rocket.Height
        ///
        /// Parent Type: `Distance`
        public struct Height: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("meters", Double?.self),
            .field("feet", Double?.self),
          ] }

          public var meters: Double? { __data["meters"] }
          public var feet: Double? { __data["feet"] }
        }

        /// Rocket.Diameter
        ///
        /// Parent Type: `Distance`
        public struct Diameter: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("meters", Double?.self),
            .field("feet", Double?.self),
          ] }

          public var meters: Double? { __data["meters"] }
          public var feet: Double? { __data["feet"] }
        }

        /// Rocket.Mass
        ///
        /// Parent Type: `Mass`
        public struct Mass: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Mass }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("kg", Int?.self),
            .field("lb", Int?.self),
          ] }

          public var kg: Int? { __data["kg"] }
          public var lb: Int? { __data["lb"] }
        }

        /// Rocket.Payload_weight
        ///
        /// Parent Type: `RocketPayloadWeight`
        public struct Payload_weight: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketPayloadWeight }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("kg", Int?.self),
            .field("lb", Int?.self),
          ] }

          public var name: String? { __data["name"] }
          public var kg: Int? { __data["kg"] }
          public var lb: Int? { __data["lb"] }
        }

        /// Rocket.Engines
        ///
        /// Parent Type: `RocketEngines`
        public struct Engines: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketEngines }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("number", Int?.self),
            .field("thrust_to_weight", Double?.self),
            .field("type", String?.self),
          ] }

          public var number: Int? { __data["number"] }
          public var thrust_to_weight: Double? { __data["thrust_to_weight"] }
          public var type: String? { __data["type"] }
        }

        /// Rocket.Landing_legs
        ///
        /// Parent Type: `RocketLandingLegs`
        public struct Landing_legs: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketLandingLegs }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("material", String?.self),
            .field("number", Int?.self),
          ] }

          public var material: String? { __data["material"] }
          public var number: Int? { __data["number"] }
        }

        /// Rocket.First_stage
        ///
        /// Parent Type: `RocketFirstStage`
        public struct First_stage: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketFirstStage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("fuel_amount_tons", Double?.self),
            .field("reusable", Bool?.self),
            .field("thrust_sea_level", Thrust_sea_level?.self),
            .field("thrust_vacuum", Thrust_vacuum?.self),
          ] }

          public var fuel_amount_tons: Double? { __data["fuel_amount_tons"] }
          public var reusable: Bool? { __data["reusable"] }
          public var thrust_sea_level: Thrust_sea_level? { __data["thrust_sea_level"] }
          public var thrust_vacuum: Thrust_vacuum? { __data["thrust_vacuum"] }

          /// Rocket.First_stage.Thrust_sea_level
          ///
          /// Parent Type: `Force`
          public struct Thrust_sea_level: SpacexAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Force }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("kN", Double?.self),
              .field("lbf", Double?.self),
            ] }

            public var kN: Double? { __data["kN"] }
            public var lbf: Double? { __data["lbf"] }
          }

          /// Rocket.First_stage.Thrust_vacuum
          ///
          /// Parent Type: `Force`
          public struct Thrust_vacuum: SpacexAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Force }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("kN", Double?.self),
              .field("lbf", Double?.self),
            ] }

            public var kN: Double? { __data["kN"] }
            public var lbf: Double? { __data["lbf"] }
          }
        }

        /// Rocket.Second_stage
        ///
        /// Parent Type: `RocketSecondStage`
        public struct Second_stage: SpacexAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketSecondStage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("engines", Int?.self),
            .field("fuel_amount_tons", Double?.self),
            .field("thrust", Thrust?.self),
            .field("payloads", Payloads?.self),
          ] }

          public var engines: Int? { __data["engines"] }
          public var fuel_amount_tons: Double? { __data["fuel_amount_tons"] }
          public var thrust: Thrust? { __data["thrust"] }
          public var payloads: Payloads? { __data["payloads"] }

          /// Rocket.Second_stage.Thrust
          ///
          /// Parent Type: `Force`
          public struct Thrust: SpacexAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Force }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("kN", Double?.self),
              .field("lbf", Double?.self),
            ] }

            public var kN: Double? { __data["kN"] }
            public var lbf: Double? { __data["lbf"] }
          }

          /// Rocket.Second_stage.Payloads
          ///
          /// Parent Type: `RocketSecondStagePayloads`
          public struct Payloads: SpacexAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketSecondStagePayloads }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("composite_fairing", Composite_fairing?.self),
              .field("option_1", String?.self),
            ] }

            public var composite_fairing: Composite_fairing? { __data["composite_fairing"] }
            public var option_1: String? { __data["option_1"] }

            /// Rocket.Second_stage.Payloads.Composite_fairing
            ///
            /// Parent Type: `RocketSecondStagePayloadCompositeFairing`
            public struct Composite_fairing: SpacexAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.RocketSecondStagePayloadCompositeFairing }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("diameter", Diameter?.self),
                .field("height", Height?.self),
              ] }

              public var diameter: Diameter? { __data["diameter"] }
              public var height: Height? { __data["height"] }

              /// Rocket.Second_stage.Payloads.Composite_fairing.Diameter
              ///
              /// Parent Type: `Distance`
              public struct Diameter: SpacexAPI.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("meters", Double?.self),
                  .field("feet", Double?.self),
                ] }

                public var meters: Double? { __data["meters"] }
                public var feet: Double? { __data["feet"] }
              }

              /// Rocket.Second_stage.Payloads.Composite_fairing.Height
              ///
              /// Parent Type: `Distance`
              public struct Height: SpacexAPI.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { SpacexAPI.Objects.Distance }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("meters", Double?.self),
                  .field("feet", Double?.self),
                ] }

                public var meters: Double? { __data["meters"] }
                public var feet: Double? { __data["feet"] }
              }
            }
          }
        }
      }
    }
  }

}