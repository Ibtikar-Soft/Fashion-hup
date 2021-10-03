//
//  GetShopItems.swift
//  Fashion-hup
//
//  Created by Sandal on 22/02/1443 AH.
//

import SwiftUI
import Foundation
import SwiftyJSON

struct GetShopItems: Decodable {
    var itemList: [ItemList]
        var sectionTag: [CategoryTag]?
    }

    struct ItemList: Codable ,Hashable{
        let shopID: Int
        let branchID: String
        let price: Double
        let itemName: String
        let itemID: Int
        let itemStatus: Bool
        let itemListDescription: String?
        let image: String
        let kcl, menuID: Int?
        enum CodingKeys: String, CodingKey {
            case shopID = "shopId"
            case branchID = "branchId"
            case price, itemName, itemID, itemStatus
            case itemListDescription = "description"
            case image, kcl
            case menuID = "menuId"
        }
    }

struct CategoryTag: Codable ,Hashable {
        let id: Int
        let name: String
        let sectionTagDescription: String?
        let status: Int
        let branchID: String
        let shopID: Int
        let createdDate: String?

        enum CodingKeys: String, CodingKey {
            case id, name
            case sectionTagDescription = "description"
            case status
            case branchID = "branchId"
            case shopID = "shopId"
            case createdDate
        }
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }


