// @generated
// This file was automatically generated and should not be edited.

import Foundation
import Apollo

public enum SpacexAPI {}

typealias APIRocket = SpacexAPI.RocketNamesAndDescriptionsQuery.Data.Rocket

// MARK: - Implementation of SpacexAPI

extension SpacexAPI {
    
    private static let apollo = ApolloClient(url: URL(string: "https://spacex-production.up.railway.app")!)
    
    static func fetchRockets(_ completion: @escaping (Result<[APIRocket], Error>) -> Void) {
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
}
