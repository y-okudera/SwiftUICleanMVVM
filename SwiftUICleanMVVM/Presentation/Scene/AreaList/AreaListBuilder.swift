//
//  AreaListBuilder.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

enum AreaListBuilder {

    static func build() -> AreaListView<AreaListViewModel> {
        let useCase = AreaListUseCaseProvider.provide()
        let viewModel = AreaListViewModel(useCase: useCase)
        let view = AreaListView(viewModel: viewModel)
        return view
    }
}
