//
//  UserAuth.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import Foundation
class UserAuth: ObservableObject {
    @Published var isUserLogin:Bool = false
    func login(){
        isUserLogin = true
    }
    func logout(){
        isUserLogin = false
    }
}
