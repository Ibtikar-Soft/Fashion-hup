//
//  SignIn.swift
//  Fashion-hup
//
//  Created by Sandal on 20/02/1443 AH.
//

import SwiftUI
import CryptoKit
import SwiftyJSON
import AuthenticationServices
import FirebaseAuth
import Firebase
import ActivityIndicators
struct SignIn: View {
    @EnvironmentObject var userAuth:UserAuth
    @State var nonce_string:String? = ""
    
    @State var isOTPPressed:Bool=false
    @State var emailAddress = "awad@hot.com"
    @State var emailAddressError = false
    @State var password = "1234567"
    @State var passwordError = false
    @State var phoneNumberError:Bool=false
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var isSignInPressed:Bool=false
    @State var isSignUpPressed:Bool=false
    @State var isLoading:Bool=false
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 9)
    var body: some View {
        ZStack{
            VStack{
                Group{
                VStack{
                    ZStack(alignment: .top){
                        Image("app_vector").resizable().frame(width:UIScreen.width,height:UIScreen.hight*0.30)
                        VStack{
                            Spacer()
                            Text("مرحبا!")
                                .font(.custom(Fount_name.bold.rawValue, size: 35))
                                .foregroundColor(.AppFount)
                            Text("من فضلك سجل الدخول للتمتع بافضل العروض والخدمات")
                                .font(.custom(Fount_name.reguler.rawValue, size: 13))
                                .foregroundColor(.AppPrimaryColor).padding(.bottom,UIScreen.hight*0.25/3)
                        }
                    }
                    
                    Spacer()
                }.frame(height:UIScreen.hight*0.30)
                //            Spacer()
                VStack(spacing:2){
                    //            Spacer()
                    //            VStack(alignment: .trailing, spacing: 0){
                    HStack{
                        Spacer()
                        Text("رقم الهاتف")
                            .font(.custom(Fount_name.reguler.rawValue, size: 14))
                        
                    }.frame(width: 320)
                    
                    //                TextField("05xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
                    //                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
                    //                    .modifier(customFountCR())
                    //                    .foregroundColor(.AppGrayFount)
                    //                    .keyboardType(.phonePad)
                    TextField("5xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
                        .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
                        
                        .modifier(customFountCB())
                        .foregroundColor(.AppGray)
                        .overlay(
                            HStack{
                                Text("+966")
                                    .frame( height: 30, alignment:.center)
                                    .padding(.horizontal,10)
                                Spacer()
                                Image(systemName: "candybarphone").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                            }
                        )
                        .keyboardType(.phonePad)
                    HStack{
                        Spacer()
                        Text("كلمة المرور")
                            .font(.custom(Fount_name.reguler.rawValue, size: 14))
                        
                    }.frame(width: 320).padding(.top,15)
                    
                    SecureField("*******", text: $password)
                        .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $passwordError))
                        .keyboardType(.phonePad)
                        .overlay(
                            HStack{
                                Spacer()
                                Image(systemName: "lock.shield").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                            }
                        )
                    Button(action: {
                        if FormValidation(){
                            isLoading=true
                            checkUserSignIn()
                            //                        UpdateCustomer()
                            
                        }
                    }, label: {
                        Text("دخول")
                            .font(.custom(Fount_name.bold.rawValue, size: 20))
                            
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 10)
                            .frame(width: 320, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(
                                        Color.AppPrimaryColor
                                        
                                    )
                            )
                        
                    })
                    .padding(.top,30)
                    .shadow(color: .AppPrimaryColor, radius: 1, x: 1, y: 0)
                    
                }.padding(.top,20)
                Spacer()
                Spacer()
                Text("يمكنك تسجيل الدخول بإستخدام")
                    .font(.custom(Fount_name.reguler.rawValue, size: 18))
                    .foregroundColor(.AppPrimaryColor).padding(.bottom,UIScreen.hight*0.25/3)
                }
                .onTapGesture {
                    hideKeyboard()
                }
//                HStack{
                    
                    VStack{
                        SignInWithAppleButton(
                            onRequest: { request in
//                                let request = appleIDProvider.createRequest()
                                let nonce = randomNonceString()
                                nonce_string = nonce
                                request.requestedScopes = [.fullName, .email,]
                                request.requestedScopes = .none
                                request.nonce = sha256(nonce)
                                
                                
                                
                            },
                            onCompletion: { result in
                                switch result {
                                case .success(let authResults):
                                    switch authResults.credential {
                                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                        
                                        guard let nonce = nonce_string else {
                                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                        }
                                        guard let appleIDToken = appleIDCredential.identityToken else {
                                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                        }
                                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                            return
                                        }
                                        
                                        let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                        Auth.auth().signIn(with: credential) { (authResult, error) in
                                            if (error != nil) {
                                                // Error. If error.code == .MissingOrInvalidNonce, make sure
                                                // you're sending the SHA256-hashed nonce as a hex string with
                                                // your request to Apple.
                                                print(error?.localizedDescription as Any)
                                                return
                                            }
                                            print(result)
                                            let handle = Auth.auth().addStateDidChangeListener { auth, user in
                                                print(user?.phoneNumber)
                                                print(user?.email)
                                                VarUserDefault.SysGlobalData.setGlobal(Key:  VarUserDefault.SysGlobalData.isLogin,Val: true)
                                                isSignInPressed=true
                                            }
                                            self.userAuth.login()
                                        }
                                        
                                        print("\(String(describing: Auth.auth().currentUser?.uid))")
                                    default:
                                        break
                                        
                                    }
                                default:
                                    break
                                }
                            }
                        
                    ).frame(width: 320, height: 50)
                    }
                    //                .padding(.init(top:20,leading:50,bottom: 20,trailing: 50))
                    
                    
                    
                    
                    
                    
//                }
                Button(action: {
                    isSignUpPressed=true
                }, label: {
                    Text("ليس لديك حساب؟ حساب جديد")
                        .font(.custom(Fount_name.light.rawValue, size: 16))
                        .foregroundColor(.AppPrimaryColor)
                        .frame(width: 320)
                    
                    
                })
                .padding(.bottom,20)
            }
            if isLoading{
                
                Indicator.Default(isAnimating: isLoading).frame(width: UIScreen.width, height:  UIScreen.hight).background(Color.gray.opacity(0.6))
            }
        }
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text(message).font(.custom(Fount_name.bold.rawValue, size: 16)) )
        }

        .fullScreenCover(isPresented: $isSignInPressed, content: {
            //            MainView(selecte_tag: 0)
            TabBar(selecte_tag: 0)
        })
        .fullScreenCover(isPresented: $isSignUpPressed, content: {
                        SignUp()
        })
        .fullScreenCover(isPresented: $isOTPPressed, content: {
            //            OTPView()
        })
                
                
    }

    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func FormValidation() -> Bool {
        
        self.passwordError = (self.password.isEmpty || self.password.count <= 6 )
        emailAddressError =  !isValidEmailAddress(emailAddressString: emailAddress)
        self.phoneNumberError = (self.textBindingManager.text.isEmpty || self.textBindingManager.text.count != 9 || !self.textBindingManager.text.hasPrefix("5") ) ? true : false
        if passwordError{
            message="خطاء في كلمة المرور"
            showsAlert=true
        }
        //        self.passwordError = self.password.isEmpty ? true : false
        if phoneNumberError{
            message="خطاء في رقم الجوال"
            showsAlert=true
        }
        //        else if emailAddressError{
        //            message="خطاء في البريد"
        //            showsAlert=true
        //        }
        print(!phoneNumberError)
        //        return true
        print (!self.passwordError && !phoneNumberError)
        return (!self.passwordError && !phoneNumberError)
    }
    
    
    func onCommit() {
        
        print("commit")
    }
    func onEditingChanged(_ changed: Bool) {
        print(changed)
    }
    func checkUserSignIn(){
        
        ////
        let prams = ["PhoneNo": "966"+StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text),"Password": password]
        //
        //                                let prams = ["PhoneNo": "66568989679","Password": "123456"]
        RestAPI().postData(endUrl: Connection().getUrl(word: "Login"), parameters: prams) { result in
            
            let sectionR = JSON(result!)
            isLoading=false
            //                    print(Connection().getUrl(word: "login"))
            print(prams)
            print(sectionR)
            ////                    view_loading=false
            //
            if sectionR["ResponseCode"].int == 200{
                VarUserDefault.SysGlobalData.setGlobal(Key:  VarUserDefault.SysGlobalData.user_id,Val:sectionR["Response"]["Id"].intValue)
                VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.PhoneNo,Val: StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text))
                VarUserDefault.SysGlobalData.setGlobal(Key:  VarUserDefault.SysGlobalData.isLogin,Val: true)
                //                        VarUserDefault.SysGlobalData.setGlobal(Key:  VarUserDefault.SysGlobalData.isFirestCarAdded,Val: sectionR["Response"]["Vechiles"].arrayValue.count > 0)
                print(sectionR["Response"]["Vechiles"].arrayValue.count > 0)
                //                        isSignInPressed=true
                
                if sectionR["Response"]["isVerfiy"].boolValue{
                    
                    //
                }
                else{
                    
                    VarUserDefault.SysGlobalData.setGlobal(Key:  VarUserDefault.SysGlobalData.isLogin,Val: true)
                    isSignInPressed=true
                }
            }
            else if sectionR["ResponseCode"].int == 405{
                //                        message = sectionR["ResponseMasg"].stringValue
                //                        showsAlert=true
                isLoading=false
                reSendVerification()
                self.isOTPPressed=true
                
            }
            //                     if sectionR["responseCode"].int == 405{ // user not active
            //        //                displayItem=1
            //        //                reSendVerification()
            //                    }
            else{
                message = sectionR["ResponseMasg"].stringValue
                showsAlert=true
            }
            
        } onError: { error in
            print(error)
            //                    view_loading=false
            isLoading=false
            //            showSandalLoadingIndicater=false
        }
        
        //
        
    }
    func reSendVerification(){
        
        //        print( Connection().getUrl(word: "ReSendVarificationCode")+StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text))
        //        RestAPI().getData(endUrl: Connection().getUrl(word: "ReSendVarificationCode")+StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text), parameters: [:]) { result in
        
        
        //        }
    }
}

/*
 
 ///
 //    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
 //    let config = GIDConfiguration(clientID: clientID)
 
 var body: some View {
 ZStack{
 Color.gray.ignoresSafeArea()
 VStack{
 Group {
 SignInWithAppleButton(
 onRequest: { request in
 let nonce = randomNonceString()
 nonce_string = nonce
 request.requestedScopes = .none
 request.nonce = sha256(nonce)
 },
 onCompletion: { result in
 switch result {
 case .success(let authResults):
 switch authResults.credential {
 case let appleIDCredential as ASAuthorizationAppleIDCredential:
 
 guard let nonce = nonce_string else {
 fatalError("Invalid state: A login callback was received, but no login request was sent.")
 }
 guard let appleIDToken = appleIDCredential.identityToken else {
 fatalError("Invalid state: A login callback was received, but no login request was sent.")
 }
 guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
 print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
 return
 }
 
 let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
 Auth.auth().signIn(with: credential) { (authResult, error) in
 if (error != nil) {
 // Error. If error.code == .MissingOrInvalidNonce, make sure
 // you're sending the SHA256-hashed nonce as a hex string with
 // your request to Apple.
 print(error?.localizedDescription as Any)
 return
 }
 print(result)
 let handle = Auth.auth().addStateDidChangeListener { auth, user in
 print(user?.phoneNumber)
 print(user?.email)
 
 }
 self.userAuth.login()
 }
 
 print("\(String(describing: Auth.auth().currentUser?.uid))")
 default:
 break
 
 }
 default:
 break
 }
 }
 ).frame(width: 280, height: 50, alignment: .center)
 .padding(.init(top:200,leading:50,bottom: 20,trailing: 50))
 }
 
 
 
 }
 }
 }
 }
 */
