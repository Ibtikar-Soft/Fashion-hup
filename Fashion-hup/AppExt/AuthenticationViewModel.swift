//
//  AuthenticationViewModel.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI
import Firebase
import GoogleSignIn

class AuthenticationViewModel: NSObject, ObservableObject {

  // 1
  enum SignInState {
    case signedIn
    case signedOut
  }

  // 2
  @Published var state: SignInState = .signedOut

  // 3
  override init() {
    super.init()

    setupGoogleSignIn()
  }

  // 4
  func signIn() {
    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
       if error != nil || user == nil {
         // Show the app's signed-out state.
       } else {
         // Show the app's signed-in state.
       }
     }
  }

  // 5
  func signOut() {
    GIDSignIn.sharedInstance.signOut()

    do {
      try Auth.auth().signOut()

      state = .signedOut
    } catch let signOutError as NSError {
      print(signOutError.localizedDescription)
    }
  }

  // 6
  private func setupGoogleSignIn() {
//    GIDSignIn.sharedInstance()?.presentingViewController = self
//    GIDSignIn.sharedInstance.delegate = self
//    GIDSignIn.sharedInstance.dele
//    GIDSignIn.sharedInstance.uiDelegate = self
  }
}



