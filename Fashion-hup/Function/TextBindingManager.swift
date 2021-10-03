//
//  TextBindingManager.swift
//  Fashion-hup
//
//  Created by Sandal on 21/02/1443 AH.
//

import Foundation
class TextBindingManager: ObservableObject {
   @Published var text = test_phone_number {
       didSet {
           if text.count > characterLimit && oldValue.count <= characterLimit {
               text = oldValue
            
           }
       }
   }
   let characterLimit: Int

   init(limit: Int = 9){
       characterLimit = limit
   }
}
