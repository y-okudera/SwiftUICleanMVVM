//
//  View+.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/26.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        }
        else {
            self
        }
    }
}
