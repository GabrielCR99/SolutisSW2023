//
//  PlanetDetailModels.swift
//  SolutisSW2023
//
//  Created by Gabriel Roveri on 03/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum PlanetDetail
{
    // MARK: Use cases
    
    enum FetchPlanetDetail
    {
        struct Request {}
        struct Response {}
        struct ViewModel
        {
            let name: String
            let rotationPeriod: String
            let orbitalPeriod: String
            let diameter: String
            let climate: String
            let gravity: String
            let terrain: String
            let surfaceWater: String
            let population: String
            let residents: Array<String>
            let films: Array<String>
            let created: String
            let edited: String
            let url: String
        }
    }
}