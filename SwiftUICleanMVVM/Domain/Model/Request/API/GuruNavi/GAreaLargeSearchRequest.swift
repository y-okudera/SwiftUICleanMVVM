//
//  GAreaLargeSearchRequest.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

/// エリアLマスタ取得API
final class GAreaLargeSearchRequest: APIRequestable {
    typealias Response = Areas
    let baseURL = URL(string: "https://api.gnavi.co.jp")!
    let path: String = "/master/GAreaLargeSearchAPI/v3/"
    var parameters: [String: Any] = [:]

    init() {
        self.createParameters()
    }

    private func createParameters() {
        self.parameters = GuruNaviParamsBuilder.build()
    }
}
