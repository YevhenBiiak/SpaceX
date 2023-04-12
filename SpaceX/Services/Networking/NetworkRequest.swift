//
//  NetworkRequest.swift
//  SpaceX
//
//  Created by Yevhen Biiak on 09.04.2023.
//

import Foundation

private let downloadQueue = DispatchQueue(label: "image.download", qos: .background, attributes: .concurrent)
private let semaphore = DispatchSemaphore(value: 2)

protocol NetworkRequest {
    associatedtype Model
    var url: URL? { get }
    func decode(_ data: Data) throws -> Model?
    func execute(withCompletion completion: @escaping (Model?) -> Void)
}

//extension NetworkRequest {
//
//    func execute(withCompletion completion: @escaping (Model?) -> Void) {
//        guard let url else { return completion(nil) }
//
//        downloadQueue.async {
//            semaphore.wait()
//            print("next", semaphore.description)
//            URLSession.shared.dataTask(with: url) { data, response, error in
//
//                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
//                    DispatchQueue.main.async { completion(nil) }
//                }
//
//                if let data, let decodedData = try? decode(data) {
//                    DispatchQueue.main.async { completion(decodedData) }
//                } else {
//                    DispatchQueue.main.async { completion(nil) }
//                }
//
//                semaphore.signal()
//            }.resume()
//        }
//    }
//}

extension NetworkRequest {

    func execute(withCompletion completion: @escaping (Model?) -> Void) {
        Task {
            guard let url else { return completion(nil) }
            let (data, response) = try await URLSession.shared.data(from: url)

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
