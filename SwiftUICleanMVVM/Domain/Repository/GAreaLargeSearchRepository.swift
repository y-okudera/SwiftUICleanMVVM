//
//  GAreaLargeSearchRepository.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

enum BookDetailRepositoryProvider {
    
    static func provide() -> GAreaLargeSearchRepository {
        return GAreaLargeSearchRepositoryImpl(api: GAreaLargeSearchAPIGatewayProvider.provide())
    }
}

protocol GAreaLargeSearchRepository {
    func get(completion: @escaping (GAreaLargeSearchResult) -> Void)
}

private final class GAreaLargeSearchRepositoryImpl: GAreaLargeSearchRepository {
    
    private let api: GAreaLargeSearchAPIGateway
    
    init(api: GAreaLargeSearchAPIGateway) {
        self.api = api
    }
    
    func get(completion: @escaping (GAreaLargeSearchResult) -> Void) {
        api.get(completion: completion)
    }
}
