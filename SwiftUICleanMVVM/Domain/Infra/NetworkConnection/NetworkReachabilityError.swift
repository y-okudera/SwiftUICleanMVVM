//
//  NetworkReachabilityError.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

enum NetworkReachabilityError: Error {
    case notReachable
    case onlyViaWiFi
}

extension NetworkReachabilityError: LocalizedError {

    /// - Note: 各ケースのメッセージはダイアログで使えるようにするためにローカライズのキーだけ決めておくから、stringsファイルで定義してね
    var errorDescription: String? {
        switch self {
            case .notReachable:
                return "NetworkReachabilityError notReachable"
            case .onlyViaWiFi:
                return "NetworkReachabilityError onlyViaWiFi"
        }
    }
}
