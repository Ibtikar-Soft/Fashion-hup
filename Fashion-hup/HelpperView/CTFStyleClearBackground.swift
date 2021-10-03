//
//  CTFStyleClearBackground.swift
//  Fashion-hup
//
//  Created by Sandal on 21/02/1443 AH.
//

import SwiftUI
public struct CTFStyleClearBackground : TextFieldStyle {
    var width:CGFloat=376
    var cornerRadius:CGFloat=20
    var height:CGFloat=50
    var lineWidth:CGFloat=0.6
    var size=16
    var foregroundColor = Color.black
        
    
    @Binding var showError:Bool
   public func _body(configuration: TextField<Self._Label>) -> some View {
       configuration
        .modifier(customFount(fount: Fount_name.extra_light.rawValue,size: size))
        .foregroundColor(foregroundColor)
           .multilineTextAlignment(.center)
           .frame(width: width, height:height)
           .background(
               RoundedRectangle(cornerRadius: 10)
               .foregroundColor(Color.textBackground)
               .background(RoundedRectangle(cornerRadius: 10)
                            .stroke((showError ) ? Color(#colorLiteral(red: 0.8172891695, green: 0.3017711901, blue: 0.3019049658, alpha: 0.9075610017)) : Color.AppStrok, lineWidth:showError  ? 1.5 : lineWidth)
               )
           )
//        .shadow(radius: 1)
        
       
           

   }
}
