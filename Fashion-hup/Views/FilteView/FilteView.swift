//
//  FilteView.swift
//  Fashion-hup
//
//  Created by Sandal on 23/02/1443 AH.
//

import SwiftUI

struct FilteView: View {
    @Binding var advance_serch:Bool
    static var uniqueKey: String {
        UUID().uuidString
    }
    @State private var MshouldShowDropdown = false
    @State private var MselectedOption: DropdownOption = DropdownOption(key: "-1", value:
                                                                            " نوع المنتج")
    @State var carM: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "قمصان"),
        DropdownOption(key: uniqueKey, value: "جينز"),
        DropdownOption(key: uniqueKey, value: "احذية"),
        DropdownOption(key: uniqueKey, value: "رياضة")
        ]
    @State private var Clasifcation_shouldShowDropdown = false
    @State private var  Clasifcation_selectedOption: DropdownOption = DropdownOption(key: "-1", value: "الصنف")
    @State var  Clasifcation: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "جلد"),
        DropdownOption(key: uniqueKey, value: "قطن"),
        DropdownOption(key: uniqueKey, value: "كاجوال"),
        DropdownOption(key: uniqueKey, value: "نانو")
        ]
    var placeholder: [String] = [
        " نوع النتج",
    "الصنف",
        "الماركة"
    ]
    var body: some View {
        HStack( spacing:4){
//            Text("")
//                .font(.custom(Fount_name.reguler.rawValue, size: 15))
//                .foregroundColor(.black)
            SandalDropdownOption(shouldShowDropdown: $MshouldShowDropdown, selectedOption: $MselectedOption, options: $carM,placeholder:placeholder[0],width:UIScreen.width/3)
            Spacer()
            SandalDropdownOption(shouldShowDropdown: $Clasifcation_shouldShowDropdown, selectedOption: $Clasifcation_selectedOption, options: $carM,placeholder:placeholder[1],width:UIScreen.width/3).disabled(MshouldShowDropdown || (MselectedOption.key == "-1"))
            Spacer()
            Button(action: {
                print("xyz")
                advance_serch=true
            }, label: {
                VStack{
                    Image(systemName: "slider.horizontal.3").resizable().foregroundColor(.white).padding(7).padding(.horizontal,12)
                }.frame(width: 60, height: 40, alignment: .center).background(Color.AppPrimaryColor).cornerRadius(10)
            })
        }.padding(.horizontal)
    }
}

