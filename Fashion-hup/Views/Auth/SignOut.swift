//
//  SignOut.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
struct SignOut: View {
    @EnvironmentObject var userAuth:UserAuth
    var body: some View {
        VStack{
            Button(action: {
                do {
                    try Auth.auth().signOut()
                    userAuth.logout()
                    
                } catch {
                        print(error)
                    }
//                }
//                catch(e:Error){
//                print(e)
//                }
            }, label: {
                Text("SignOut")
            })
            
        }
    }
}
