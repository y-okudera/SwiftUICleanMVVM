//
//  AreaListView.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import SwiftUI

struct AreaListView<ViewModel: AreaListViewModelProtocol>: View {

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ZStack {
                List($viewModel.viewData.wrappedValue) { area in
                    Button(
                        action: { viewModel.selectedArea = area },
                        label: { Text(area.name) }
                    )
                    .alert(
                        isPresented: Binding<Bool>(
                            get: { viewModel.selectedArea != nil },
                            set: { _ in viewModel.selectedArea = nil }
                        ), content: {
                            Alert(title: Text("エリア名"), message: Text(viewModel.selectedArea?.name ?? ""))
                        }
                    )
                }
                .onAppear(perform: viewModel.onAppear)
                .onDisappear(perform: viewModel.onDisappear)
                .navigationBarTitle("エリア一覧")
                .alert(
                    isPresented: Binding<Bool>(
                        get: { viewModel.errorMessage != nil },
                        set: { _ in viewModel.errorMessage = nil }
                    ), content: {
                        Alert(
                            title: Text("エラー"),
                            message: Text(viewModel.errorMessage ?? ""),
                            primaryButton: Alert.Button.default(Text("リトライ"), action: viewModel.onAppear),
                            secondaryButton: Alert.Button.cancel(Text("キャンセル"))
                        )
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
