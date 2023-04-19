// @generated
// This file was automatically generated and should not be edited.

import Foundation
import Apollo

public enum SpacexAPI { }

typealias APIRocket = SpacexAPI.RocketQuery.Data.Rocket
typealias APIRockets = [SpacexAPI.RocketNamesAndDescriptionsQuery.Data.Rocket]
typealias APILaunches = [SpacexAPI.LaunchesQuery.Data.Launch]

// MARK: - Implementation of SpacexAPI

extension SpacexAPI {
    
    private static let apollo = ApolloClient(url: URL(string: "https://spacex-production.up.railway.app")!)
    
    static func fetchRocket(id: String, _ completion: @escaping (Result<APIRocket?, Error>) -> Void) {
        apollo.fetch(query: RocketQuery(id: id)) { result in
            switch result {
            case .success(let graphqlResult):
                let rocket = graphqlResult.data?.rocket
                completion(.success(rocket))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func fetchRockets(_ completion: @escaping (Result<APIRockets, Error>) -> Void) {
        apollo.fetch(query: RocketNamesAndDescriptionsQuery()) { result in
            switch result {
            case .success(let graphqlResult):
                let rockets = graphqlResult.data?.rockets?.compactMap {$0}
                completion(.success(rockets ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func fetchLaunches(_ completion: @escaping (Result<APILaunches, Error>) -> Void) {
        apollo.fetch(query: LaunchesQuery()) { result in
            switch result {
            case .success(let graphqlResult):
                let rockets = graphqlResult.data?.launches?.compactMap {$0}
                completion(.success(rockets ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
