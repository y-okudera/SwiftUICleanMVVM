//
//  GAreaLargeSearchResponse.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import Foundation

struct Areas: Decodable {
    let gareaLarge: [GareaLarge]
}

struct GareaLarge: Decodable {
    let areacodeL: String
    let areanameL: String
}
