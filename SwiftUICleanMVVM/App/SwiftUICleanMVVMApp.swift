//
//  SwiftUICleanMVVMApp.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/24.
//

import SwiftUI

@main
struct SwiftUICleanMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            AreaListBuilder.build()
        }
    }
}
