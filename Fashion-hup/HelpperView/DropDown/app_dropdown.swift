//
//  app_dropdown.swift
//  Fashion-hup
//
//  Created by Sandal on 23/02/1443 AH.
//

import SwiftUI

struct app_dropdown: View {
    @Binding var shouldShowDropdown:Bool
    
    @Binding  var selectedOption: DropdownOption
    private let buttonHeight: CGFloat = 45
    @Binding var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    var placeholder: String = "إختر نوع السيارة"
    var width=UIScreen.width*0.9
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up" : "arrowtriangle.down")
                    .resizable()
                    .frame(width: 10, height:10)
                    .font(Font.custom(Fount_name.reguler.rawValue, size: 18))
                    .foregroundColor(Color.gray)
                    
                Spacer()
                Text(selectedOption == nil ? placeholder : selectedOption.value)
                    .font(Font.custom(Fount_name.reguler.rawValue, size: 18))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

//                Spacer()

                
            }.background(Color.clear)
        }
        
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width:width, height: self.buttonHeight)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                
                .stroke(Color.AppStrok, lineWidth: 1)
            
        )
        .overlay(
            
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color.clear)
        )

    }
}
