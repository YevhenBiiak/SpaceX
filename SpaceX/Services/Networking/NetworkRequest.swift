//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import Foundation

protocol NetworkRequest {
    associatedtype Model
    var url: URL? { get }
    func decode(_ data: Data) throws -> Model?
    func execute(withCompletion completion: @escaping (Model?) -> Void)
}

private let session: URLSession = {
    let MB = 1024 * 1024
    let config = URLSessionConfiguration.default
    config.urlCache = URLCache(memoryCapacity: 100 * MB, diskCapacity: 300 * MB, diskPath: "images")
    config.httpMaximumConnectionsPerHost = 5
    return URLSession(configuration: config)
}()

extension NetworkRequest {

    func execute(withCompletion completion: @escaping (Model?) -> Void) {
        Task {
            guard let url else { return completion(nil) }
            let (data, response) = try await session.data(from: url)

            if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
                return DispatchQueue.main.async { completion(nil) }
            }

            if let decodedData = try? decode(data) {
                DispatchQueue.main.async { completion(decodedData) }
            } else {
                DispatchQueue.main.async { completion(nil) }
            }
        }
    }
}
