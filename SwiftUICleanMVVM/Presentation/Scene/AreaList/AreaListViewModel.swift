//
//  AreaListViewModel.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation
import Combine

protocol AreaListViewModelProtocol: ObservableObject {
    var viewData: [AreaViewData] { get set }
    var errorMessage: String? { get set }
    var isLoading: Bool { get set }
    var selectedArea: AreaViewData? { get set }

    var onAppear: () -> Void { get }
    var onDisappear: () -> Void { get }
}

final class AreaListViewModel: AreaListViewModelProtocol, ObservableObject {

    private var cancellables: [AnyCancellable] = []
    
    @Published
    var viewData: [AreaViewData] = []

    @Published
    var errorMessage: String?

    @Published
    var isLoading = false

    @Published
    var selectedArea: AreaViewData?
    
    var useCase: AreaListUseCase!
    
    init(useCase: AreaListUseCase) {
        self.useCase = useCase
    }
    
    private(set) lazy var onAppear: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.getAreaList()
    }
    
    private(set) lazy var onDisappear: () -> Void = { [weak self] in
        guard let self = self else { return }
        self.cancellables.forEach { $0.cancel() }
        self.cancellables = []
    }
}

extension AreaListViewModel {

    /// エリア一覧を取得する
    private func getAreaList() {
        self.isLoading = true

        self.useCase.getAreaList()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let apiError):
                    print("APIError: \(apiError.errorDescription ?? "")")
                    self?.errorMessage = apiError.errorDescription
                }
                self?.isLoading = false

            } receiveValue: { [weak self] response in
                self?.viewData = response.gareaLarge.map { AreaViewData(gAreaLarge: $0) }
            }
            .store(in: &self.cancellables)
    }
}
