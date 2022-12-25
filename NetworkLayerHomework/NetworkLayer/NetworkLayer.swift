//
//  NetworkLayer.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import Foundation

protocol NetworkLayer {
    func getAllFruits(callback: @escaping FruitsCallback)
    func getQuote(callback: @escaping QuotesCallback)
    func getEpisode(callback: @escaping MovieCallback)
}
