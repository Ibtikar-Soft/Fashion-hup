//
//  Home.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
struct Home: View {
    let user = Auth.auth().currentUser
  var uid = ""
  var email = ""
    var photoURL:URL? = URL(string: "")
  var multiFactorString = "Mul"
  
  var multiFactor = ""
  var ultiFactorString = ""
    init() {
        uid = user?.uid ?? ""
        email = user?.email ?? ""
        photoURL = user?.photoURL
        multiFactorString = user?.displayName ?? ""
//          for info in user?.multiFactor.enrolledFactors {
//            multiFactorString += info.displayName ?? "[DispayName]"
//            multiFactorString += " "
//          }
    }
    var body: some View {
        VStack{
            SignOut()
        Text("\(uid)")
        
            Text("\(email)")
            Text("\(multiFactorString)")
//            Text("\(photoURL)")
//            Text("\(multiFactorString)")
//            Text("\(multiFactorString)")
            
        }
    }
}
