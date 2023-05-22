//
//  PlanetDetailInteractor.swift
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

protocol PlanetDetailBusinessLogic {
    func showPlanetDetail()
    func formatDate(_ date: String) -> String
}

protocol PlanetDetailDataStore {
    var planet: PlanetModel! { get set }
}

final class PlanetDetailInteractor: PlanetDetailBusinessLogic, PlanetDetailDataStore {

    // MARK: - Attributes

    var presenter: PlanetDetailPresentationLogic?
    var planet: PlanetModel!

    // MARK: - Methods

    func showPlanetDetail() {
        presenter?.presentPlanetDetail(planet)
    }

    func formatDate(_ date: String) -> String {
        return presenter?.formatDate(date) ?? ""
    }

}
