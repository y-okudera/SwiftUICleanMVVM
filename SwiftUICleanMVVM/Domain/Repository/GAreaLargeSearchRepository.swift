//
//  GAreaLargeSearchRepository.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation
import Combine

enum BookDetailRepositoryProvider {
    
    static func provide() -> GAreaLargeSearchRepository {
        return GAreaLargeSearchRepositoryImpl(api: GAreaLargeSearchAPIGatewayProvider.provide())
    }
}

protocol GAreaLargeSearchRepository {
    func get() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>>
}

private final class GAreaLargeSearchRepositoryImpl: GAreaLargeSearchRepository {
    
    private let api: GAreaLargeSearchAPIGateway
    private var cancellables: [AnyCancellable] = []
    
    init(api: GAreaLargeSearchAPIGateway) {
        self.api = api
    }
    
    func get() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>> {
        return self.api.get()
    }
}
