//
//  ColorExt.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//

import Foundation
import SwiftUI
extension Color {
    static let AppPrimaryColor = Color("AppPrimary")
    static let AppFount = Color("AppFount")
//    static let AppGrayFount = Color("AppGrayFount")
//    static let AppDiscoverColor = Color("discoverColor")
//
    static let textBackground = Color("textBackground")
    static let AppStrok = Color("AppStrok")
    
    static let AppGray = Color("AppGray")
    
    
    
//    static let AppTextFiledColor = Color("AppTextFiledColor")
}



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    func toHexString() -> String {
           var r:CGFloat = 0
           var g:CGFloat = 0
           var b:CGFloat = 0
           var a:CGFloat = 0
//           getRed(&r, green: &g, blue: &b, alpha: &a)
           let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
           return String(format:"#%06x", rgb)
       }
    var redComponent: Double? {
           let val = description
           guard val.hasPrefix("#") else { return nil }
           let r1 = val.index(val.startIndex, offsetBy: 1)
           let r2 = val.index(val.startIndex, offsetBy: 2)
           return Double(Int(val[r1...r2], radix: 16)!) / 255.0
       }

       var greenComponent: Double? {
           let val = description
           guard val.hasPrefix("#") else { return nil }
           let g1 = val.index(val.startIndex, offsetBy: 3)
           let g2 = val.index(val.startIndex, offsetBy: 4)
           return Double(Int(val[g1...g2], radix: 16)!) / 255.0
       }

       var blueComponent: Double? {
           let val = description
           guard val.hasPrefix("#") else { return nil }
           let b1 = val.index(val.startIndex, offsetBy: 5)
           let b2 = val.index(val.startIndex, offsetBy: 6)
           return Double(Int(val[b1...b2], radix: 16)!) / 255.0
       }

       var opacityComponent: Double? {
           let val = description
           guard val.hasPrefix("#") else { return nil }
           let b1 = val.index(val.startIndex, offsetBy: 7)
           let b2 = val.index(val.startIndex, offsetBy: 8)
           return Double(Int(val[b1...b2], radix: 16)!) / 255.0
       }
}
