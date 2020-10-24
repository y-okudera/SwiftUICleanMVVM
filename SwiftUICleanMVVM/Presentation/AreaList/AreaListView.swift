//
//  AreaListView.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import SwiftUI

struct AreaListView: View {

    @ObservedObject
    var viewModel: AreaListViewModel

    var body: some View {
        NavigationView {
            List($viewModel.areas.wrappedValue) { area in
                Text(area.name)
            }
            .onAppear(perform: viewModel.onAppear)
            .navigationBarTitle("エリア一覧")
        }
    }
}

struct AreaListView_Previews: PreviewProvider {
    static var previews: some View {
        AreaListBuilder.build()
    }
}
