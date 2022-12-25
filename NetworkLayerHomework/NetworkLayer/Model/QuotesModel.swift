//
//  PicturesModel.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

//   let quotesData = try? newJSONDecoder().decode(QuotesData.self, from: jsonData)

import Foundation

struct QuotesDatum: Codable {
    let userID, id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias QuotesData = [QuotesDatum]
