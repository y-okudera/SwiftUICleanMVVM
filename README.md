# SwiftUICleanMVVM
SwiftUI・Combine frameworkを使用したサンプルアプリ

## Architecture

Clean ArchitectureでPresentationレイヤーには、MVVMを採用

### Libraries

Using Swift Package Manager.

|   Name    | Version |                        Description                        |
| :-------: | :-----: | :-------------------------------------------------------: |
| Alamofire |  5.3.0  | Alamofire is an HTTP networking library written in Swift. |
| Lottie |  3.1.8  | Lottie is natively renders vector based animations and art in realtime with minimal code. |

## Environment


|   Name    | Version |
| :-------: | :-----: |
| Xcode |  12.0.1  |
| Deployment Target |  iOS 14.0 or later  |

## Build

APIキーは、Git管理されていません。

動作確認する際には、[ぐるなびWebサービス](https://api.gnavi.co.jp/api/) からAPIキーを発行して、GuruNaviParamsBuilder.swiftに設定してください。

