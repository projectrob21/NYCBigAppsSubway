//
//  JSONSerializer.swift
//  TrainNapper
//
//  Created by Robert Deans on 12/24/16.
//  Copyright © 2016 Robert Deans. All rights reserved.
//

import Foundation

typealias StationDictionary = [String:Station]

final class DataStore {
    
    static let sharedInstance = DataStore()
//    static let napper = Napper(coordinate: nil)

    var stationsDictionary = StationDictionary()
    // Napper Singleton!
    
    func getJSONStationsDictionary(with jsonFilename: String, completion: @escaping ([[String : Any]]) -> Void) {
        guard let filePath = Bundle.main.path(forResource: jsonFilename, ofType: "json") else { print("error unwrapping json file path"); return }
        
        do {
            let data = try NSData(contentsOfFile: filePath, options: NSData.ReadingOptions.uncached)
            
            guard let stationDictionary = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String : Any]] else { print("error typecasting json dictionary"); return }
            completion(stationDictionary)
        } catch {
            print("error reading data from file in json serializer")
        }
    }
    
    func populateSubwayStationsFromJSON() {

        getJSONStationsDictionary(with: "Subway") { subwayJSON in
            if let stationsDictionary = subwayJSON as? [[String : Any]] {
                for station in stationsDictionary.map({ Station(jsonData: $0) }) {
                    self.stationsDictionary[station.name] = station
                }
            }
        }
    }

    
    func populateAllStations() {
        stationsDictionary = [String:Station]()
        populateSubwayStationsFromJSON()
    }
}
