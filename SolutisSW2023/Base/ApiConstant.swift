//
//  ApiConstant.swift
//  SolutisSW2023
//
//  Created by Gabriel Roveri on 03/05/23.
//

import Foundation

struct ApiConstant {
    static let baseUrl = "https://swapi.dev/api"
}

typealias DefaultResponse<R: Decodable> = PlanetDefaultResponseModel<R>

struct PlanetDefaultResponseModel<R: Decodable>: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: R
}
