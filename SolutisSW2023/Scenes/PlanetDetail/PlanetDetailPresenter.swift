//
//  PlanetDetailPresenter.swift
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

protocol PlanetDetailPresentationLogic {
    func updateIsFavoritePlanet()
    func presentPlanetDetail(_ planet: PlanetModel)
    func formatDate(_ date: String) -> String
}

final class PlanetDetailPresenter: PlanetDetailPresentationLogic {
    // MARK: - Attributes
    
    weak var viewController: PlanetDetailDisplayLogic?
    
    // MARK: - Public Methods
    
    func formatDate(_ date: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT-3")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        
        guard let date = formatter.date(from: date) else { return "" }
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MM/yyyy"
            let outputString = outputFormatter.string(from: date)

        return outputString
    }
    
    func updateIsFavoritePlanet() {
        viewController?.updateIsFavoritePlanet()
    }
    
    func presentPlanetDetail(_ planet: PlanetModel) {
        let viewModel = PlanetDetail.FetchPlanetDetail.ViewModel(name: planet.name, rotationPeriod: planet.rotationPeriod, orbitalPeriod: planet.orbitalPeriod, diameter: planet.diameter, climate: planet.climate, gravity: planet.gravity, terrain: planet.terrain, surfaceWater: planet.surfaceWater, population: planet.population, residents: planet.residents, films: planet.films, created: planet.created, edited: planet.edited, url: planet.url)
        
        viewController?.updateUI(with: viewModel)
    }
}