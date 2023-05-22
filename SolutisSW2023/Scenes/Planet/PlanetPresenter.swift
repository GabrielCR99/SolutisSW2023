//
//  PlanetPresenter.swift
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

protocol PlanetPresentationLogic {
    func presentPlanets(response: Planet.FetchPlanets.Response)
    func showLoading()
    func hideLoading()
    func showError(_ error: ServiceError)
}

final class PlanetPresenter: PlanetPresentationLogic {
     var viewController: PlanetDisplayLogic?

    func showLoading() {
        viewController?.showLoading(title: "Carregando planetas")
    }

    func hideLoading() {
        viewController?.hideLoading()
    }

    func showError(_ error: ServiceError) {
        viewController?.showError(error)
    }

    // MARK: - Do something

    func presentPlanets(response: Planet.FetchPlanets.Response) {
        guard let planetsResponse = response.planets else { return  }

        let planets =  planetsResponse.map { model in
            return PlanetViewModel(
                name: model.name, rotationPeriod: model.rotationPeriod,
                orbitalPeriod: model.orbitalPeriod, diameter: model.diameter,
                climate: model.climate, gravity: model.gravity,
                terrain: model.terrain, surfaceWater: model.surfaceWater,
                population: model.population, residents: model.residents,
                films: model.films, created: model.created,
                edited: model.edited, url: model.url)
        }

        viewController?.reloadTableViewData(with: Planet.FetchPlanets.ViewModel(planets: planets))
    }
}
