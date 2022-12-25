//
//  MovieModel.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 04.12.2022.
//


import Foundation

struct MovieDatum: Codable {
    let season, episode: Int?
    let name: String?
    let rating: Double?
    let movieDatumDescription, airDate: String?
    let thumbnailURL: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case season, episode, name, rating
        case movieDatumDescription = "description"
        case airDate
        case thumbnailURL = "thumbnailUrl"
        case id
    }
}

