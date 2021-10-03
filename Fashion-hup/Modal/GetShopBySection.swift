//
//  GetShopBySection.swift
//  Fashion-hup
//
//  Created by Sandal on 22/02/1443 AH.
//

import SwiftUI

import Foundation
import CoreLocation
import SwiftyJSON
struct GetShopBySection: Decodable {
    var shopList: [ShopList]
        var sectionTag: [SectionTag]
    }

struct SectionTag: Codable ,Hashable {
    let tagID, sectionID: Int
    let tagName: String

    enum CodingKeys: String, CodingKey {
        case tagID = "tagId"
        case sectionID = "sectionId"
        case tagName
    }
}

struct ShopList: Codable,Hashable,Comparable {
    static func < (lhs: ShopList, rhs: ShopList) -> Bool {
//        return true
        return  false//getDistance(latitude1: lhs.x, longitude1: lhs.y,latitude2: rhs.x, longitude2: rhs.y)
    }
    
    static func == (lhs: ShopList, rhs: ShopList) -> Bool {
        return true
    }
    public var hashValue: Int {
            return 0
        }
    let shopID: Int
    let branchID, branchName, name: String
    let logo: String
    let status: Bool
    let x, y: String
    let rate: Int?
    let shopTag: [ShopTag]
    var greeting: Double {
        getDistancen(latitud: Double(x) ?? 0, longitud: Double(y) ?? 0)
       }
    enum CodingKeys: String, CodingKey {
        case shopID = "shopId"
        case branchID = "branchId"
        case branchName, name, logo, status, x, y, rate, shopTag
    }
    func getDistancen(latitud:Double,longitud:Double)//,latitude2:Double,longitude2:Double)
    ->Double{
        let coordinate0 = CLLocation(latitude: latitude, longitude: longitude)
        let coordinate1 = CLLocation(latitude: latitud, longitude: longitud)
//            let coordinate2 = CLLocation(latitude: latitude2, longitude: latitude2)
        let distanceInMeters_1 = coordinate0.distance(from: coordinate1)
//            let distanceInMeters_2 = coordinate0.distance(from: coordinate2)
                return Double(round(10*(distanceInMeters_1/1000))/10)// < Double(round(10*(distanceInMeters_2/1000))/10)
    //            print("\(distanceInMeters/1000)) km")
    //    return distanceInMeters_1
    }

}


struct ShopTag: Codable {
    let branchsTagsID, shopID, tagID: Int

    enum CodingKeys: String, CodingKey {
        case branchsTagsID = "branchsTagsId"
        case shopID = "shopId"
        case tagID = "tagId"
    }
}

//
//var shopBySection:GetShopBySection=GetShopBySection(shopList: [
//    ShopList(shopID: 1, branchID: "1", branchName: "sa", name: "sda", logo: "dsa", status: false, x: "12,323", y: "21.13", rate: 5, shopTag: [ShopTag(branchsTagsID: 1, shopID: 1, tagID: 1)])
//    ], sectionTag:  [
//    SectionTag(tagID: 11, sectionID: 1, tagName: "2")
//    ])
//
