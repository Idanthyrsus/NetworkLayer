//
//  URLSession.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import Foundation

public class URLSessionLayer: NetworkLayer {

    public init() {}
    
    private let fruitAddress = "https://www.fruityvice.com/api/fruit/all"
    private let quoteAddress = "https://jsonplaceholder.typicode.com/albums"
    private let movieAddress = "https://api.sampleapis.com/simpsons/episodes"
    
    func getAllFruits(callback: @escaping FruitsCallback) {
        guard let url = URL(string: fruitAddress) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            
            do {
                let fruits = try JSONDecoder().decode(FruitData.self, from: data!)
                callback(Result.success(fruits))
            } catch {
                callback(.failure(.wrongJson("Wrong format")))
            }
            
        }.resume()
    }
    
    func getQuote(callback: @escaping QuotesCallback) {
        guard let url = URL(string: quoteAddress) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            
            do {
                let quotes = try JSONDecoder().decode([CustomQuote].self, from: data!)
                callback(Result.success(quotes))

            } catch {
                callback(.failure(.wrongJson("Wrong format")))
            }
            
        }.resume()
    }
    
    func getEpisode(callback: @escaping MovieCallback) {
        guard let url = URL(string: movieAddress) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            do {
                let episode = try JSONDecoder().decode(MovieData.self, from: data!)
                callback(Result.success(episode))
            } catch {
                callback(.failure(.wrongJson("Wrong format")))
            }
            
        }.resume()
    }
}
