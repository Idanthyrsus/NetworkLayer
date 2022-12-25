//
//  Errors.swift
//  NetworkLayerHomework
//
//  Created by Alexander Korchak on 03.12.2022.
//

import Foundation

public enum NetworkError: Error {
    case custom(String)
    case emptyData
    case wrongJson(String)
}
