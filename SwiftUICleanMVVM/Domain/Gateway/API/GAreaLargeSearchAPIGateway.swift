//
//  GAreaLargeSearchAPIGateway.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

enum GAreaLargeSearchAPIGatewayProvider {

    static func provide() -> GAreaLargeSearchAPIGateway {
        return GAreaLargeSearchAPIGatewayImpl(apiClient: .shared)
    }
}

protocol GAreaLargeSearchAPIGateway {
    func get(completion: @escaping (GAreaLargeSearchResult) -> Void)
}

private final class GAreaLargeSearchAPIGatewayImpl: GAreaLargeSearchAPIGateway {

    var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func get(completion: @escaping (GAreaLargeSearchResult) -> Void) {
        let request = GAreaLargeSearchRequest()
        NetworkConnection.isReachable { [weak self] result in
            switch result {
            case .success:
                self?.apiClient.request(request: request, completion: completion)
                
            case .failure(let reachabilityError):
                completion(.failure(.reachabilityError(reachabilityError)))
            }
        }
    }
}
