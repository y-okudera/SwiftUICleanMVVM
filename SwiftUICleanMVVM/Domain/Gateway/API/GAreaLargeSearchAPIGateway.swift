//
//  GAreaLargeSearchAPIGateway.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation
import Combine

enum GAreaLargeSearchAPIGatewayProvider {

    static func provide() -> GAreaLargeSearchAPIGateway {
        return GAreaLargeSearchAPIGatewayImpl(apiClient: .shared)
    }
}

protocol GAreaLargeSearchAPIGateway {
    func get() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>>
}

private final class GAreaLargeSearchAPIGatewayImpl: GAreaLargeSearchAPIGateway {

    var apiClient: APIClient
    private var cancellables: [AnyCancellable] = []
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func get() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>> {
        return Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>> { [weak self] promise in
            guard let self = self else { return }
            let request = GAreaLargeSearchRequest()
            self.apiClient.request(request).sink { completion in
                switch completion {
                case .finished:
                    print("GAreaLargeSearchAPIGateway get finished")
                case .failure(let apiError):
                    print("GAreaLargeSearchAPIGateway get failure")
                    promise(.failure(apiError))
                }
            } receiveValue: { response in
                promise(.success(response))
            }.store(in: &self.cancellables)
        }
    }
}
