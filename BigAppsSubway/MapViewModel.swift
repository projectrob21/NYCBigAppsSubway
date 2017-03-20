//
//  LocationManager.swift
//  TrainNapper
//
//  Created by Robert Deans on 1/22/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import GoogleMaps

protocol AddToMapDelegate: class {
    func addStationsToMap(stations: StationDictionary)
}

protocol FilterBranchesDelegate: class {
    func filterBranches(branch: Branch, isHidden: Bool)
}

protocol SearchStationDelegate: class {
    func searchBarFilter(with text: String)
}

final class MapViewModel: NSObject {
    
    let store = DataStore.sharedInstance
    var stations: StationDictionary = [:]

    weak var addToMapDelegate: AddToMapDelegate?
    
    override init() {
        super.init()
        configure()
    }
    
    func configure() {
        store.populateAllStations()
        stations = store.stationsDictionary
    }
    
    
    func reloadStationsMap(with stations: StationDictionary) {
        print("reload stations")
        addToMapDelegate?.addStationsToMap(stations: stations)
    }
    
}


extension MapViewModel: SearchStationDelegate {
    
    func searchBarFilter(with text: String) {
        var searchStations = stations
        
        if text != "" {
            for (key, station) in searchStations {
                if !station.name.lowercased().contains(text) {
                    searchStations[key]?.isHidden = true
                } else {
                    searchStations[key]?.isHidden = false
                }
            }
            reloadStationsMap(with: searchStations)
        } else {
            for (key, _) in stations {
                searchStations[key]?.isHidden = false
            }
            reloadStationsMap(with: searchStations)
        }
    }
}



