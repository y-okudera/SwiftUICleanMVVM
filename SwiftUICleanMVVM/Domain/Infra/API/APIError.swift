//
//  APIError.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

enum APIError<T: APIRequestable>: Error {
    /// 通信状況チェックエラー
    case reachabilityError(NetworkReachabilityError)
    /// キャンセル
    case cancelled
    /// 認証に失敗した場合、または未認証(HTTP status code 401)
    case unauthorized
    /// リソースにアクセスすることを拒否された(HTTP status code 403)
    case forbidden
    /// 接続エラー(オフライン)
    case connectionError
    /// タイムアウト
    case timedOut
    /// レスポンスのデコード失敗
    case decodeError
    /// エラーレスポンス
    case errorResponse(T.ErrorResponse)
    /// 無効なリクエスト
    case invalidRequest
    /// 無効なレスポンス
    case invalidResponse
    /// その他
    case others(error: Error)
}

extension APIError: LocalizedError {

    /// - Note: 各ケースのメッセージはダイアログで使えるようにするためにローカライズのキーだけ決めておくから、stringsファイルで定義してね
    var errorDescription: String? {
        switch self {
            case .reachabilityError(let reachabilityError):
                return reachabilityError.errorDescription
            case .cancelled:
                return "APIError cancelled"
            case .unauthorized:
                return "APIError unauthorized"
            case .forbidden:
                return "APIError forbidden"
            case .connectionError:
                return "APIError connectionError"
            case .timedOut:
                return "APIError timedOut"
            case .decodeError:
                return "APIError decodeError"
            case .errorResponse:
                // The API error message is defined in the error response.
                return nil
            case .invalidRequest:
                return "APIError invalidRequest"
            case .invalidResponse:
                return "APIError invalidResponse"
            case .others:
                return "APIError others"
        }
    }
}
