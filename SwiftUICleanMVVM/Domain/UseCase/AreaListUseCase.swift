//
//  AreaListUseCase.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation
import Combine

enum AreaListUseCaseProvider {

    static func provide() -> AreaListUseCase {
        return AreaListUseCaseImpl(
            gAreaLargeSearchRepository: BookDetailRepositoryProvider.provide()
        )
    }
}

protocol AreaListUseCase {
    func getAreaList() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>>
}

final class AreaListUseCaseImpl: AreaListUseCase {

    private let gAreaLargeSearchRepository: GAreaLargeSearchRepository

    init(gAreaLargeSearchRepository: GAreaLargeSearchRepository) {
        self.gAreaLargeSearchRepository = gAreaLargeSearchRepository
    }

    func getAreaList() -> Future<GAreaLargeSearchRequest.Response, APIError<GAreaLargeSearchRequest>> {
        self.gAreaLargeSearchRepository.get()
    }
}
