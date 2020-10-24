//
//  AreaListViewModel.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

struct AreaViewData: Identifiable {
    var id = ""
    var name = ""

    init(gAreaLarge: GareaLarge) {
        self.id = gAreaLarge.areacodeL
        self.name = gAreaLarge.areanameL
    }
}

final class AreaListViewModel: ObservableObject {

    @Published
    var areas: [AreaViewData] = []

    var useCase: AreaListUseCase!

    init(useCase: AreaListUseCase) {
        self.useCase = useCase
    }

    private(set) lazy var onAppear: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.useCase.getAreaList(completion: { (result) in
            switch result {
            case .success(let response):
                self.areas = response.gareaLarge.map { AreaViewData(gAreaLarge: $0) }
            case .failure(let error):
                self.areas = []
            }
        })
    }
}
