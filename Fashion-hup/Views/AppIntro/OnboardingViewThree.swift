//
//  OnboardingViewThree.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//

import SwiftUI

struct OnboardingViewThree: View {
    @State private var isAnimating: Bool = false
    @Binding  var isSignInPressed: Bool
    
    var body: some View {
        VStack{
//            Color.AppPrimaryColor
            
//        VStack(spacing: 20.0) {
//            ZStack(alignment: .top){
                
//                    .scaledToFit()
//                    .scaleEffect(isAnimating ? 1 : 0.9)
                Image("onboarding-bg-3")
                    .resizable()
                    .frame(width:UIScreen.width,height:UIScreen.hight*0.5)
                    .scaledToFit()
                    .scaleEffect(isAnimating ? 1 : 0.9)
//            }.edgesIgnoringSafeArea(.top)
//
           
//
            Spacer()
            Text("رعاية حقيقية نتائج موثوقة")
                .font(.custom(Fount_name.light.rawValue, size: 26))
                .foregroundColor(.AppFount)
            Spacer()
            
            Button(action: {
                VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.isFirestOpen, Val: true)
                    isSignInPressed=true
            }, label: {
                Text("إبداء الان")
                    .font(.custom(Fount_name.bold.rawValue, size: 20))
                    
                    .foregroundColor(.AppPrimaryColor)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .frame(width:UIScreen.width*0.8)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(
                                Color.white
                                
                            )
                    )
            })
            .shadow(radius: 5)
            Spacer()
            Spacer()
        }.ignoresSafeArea(.all).edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all)
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.6)) {
                self.isAnimating = true
            }
        })
        .fullScreenCover(isPresented: $isSignInPressed, content: {
            SignIn()
        })
    }
}
