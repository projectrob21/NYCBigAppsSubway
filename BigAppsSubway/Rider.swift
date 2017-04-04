//
//  Rider.swift
//  BigAppsSubway
//
//  Created by Robert Deans on 3/20/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import GoogleMaps

final class Rider {
    
    var coordinate: CLLocation?
    var destination = [Station]()
    var isUpdating = false
    
    init(coordinate: CLLocation?) {
        self.coordinate = coordinate
    }
    
}
