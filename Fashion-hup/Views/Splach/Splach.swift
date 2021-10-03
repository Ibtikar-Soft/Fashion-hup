//
//  Splach.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//

import SwiftUI

struct Splach: View {
    var isFirestOpen: Bool =  VarUserDefault.SysGlobalData.getGlobalBool(key: VarUserDefault.SysGlobalData.isFirestOpen)
//   var isLogin: Bool =  VarUserDefault.SysGlobalData.getGlobalBool(key: VarUserDefault.SysGlobalData.isLogin)
        @AppStorage("isLogin") var isLogin: Bool =  VarUserDefault.SysGlobalData.getGlobalBool(key: VarUserDefault.SysGlobalData.isLogin)
   @State var logo_key=0
    var uAnimationDuration: Double { return 3.4 }
   var body: some View {
    ZStack(alignment: .top){
       if logo_key == 0{
           Image(app_logo).resizable().frame(width: 250, height: 175, alignment: .center).onAppear{
               restartAnimation()
           }
       }
       else {
           if  !isFirestOpen {
           
               AppInto()
                
           }
            else{
           if !isLogin{
            
//            Image("app_vector").resizable().frame(width:UIScreen.width,height:UIScreen.hight*0.6)
               SignIn()
               
           }
           else{
//            ReservationDetailes()
            Home()//selecte_tag: 0).edgesIgnoringSafeArea(.all)
//           .onTapGesture { // dont free this comment
//               self.hideKeyboard()
//             }
           }
            }
       }
       }
   }
   func restartAnimation(video_time:Double=0.0) {
       let deadline: DispatchTime = video_time != 0.0 ? .now() + video_time :.now() + uAnimationDuration
     DispatchQueue.main.asyncAfter(deadline: deadline) {
       if self.logo_key+1 == 2{
         self.logo_key += 1
       }
       else{
//        withAnimation(.easeIn(duration: uAnimationDuration)) {
           self.logo_key += 1
//            isPresented = self.logo_key == 2 ? true : false
//            restartAnimation()
          }
//        }
     }
   }
}


