//
//  categoryTabButton.swift
//  Fashion-hup
//
//  Created by Sandal on 22/02/1443 AH.
//

import SwiftUI

struct categoryTabButton: View {
    var title:SectionTag
    var animation:Namespace.ID
    @Binding var selected:Int
    var body: some View {
        HStack{
//            Image(systemName: "giftcard.fill").resizable().frame(width: 18, height: 18).foregroundColor(selected == title.tagID ? .white : .black)
        
        Button(action: {
            withAnimation(.spring()){
                selected = title.tagID
            }
        }){
            

                Text(title.tagName)
                    
            
        }
        }.font(.system(size: 15))
        .frame(width: 80)
        .foregroundColor(selected == title.tagID ? .white : .AppPrimaryColor)
        .padding(.vertical,10)
        .padding(.horizontal,selected == title.tagID ? 20 : 0)
        .background(
            ZStack{
                if selected == title.tagID{
                    Color.AppPrimaryColor
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            }
        ).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.4)
        )
        
    }
}

struct supCategoryTabButton: View {
    var title:CategoryTag
    var animation:Namespace.ID
    @Binding var selected:Int
    var body: some View {
        HStack{
//            Image(systemName: "giftcard.fill").resizable().frame(width: 18, height: 18).foregroundColor(selected == title.id ? .white : .black)
        
        Button(action: {
            withAnimation(.spring()){
                selected = title.id
            }
        }){
            

            Text(title.name)
                    
            
        }
        }.font(.system(size: 15))
        .frame(width: 80)
        .foregroundColor(selected == title.id ? .white : .AppPrimaryColor)
        .padding(.vertical,10)
        .padding(.horizontal,selected == title.id ? 20 : 0)
        .background(
            ZStack{
                if selected == title.id{
                    Color.AppPrimaryColor
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            }).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.4)
        )
        
    }
}
    struct ExtraFetuer{
        public var id = UUID()
        public  var name:String
        public var isAdded:Bool
        public  var price:Double
//    init(id:Int,name:String,isAdded:Bool,price:Double){
//        self.id=id
//        self.isAdded=isAdded
//        self.name=name
//        self.price=price
//    }
}
 var extraFetuer = [
    ExtraFetuer( name: "مخلل", isAdded: true, price: 40.0),ExtraFetuer( name: "جبنة", isAdded: false, price: 10),
    ExtraFetuer( name: "شيبس", isAdded: true, price: 40.0),ExtraFetuer( name: "مايونيز", isAdded: false, price: 10)
]
