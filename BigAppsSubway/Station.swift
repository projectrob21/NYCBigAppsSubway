//
//  Stations.swift
//  TrainNapper
//
//  Created by Robert Deans on 12/24/16.
//  Copyright © 2016 Robert Deans. All rights reserved.
//

import GoogleMaps

class Station {
    let name: String
    var isSelected = false
    var isHidden = false
    let coordinates: [Double]
    var coordinate2D: CLLocationCoordinate2D {
        get {
                return CLLocationCoordinate2D(latitude: coordinates.last! as CLLocationDegrees, longitude: coordinates.first! as CLLocationDegrees)

        }
    }
    var coordinateCL: CLLocation {

        get {
                return CLLocation(latitude: coordinates.last! as CLLocationDegrees, longitude: coordinates.first! as CLLocationDegrees)

        }
    }
    
    init(jsonData: [String : Any]) {
        self.name = jsonData["name"] as! String
        
        let geom = jsonData["the_geom"] as? [String : Any]
        
        let coordinates = geom?["coordinates"] as! [Double]
        
        print("COORINATES = \(coordinates)")
        self.coordinates = coordinates
        
    }
    
}

enum Branch {
    case LIRR, MetroNorth, NJTransit, unknown
}
