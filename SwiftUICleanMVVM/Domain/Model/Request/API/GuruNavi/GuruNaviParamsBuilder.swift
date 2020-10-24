//
//  GuruNaviParamsBuilder.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

/// ぐるなびWebサービス共通のリクエストパラメータ
enum GuruNaviParamsBuilder {
    static func build() -> [String: Any] {
        let params: [String: Any] = ["keyid": ""]
        return params
    }
}
