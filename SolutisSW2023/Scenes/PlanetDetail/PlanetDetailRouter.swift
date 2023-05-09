//
//  PlanetDetailRouter.swift
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

@objc protocol PlanetDetailRoutingLogic {
  func goBackToPlanets()
}

protocol PlanetDetailDataPassing {
  var dataStore: PlanetDetailDataStore? { get }
}

final class PlanetDetailRouter: NSObject, PlanetDetailRoutingLogic, PlanetDetailDataPassing {
  weak var viewController: PlanetDetailViewController?
  var dataStore: PlanetDetailDataStore?
  
  // MARK: Routing
  
  func goBackToPlanets() {
      guard let destinationVC = viewController?.navigationController?.viewControllers.first(where: { $0 is PlanetViewController }) as? PlanetViewController else { return }
      var destinationDS = destinationVC.router!.dataStore!
      passDataToPlanet(source: dataStore!, destination: &destinationDS)
//      destinationVC.reloadTableViewData(with:)
      navigateBack(source: viewController!)
  }

  // MARK: Navigation
  
    func navigateBack(source: PlanetDetailViewController) {
      source.navigationController?.popViewController(animated: true)
  }
  
  // MARK: Passing data
  
  func passDataToPlanet(source: PlanetDetailDataStore, destination: inout PlanetDataStore) {
      guard let _ = destination.planetsResponse?.planets?.firstIndex(where: { $0.url == source.planet.url}) else { return }
//      destination.planetsResponse?.planets?[firstIndex].favorite = source.planet.favorite
  }
}
