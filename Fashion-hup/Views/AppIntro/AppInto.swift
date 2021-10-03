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
    
    let pages: [IntroPage] = [IntroPage(imageName: app_intro[0][0], title:app_intro[0][1], description: app_intro[0][1]),IntroPage(imageName: app_intro[1][0], title: app_intro[1][1], description: app_intro[1][1]),IntroPage(imageName: app_intro[2][0], title: app_intro[2][1], description: app_intro[1][1])]
       
       @State private var currentPage = 0
       
    var body: some View {
        ZStack{
            Color.AppPrimaryColor
        VStack {
            
              
                  TabView(selection: $currentPage) {
                      ForEach (0 ..< self.pages.count) { index in
                          IntroPageView(page: self.pages[index])
                              .tag(index)
                              .padding()
                      }
                  }
                  .tabViewStyle(PageTabViewStyle()) // the important part
              
                  // NEXT button
                  HStack {
                    Button(action: {
                        withAnimation (.easeInOut(duration: 1.0)) {
                          
                              self.currentPage -= 1
                          
                            
                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .padding()
//                            .background(Circle().fill(Color.purple))
                    }.opacity( self.currentPage == 0 ? 0 : 1)
                      Spacer()
                      Button(action: {
                          withAnimation (.easeInOut(duration: 1.0)) {
                            if self.currentPage == self.pages.count-1 {
                                isSignInPressed = true
                            }
                            else{
                                self.currentPage += 1
                            }
                              
                          }
                      }) {
                          Image(systemName: "arrow.left")
                              .font(.largeTitle)
                              .foregroundColor(Color.white)
                              .padding()
//                              .background(Circle().fill(Color.purple))
                      }
                  }
                  .padding()
        }
              }.fullScreenCover(isPresented: $isSignInPressed, content: {
                SignIn()
//                    .onTapGesture {
//                    hideKeyboard()
//                }
            })
          
      
    }
}
struct IntroPage {
    let imageName: String
    let title: String
    let description: String
}


struct IntroPageView: View {
    let page: IntroPage
    var body: some View {
        VStack {
            Spacer()
            Circle().fill(Color.white).frame(width: UIScreen.width*0.5, height:  UIScreen.width*0.5, alignment: .center).overlay(
                VStack{
                Image(self.page.imageName)
                    .resizable()
                    
//                }.frame(width:120, height: 120, alignment: .center)
                }.frame(width: (UIScreen.width*0.5)/1.4, height: (UIScreen.width*0.5)/1.4, alignment: .center)
            )
            
                
//            Spacer()
//            Group {
                HStack {
                    Spacer()
                    Text(self.page.title)
                        .font(.custom(Fount_name.bold.rawValue, size:18))
//                        .foregroundColor(.AppFount)
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top,10)
//                HStack {
//                    Text(self.page.description)
                    
//                }
//            }
            .padding()
            Spacer()
            Spacer()
        }
    }
}
/*
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
*/
