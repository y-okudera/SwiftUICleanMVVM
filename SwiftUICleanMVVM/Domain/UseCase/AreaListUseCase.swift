//
//  AreaListUseCase.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

typealias GAreaLargeSearchResult = Result<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>>

enum AreaListUseCaseProvider {

    static func provide() -> AreaListUseCase {
        return AreaListUseCaseImpl(
            gAreaLargeSearchRepository: BookDetailRepositoryProvider.provide()
        )
    }
}

protocol AreaListUseCase {
    func getAreaList(completion: @escaping (GAreaLargeSearchResult) -> Void)
}

final class AreaListUseCaseImpl: AreaListUseCase {

    private let gAreaLargeSearchRepository: GAreaLargeSearchRepository

    init(gAreaLargeSearchRepository: GAreaLargeSearchRepository) {
        self.gAreaLargeSearchRepository = gAreaLargeSearchRepository
    }

    func getAreaList(completion: @escaping (GAreaLargeSearchResult) -> Void) {
        self.gAreaLargeSearchRepository.get(completion: completion)
    }
}
