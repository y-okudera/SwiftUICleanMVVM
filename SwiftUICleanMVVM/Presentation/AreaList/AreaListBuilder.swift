//
//  AreaListBuilder.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import SwiftUI

enum AreaListBuilder {

    static func build() -> AreaListView {
        let viewModel = AreaListViewModel(useCase: AreaListUseCaseProvider.provide())
        let view = AreaListView(viewModel: viewModel)
        return view
    }
}
