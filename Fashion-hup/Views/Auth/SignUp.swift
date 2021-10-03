//
//  SignUp.swift
//  Lamaati
//
//  Created by Sandal on 15/01/1443 AH.
//

import SwiftUI
import CryptoKit
import SwiftyJSON
import AuthenticationServices
import FirebaseAuth
import Firebase
import ActivityIndicators
struct SignUp: View {
    @EnvironmentObject var userAuth:UserAuth
    @ObservedObject var textBindingManager = TextBindingManager(limit: 9)
    @State var phoneNumberError:Bool=false
    @State var emailAddress = "awad@hot.com"
    @State var emailAddressError = false
    @State var password = "1234567"
    @State var repassword = "1234567"
    @State var nonce_string:String? = ""
    
    @State var passwordError = false
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var isSignInPressed:Bool=false
    @State var isSignUpPressed:Bool=false
    
    @State var user_nameError:Bool=false
    @State var user_name = ""
    @State var gender_checked:Bool=false
    @State var agrement_checked:Bool=false
    @State var isOTPPressed:Bool=false
    @State var show_agreement:Bool=false
    @State var hide_agreement:Bool=false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
        if !show_agreement{
        ScrollView( showsIndicators: false){
        VStack{
            
            
            Group{
                        Text("أهلا بك")
                            .font(.custom(Fount_name.bold.rawValue, size: 35))
                            .foregroundColor(.AppFount).padding()
                
            
            Spacer()
            
            VStack( spacing: 10){
////            Spacer()
//            VStack(alignment: .trailing, spacing: 0){
                Group{
                    HStack{
                        Spacer()
                        Text("اسم المستخدم")
                            .font(.custom(Fount_name.reguler.rawValue, size: 14))

                    }.frame(width: 320)

    //                TextField("05xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
    //                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
    //                    .modifier(customFountCR())
    //                    .foregroundColor(.AppGrayFount)
    //                    .keyboardType(.phonePad)
                    TextField("اسم المستخدم", text: $user_name)
                        .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $user_nameError))
    //                                        .modifier(customFountCR())

    //                                        .foregroundColor(.AppPrimaryColor)
                                            .keyboardType(.emailAddress)
                        .overlay(
                            HStack{
                                Spacer()
                                Image(systemName: "person.fill").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                            }
                        )


                //            Spacer()
                //            VStack(alignment: .trailing, spacing: 0){
//                HStack{
//                    Spacer()
//                    Text("البريد الاكتروني")
//                        .font(.custom(Fount_name.light.rawValue, size: 14))
//
//                }.frame(width: 320)
}
//                Group{
//                TextField("abc@abc.com", text: $emailAddress)
//                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $emailAddressError))
//                    .keyboardType(.emailAddress)
//                    .overlay(
//                        HStack{
//                            Spacer()
//                            Image(systemName: "envelope.fill").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
//                        }
//                    )
//
                HStack{
                    Spacer()
                Text("ادخل رقم الهاتف")
                    .font(.custom(Fount_name.light.rawValue, size: 14))
                }.frame(width: 320)
//            }
                TextField("5xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit).textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50,showError: $phoneNumberError))
                    .overlay(
                        HStack{
                            Text("+966")
                                .frame(width: 40, height: 30, alignment:.center)
                                .padding(.horizontal,10)
                            Spacer()
                            Image(systemName: "candybarphone").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                        }
                    ).keyboardType(.phonePad)







//                HStack(){
//                    Spacer()
//                    Spacer()
//                    HStack{
//
//                                        Button(action: {
//                                            withAnimation{
//                                            gender_checked = true
//                                        }
//                                        }, label: {
//                                            ZStack{
//                                                Circle()
//                                                    .frame(width: 24, height: 24)
//                                                    .foregroundColor(gender_checked ?  Color.AppPrimaryColor : .gray )
//
//
//                                                Circle()
//                                                    .frame(width: 20, height: 20)
//                                                    .foregroundColor(.white)
//
//                                                Circle().frame(width: 16, height: 16).foregroundColor(gender_checked ?  Color.AppPrimaryColor : Color.white.opacity(0.5))
//
//                                            }
//                                        })
//                        Text("أنثى").frame(width: 42, height: 42)
//                            .font(.custom(Fount_name.light.rawValue, size: 14))
//                    }
//                    Spacer()
//                    HStack{
//
//                        Button(action: {
//                            withAnimation{
//                            gender_checked = false
//                            }
//                        }, label: {
//                            ZStack{
//                                Circle()
//                                    .frame(width: 24, height: 24)
//                                    .foregroundColor(!gender_checked ?  Color.AppPrimaryColor : .gray)
//
//
//                                Circle()
//                                    .frame(width: 20, height: 20)
//                                    .foregroundColor(.white)
//
//                                Circle().frame(width: 16, height: 16).foregroundColor(!gender_checked ?  Color.AppPrimaryColor : Color.white.opacity(0.5))
//
//                            }
//                        })
//                        Text("ذكر").frame(width: 42, height: 42).font(.custom(Fount_name.light.rawValue, size: 14))
//
//                    }
//
//                    Spacer()
//                    Text("الجنس")//.frame(width: 42)
//                        .font(.custom(Fount_name.light.rawValue, size: 14))
//                        .offset( y: -20)
//
//                }.frame(width: 320,height: 50).padding(.top,10)






























                Group{
                HStack{
                    Spacer()
                    Text("كلمة المرور")
                        .font(.custom(Fount_name.reguler.rawValue, size: 14))

                }.frame(width: 320)

                SecureField("*******", text: $password)
                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $passwordError))
                    //                    .foregroundColor(.AppPrimaryColor)
                    .keyboardType(.phonePad)
                    .overlay(
                        HStack{
                            Spacer()
                            Image(systemName: "lock.shield").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                        }
                    )
                    HStack{
                        Spacer()
                        Text("تاكيد كلمة المرور")
                            .font(.custom(Fount_name.reguler.rawValue, size: 14))

                    }.frame(width: 320)

                    SecureField("*******", text: $repassword)
                        .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $passwordError))
                        //                    .foregroundColor(.AppPrimaryColor)
                        .keyboardType(.phonePad)
                        .overlay(
                            HStack{
                                Spacer()
                                Image(systemName: "lock.shield").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                            }
                        )
                }


                HStack{
                    Spacer()
                    Button(action: {
//                        withAnimation{
                            agrement_checked.toggle()
//                        }
                    }, label: {
                        ZStack{
                            Circle()
                                .frame(width: 24, height: 24)
                                .foregroundColor(agrement_checked ?  Color.AppPrimaryColor : .gray)


                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)

                            Circle().frame(width: 16, height: 16).foregroundColor(agrement_checked ?  Color.AppPrimaryColor : Color.white.opacity(0.5))

                        }
                    })
                    Text("موافق على الشروط والاحكام").frame( height: 42).font(.custom(Fount_name.light.rawValue, size: 14)).onTapGesture {
                        show_agreement.toggle()
                    }
                    .overlay(
                        VStack{
                            Spacer()
                        Divider().frame(width:150, height: 2).background(Color.AppPrimaryColor)
                        }.frame( height: 43)
                    )

                }.frame(width: 320)
                
                
                
                
                
                
                Button(action: {
                    
                    if FormValidation(){
//                        print("success")
                        RegisterCustomers()
//                        isOTPPressed=true
                        //                checkUserSignIn()
                        //                        UpdateCustomer()
//                        isSignInPressed=true
                    }
                }, label: {
                    Text("تسجيل")
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
                .padding(.top,20)
                Spacer()
                Spacer()
          

            }
        }.onTapGesture {
            hideKeyboard()
        }
            Spacer()
            
            
            
            Text("يمكنك تسجيل الدخول بإستخدام")
                .font(.custom(Fount_name.reguler.rawValue, size: 18))
                .foregroundColor(.AppPrimaryColor)//.padding(.bottom,UIScreen.hight*0.25/3)
            VStack{
                SignInWithAppleButton(
                    onRequest: { request in
                        let nonce = Auth_Setting().randomNonceString()
                        nonce_string = nonce
                        request.requestedScopes = .none
                        request.nonce = Auth_Setting().sha256(nonce)
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
            
            
            Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text(" لديك حساب؟ تسجيل دخول ")
                    .font(.custom(Fount_name.light.rawValue, size: 16))
                    .foregroundColor(.AppPrimaryColor)
                    .frame(width: 320)


            })
            .padding(.bottom,20)
            }
        }
        }
        else{
            ZStack(alignment: .topLeading){
//                Tearms(show_agreement:$show_agreement,hide_agreement:true)
            }.ignoresSafeArea()
        }
        }
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text(message).font(.custom(Fount_name.bold.rawValue, size: 16)) )
        }
        
        .fullScreenCover(isPresented: $isSignInPressed, content: {
//            MainView(selecte_tag: 0)
        })
        .fullScreenCover(isPresented: $isOTPPressed, content: {
//            OTPTextFieldView()
//            OTPView()
        })
        //        }.edgesIgnoringSafeArea(.all).ignoresSafeArea(.all, edges: .all)
    }
    func onCommit() {
        
           print("commit")
       }
       func onEditingChanged(_ changed: Bool) {
           print(changed)
       }
    func FormValidation() -> Bool {
        self.passwordError = (self.password.isEmpty || self.password.count <= 6 || password != repassword)
        emailAddressError =  !isValidEmailAddress(emailAddressString: emailAddress)
        self.phoneNumberError = (self.textBindingManager.text.isEmpty || self.textBindingManager.text.count != 9 || !self.textBindingManager.text.hasPrefix("5")) ? true : false
        
        user_nameError =   self.user_name.isEmpty || user_name.count < 4
        if user_nameError{
            message="خطاء في إسم المستخدم "
            showsAlert=true
        }
        if phoneNumberError{
            message="خطاء في رقم الجوال"
            showsAlert=true
        }
        if passwordError{
            message="خطاء في كلمة المرور"
            showsAlert=true
        }
        else if emailAddressError{
            message="خطاء في البريد"
            showsAlert=true
        }
        if !agrement_checked{
            message="الرجاء الموافقة على الشروط"
            showsAlert=true
        }
        return (!user_nameError && !self.passwordError && !emailAddressError && agrement_checked)
    }
    func RegisterCustomers(){
        
        let prams =  ["UserName":user_name,"Password":password,"Email":emailAddress,"PhoneNo":"966"+textBindingManager.text,"GenderId":gender_checked ? 2 : 1,"TokenId":""] as [String : Any]
//            s    let prams = ["PhoneNo": "+966"+StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text), "Name" : emailAddress,"Id":"\(VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id))"]
            print(Connection().getUrl(word: "RegisterCustomers"))
                print(prams)
            RestAPI().postData(endUrl: Connection().getUrl(word: "RegisterCustomers"), parameters:prams ) { result in
        
                let sectionR = JSON(result!)
                print(sectionR)
                if sectionR["ResponseCode"].int == 200{
                    
                    VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.PhoneNo,Val: StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text))
                    isOTPPressed=true
//                    VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Email,Val: emailAddress)
//                    message = "تم التعديل بنجاح"
//                    showsAlert=true
                }
                if sectionR["ResponseCode"].int == 409{
                    message = "عفوا هذا المستخدم موجود مسبقا"
                    showsAlert = true
                }
            } onError: { error in
                print(error!)
            }
        
    }
}
