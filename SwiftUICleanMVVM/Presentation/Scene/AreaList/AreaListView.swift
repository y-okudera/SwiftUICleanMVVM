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
            ZStack {
                List($viewModel.viewData.wrappedValue) { area in Text(area.name) }
                    .onAppear(perform: viewModel.onAppear)
                    .onDisappear(perform: viewModel.onDisappear)
                    .navigationBarTitle("エリア一覧")
                    .alert(
                        isPresented: Binding<Bool>(get: { viewModel.errorMessage != nil }, set: { _ in } ),
                        content: {
                            Alert(title: Text("エラー"), message: Text(viewModel.errorMessage ?? ""))
                        }
                    )
                LottieView(lottieViewType: .loading)
                    .frame(width: 80, height: 80)
                    .hidden(!$viewModel.isLoading.wrappedValue)
            }
        }
    }
}

struct AreaListView_Previews: PreviewProvider {
    static var previews: some View {
        AreaListBuilder.build()
    }
}
