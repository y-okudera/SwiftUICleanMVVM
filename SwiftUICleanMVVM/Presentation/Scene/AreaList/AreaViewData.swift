//
//  AreaViewData.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/29.
//

import Foundation

struct AreaViewData: Identifiable {
    var id = ""
    var name = ""

    init(gAreaLarge: GareaLarge) {
        self.id = gAreaLarge.areacodeL
        self.name = gAreaLarge.areanameL
    }
}
