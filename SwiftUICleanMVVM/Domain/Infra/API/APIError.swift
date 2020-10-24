//
//  APIError.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Alamofire
import Foundation

enum APIError<T: APIRequestable>: Error {
    /// キャンセル
    case cancelled
    /// 接続エラー(オフライン)
    case connectionError
    /// タイムアウト
    case timedOut
    /// 無効なレスポンス
    case invalidResponse
    /// その他
    case others(error: Error)

    /// AFError to APIError.
    init(afError: AFError?) {
        guard let afError = afError else {
            print("data and error are nil.")
            self = .invalidResponse
            return
        }
        print("AFError:\(afError)")

        if afError.isExplicitlyCancelledError {
            print("request is cancelled.")
            self = .cancelled
            return
        }

        if case .sessionTaskFailed(error: let error) = afError {
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet, .networkConnectionLost:
                    self = .connectionError
                    return
                case .timedOut:
                    self = .timedOut
                    return
                default:
                    break
                }
            }
        }
        self = .others(error: afError)
    }
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .cancelled:
                return "APIError cancelled"
            case .connectionError:
                return "APIError connectionError"
            case .timedOut:
                return "APIError timedOut"
            case .invalidResponse:
                return "APIError invalidResponse"
            case .others(let error):
                return "APIError others: \(error.localizedDescription)"
        }
    }
}
