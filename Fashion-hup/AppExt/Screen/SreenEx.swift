//
//  SreenEx.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//

import SwiftUI


extension UIScreen{
    static let  width = UIScreen.main.bounds.size.width
    static let  hight = UIScreen.main.bounds.size.height
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
