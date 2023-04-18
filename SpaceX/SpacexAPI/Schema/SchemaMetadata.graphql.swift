// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SpacexAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SpacexAPI.SchemaMetadata {}

public protocol SpacexAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SpacexAPI.SchemaMetadata {}

public protocol SpacexAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SpacexAPI.SchemaMetadata {}

public protocol SpacexAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SpacexAPI.SchemaMetadata {}

public extension SpacexAPI {
  typealias ID = String

  typealias SelectionSet = SpacexAPI_SelectionSet

  typealias InlineFragment = SpacexAPI_InlineFragment

  typealias MutableSelectionSet = SpacexAPI_MutableSelectionSet

  typealias MutableInlineFragment = SpacexAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return SpacexAPI.Objects.Query
      case "Rocket": return SpacexAPI.Objects.Rocket
      case "Launch": return SpacexAPI.Objects.Launch
      case "LaunchLinks": return SpacexAPI.Objects.LaunchLinks
      case "LaunchRocket": return SpacexAPI.Objects.LaunchRocket
      case "Distance": return SpacexAPI.Objects.Distance
      case "Mass": return SpacexAPI.Objects.Mass
      case "RocketPayloadWeight": return SpacexAPI.Objects.RocketPayloadWeight
      case "RocketEngines": return SpacexAPI.Objects.RocketEngines
      case "RocketLandingLegs": return SpacexAPI.Objects.RocketLandingLegs
      case "RocketFirstStage": return SpacexAPI.Objects.RocketFirstStage
      case "Force": return SpacexAPI.Objects.Force
      case "RocketSecondStage": return SpacexAPI.Objects.RocketSecondStage
      case "RocketSecondStagePayloads": return SpacexAPI.Objects.RocketSecondStagePayloads
      case "RocketSecondStagePayloadCompositeFairing": return SpacexAPI.Objects.RocketSecondStagePayloadCompositeFairing
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}