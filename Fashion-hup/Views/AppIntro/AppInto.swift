//
//  AppInto.swift
//  Lamaati
//
//  Created by Sandal on 14/01/1443 AH.
//

import SwiftUI

struct AppInto: View {
    @State private var currentTab = 0
    @State private var isSignInPressed: Bool = false
    var body: some View {
        ZStack(alignment: .top){
            Color.AppPrimaryColor
            Image("vector").resizable().frame(width:UIScreen.width,height:UIScreen.hight*0.6)
        TabView(selection: $currentTab,
                content:  {
                    OnboardingViewOne(isSignInPressed: $isSignInPressed)
                        .tag(0)
                    OnboardingViewTwo(isSignInPressed: $isSignInPressed)
                        .tag(1)
                    OnboardingViewThree(isSignInPressed: $isSignInPressed)
                        .tag(3)
                })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }.edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all).fullScreenCover(isPresented: $isSignInPressed, content: {
            SignIn()
        })
    }
}


struct AppInto_Previews: PreviewProvider {
    static var previews: some View {
        AppInto()
    }
}
