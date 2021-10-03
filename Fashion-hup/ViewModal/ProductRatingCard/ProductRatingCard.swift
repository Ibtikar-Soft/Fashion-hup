//
//  ProductRatingCard.swift
//  Fashion-hup
//
//  Created by Sandal on 23/02/1443 AH.
//

import SwiftUI

struct ProductRatingCard: View {
    var accountRating:ProductRating
    var body: some View {
            
//        HStack(alignment:, spacing:20){
        VStack{
        HStack( spacing:20){
            
            Image(default_profile_pic).resizable().frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment:.leading,spacing:5){
                Text(accountRating.delegateName).font(.custom(Fount_name.reguler.rawValue, size: 15))
                    .foregroundColor(.black).fixedSize(horizontal: false, vertical: true).lineLimit(nil)
//                Spacer()
                    
                HStack{
                    ForEach(1...accountRating.rate,id:\.self){image in
                        Image(systemName:"star.fill").foregroundColor(image <= accountRating.rate ? Color.yellow : Color.gray)
                    }
                }
                
            }
        Spacer()
        }
            Text(accountRating.comment).font(.custom(Fount_name.reguler.rawValue, size: 13))
                .foregroundColor(.gray).fixedSize(horizontal: false, vertical: true).lineLimit(nil)
        }.frame(width: 360).padding(20).cornerRadius(15).foregroundColor(.AppPrimaryColor).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.4)
            )
    }
}
