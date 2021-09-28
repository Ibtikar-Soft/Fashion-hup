//
//  ContentView.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var islogin:UserAuth
    var body: some View {
//        NavigationView{
//
//            if !islogin.isUserLogin{
//                SignIn()
//            }
//            else{
//                Home()
//            }
//        }
        Splach()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
