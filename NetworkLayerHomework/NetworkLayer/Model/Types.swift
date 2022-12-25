//
//  Types.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import Foundation

typealias FruitNetworkResult = Result<Array<FruitDatum>, NetworkError>

typealias FruitsCallback = (FruitNetworkResult) -> Void

typealias QuotesNetworkResult = Result<Array<CustomQuote>, NetworkError>

typealias QuotesCallback = (QuotesNetworkResult) -> Void

typealias MovieNetworkResult = Result<Array<MovieDatum>, NetworkError>

typealias MovieCallback = (MovieNetworkResult) -> Void

typealias FruitData = [FruitDatum]

typealias MovieData = [MovieDatum]
