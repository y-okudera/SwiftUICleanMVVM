//
//  APIClient.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Alamofire
import Combine
import Foundation

final class APIClient {

    static let shared = APIClient()
    private init() {}

    /// API Request
    func request<T: APIRequestable>(_ request: T,
                                    queue: DispatchQueue = .main,
                                    decoder: DataDecoder = defaultDataDecoder()) -> AnyPublisher<T.Response, APIError<T>> {

        return AF.request(request.makeURLRequest())
            .validate(statusCode: 200..<300)
            .publishDecodable(type: T.Response.self, queue: queue, decoder: decoder)
            .value()
            .mapError { APIError<T>(afError: $0) }
            .eraseToAnyPublisher()
    }
}

extension APIClient {
    private static func defaultDataDecoder() -> DataDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoder: DataDecoder = jsonDecoder
        return decoder
    }
}
