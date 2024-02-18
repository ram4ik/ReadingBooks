//
//  HiddenModifier.swift
//  ReadingBooks
//
//  Created by test on 18.02.2024.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    var isEnabeled = false
    func body(content: Content) -> some View {
        if isEnabeled {
            content
                .hidden()
        } else {
            content
        }
    }
}

extension View {
    func hidden(isEnabled: Bool) -> some View {
        modifier(HiddenModifier(isEnabeled: isEnabled))
    }
}
