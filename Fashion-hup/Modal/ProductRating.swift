//
//  ProductRating.swift
//  Fashion-hup
//
//  Created by Sandal on 23/02/1443 AH.
//

import SwiftUI

    struct ProductRating: Codable,Hashable {
            let id, rate: Int
            let rateDate: String?
            let delegateName: String
            let comment: String
        
        }
