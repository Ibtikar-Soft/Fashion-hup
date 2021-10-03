//
//  TabBar.swift
//  Fashion-hup
//
//  Created by Sandal on 22/02/1443 AH.
//

import SwiftUI

struct TabBar: View {
    @State var selecte_tag_number:Int
    @State var is_true:Bool = false
    
    init(selecte_tag:Int) {
        let itemAppearance = UITabBarItemAppearance()
        // normal
        itemAppearance.normal.iconColor = UIColor.white
//        itemAppearance.normal.badgeBackgroundColor = UIColor(Color("AppPrimary"))
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color("AppPrimary"))]
        
        itemAppearance.selected.iconColor = .white
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
        let appeareance = UITabBarAppearance()
        appeareance.stackedLayoutAppearance = itemAppearance
        appeareance.inlineLayoutAppearance = itemAppearance
        appeareance.compactInlineLayoutAppearance = itemAppearance
        selecte_tag_number=selecte_tag
        appeareance.backgroundColor = UIColor(Color("AppPrimary"))
        
//        appeareance.stackedLayoutAppearance
//            setTabBarItemColors(appearance.inlineLayoutAppearance)
//            setTabBarItemColors(appearance.compactInlineLayoutAppearance)
        
        UITabBar.appearance().standardAppearance = appeareance
    }
    var body: some View {
        ZStack{
        TabView (selection: $selecte_tag_number){
            
            
            Home()
                    .tabItem {
                        VStack{
                        HStack(spacing:8){
                            Text("الرئيسية")
                            Image(systemName: "house.fill")
                        }.frame(height: 50).padding(10).font(.custom(Fount_name.bold.rawValue, size: 20)).background(Color.white)
                        }.frame(height: 60).background(Color.AppPrimaryColor)
//                            Label(, systemImage: )
                    }.tag(0)
            
            
            
            Text("dsds")
            .tabItem {
                HStack(spacing:8){
                    Text("المفضلة")
                    Image(systemName: "suit.heart.fill")
                }.frame(height: 50).padding(8).font(.custom(Fount_name.bold.rawValue, size: 20))
                
//                            Label(, systemImage: )
            }.tag(1)
            
            
            
            Text("dsds")
            .tabItem {
                HStack(spacing:8){
                    
                    Image(systemName: "cart.fill")
                    Text("السلة")
                }.frame(height: 50).padding(8).font(.custom(Fount_name.bold.rawValue, size: 20))
                
//                            Label(, systemImage: )
            }.tag(2)
            
            Text("البروفايل")
            .tabItem {
                
                HStack(spacing:8){
                    Label("البروفايل", systemImage: "person.fill")
                }.frame(height: 50).padding(8).font(.custom(Fount_name.bold.rawValue, size: 20))
                
//                            Label(, systemImage: )
            }.tag(3)
            
            Text("القائمة")
            .tabItem {
                
                HStack(spacing:8){
//                    Label("", systemImage: "text.justify")
                    Button(action: {
                        print("dsds")
                    }, label: {
                        HStack{
                        Image(systemName: "text.justify")
                            Text("القائمة").onAppear{
                                print("dsfg")
                            }
                        }
                    })
                }.frame(height: 50).padding(8).font(.custom(Fount_name.bold.rawValue, size: 20))
                
//                            Label(, systemImage: )
            }.tag(4)
//                .sheet(isPresented: $is_true, onDismiss: {
//                // change back to previous tab selection
//                self.selecte_tag_number = selecte_tag_number
//            }, content: {   HStack{
//                Image(systemName: "text.justify")
//                    Text("القائمة").onAppear{
//                        print("dsfg")
//                    }
//                } })
            
//          Account()
          
            
            
            
//            Booking()
          
//           Cars()
           
//            Home(menue_id: $selecte_tag_number, addNewCarPressed: $add_vichel)
              
                        
            
        }
        }
//        .fullScreenCover(isPresented: $add_vichel, content: {
////            AddingVichelView()
//            Text("mdssad")
//        })

    }
}
