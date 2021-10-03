//
//  AdvanceSearch.swift
//  Fashion-hup
//
//  Created by Sandal on 23/02/1443 AH.
//

import SwiftUI

struct AdvanceSearch: View {
    @Binding var advance_serch:Bool
    var body: some View {
        VStack(alignment: .leading){
            
            VStack{
                Button(action: {
                    withAnimation (.easeInOut(duration: 0.3)) {
                        advance_serch.toggle()
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .foregroundColor(Color.AppPrimaryColor)
                        .padding()
//                              .background(Circle().fill(Color.purple))
                }
                VStack{
                HStack{
//                    Spacer()
                        Text("إختر الحجم")
                        .font(.custom(Fount_name.reguler.rawValue, size: 18))
                        Spacer()
                }.padding(.horizontal)
                    HStack{
                        Button(action: {}, label: {
                            Text("XL")
                            .font(.custom(Fount_name.reguler.rawValue, size: 18))
                        })
                        Button(action: {}, label: {
                            Text("XXL")
                            .font(.custom(Fount_name.reguler.rawValue, size: 18))
                        })
                        Button(action: {}, label: {
                            Text("L")
                            .font(.custom(Fount_name.reguler.rawValue, size: 18))
                        })
                        Button(action: {}, label: {
                            Text("XL")
                                .font(.custom(Fount_name.reguler.rawValue, size: 18))
                                .padding(3)
                                .foregroundColor(Color.white)
                        }).background(Color.AppPrimaryColor) .clipShape(Circle())
                    }.foregroundColor(.AppPrimaryColor)
                

                HStack{
//                    Spacer()
                        Text(" نطاق السعر ")
                        .font(.custom(Fount_name.reguler.rawValue, size: 18))
                        Spacer()
                }.padding(.horizontal)
                    HStack{
                       Text("dsa")
                    }.foregroundColor(.AppPrimaryColor)
                }
                Spacer()
                Text("Do your shit here")
                Spacer()
            }.frame(width: UIScreen.width*0.8, height: UIScreen.hight/2, alignment: .center).background(Color.white).cornerRadius(20)
        }//.ignoresSafeArea().background(Color.gray)
        
    }
}
