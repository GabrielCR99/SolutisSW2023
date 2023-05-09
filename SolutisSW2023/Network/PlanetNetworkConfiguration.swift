//
//  PlanetNetworkConfiguration.swift
//  SolutisSW2023
//
//  Created by Gabriel Roveri on 03/05/23.
//

import Foundation

enum PlanetNetworkConfiguration {
    case fetchPlanets
}

extension PlanetNetworkConfiguration: Configuration {
    var baseURL: String { return ApiConstant.baseUrl }
    
    var path: String {
        switch self {
        case .fetchPlanets:
            return "/planets"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchPlanets:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchPlanets:
            return .requestPlain
        }
    }
}
