//
//  PlanetModels.swift
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
import CoreData

enum Planet {
    // MARK: Use cases
    
    enum FetchPlanets {
        struct Request {}
        struct Response {
            let planets: [PlanetModel]?
            let error: ServiceError?
            
            init(planets: [PlanetModel]? = nil, error: ServiceError? = nil) {
                self.planets = planets
                self.error = error
            }
            
        }
        struct ViewModel {
            let planets: [PlanetViewModel]
        }
    }
}

// MARK: - Models

struct PlanetModel: Decodable {
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
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, climate, gravity, terrain, population, residents, films, created, edited, url
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case surfaceWater = "surface_water"
    }
}

struct PlanetViewModel {
    let id = UUID()
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    let isFavorte = false
}

// These methods are from CoreData, as seen in Alura's course
//extension PlanetViewModel {
//    func save(_ context: NSManagedObjectContext) {
//        do {
//            try context.save()
//        } catch {
//            debugPrint(error)
//        }
//    }
//
//    class func fetchRequest() -> NSFetchRequest<PlanetViewModel> {
//        return NSFetchRequest(entityName: "EntityPlanetViewModel")
//    }
//
//    class func fetch(_ fetchedResulstController: NSFetchedResultsController<PlanetViewModel>) {
//        do {
//            try fetchedResulstController.performFetch()
//        } catch {
//            debugPrint(error)
//        }
//    }
//}
