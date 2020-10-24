//
//  GuruNaviError.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

/// ぐるなびWebサービス共通のエラーレスポンス
struct GuruNaviErrorResponse: Decodable {
    var error: [GuruNaviError]
}

struct GuruNaviError: Decodable {
    var code: Int
    var message: String?
}
