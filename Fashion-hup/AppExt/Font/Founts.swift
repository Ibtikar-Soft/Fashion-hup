//
//  Founts.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//


import SwiftUI
struct customFountCR : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom(Fount_name.light.rawValue, size: 20))
        }
    }
struct customFountCB : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom(Fount_name.black.rawValue, size: 16))
        }
    }

struct customFount : ViewModifier {
    var fount = ""
    var size = 16
    func body(content: Content) -> some View {
        content
            .font(.custom(fount, size: CGFloat(size)))
    }
}
